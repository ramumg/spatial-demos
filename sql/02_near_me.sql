-- Page 4 (Near Me)

-- Nearest 3 hubs to the selected origin, using the spatial index (SDO_NN)
select h.location_name as hub,
       case h.category
         when 'CENTRO_DISTRIBUCION' then 'Distribution Center'
         when 'CENTRO_SERVICIO'     then 'Service Center'
       end as hub_type,
       h.city_name || ', ' || h.country_name as city_country,
       round(sdo_nn_distance(1), 1) as distance_km
from laouc_locations h,
     laouc_locations o
where o.location_id = :P4_ORIGEN_ID
  and h.category in ('CENTRO_DISTRIBUCION', 'CENTRO_SERVICIO')
  and h.location_id <> o.location_id
  and sdo_nn(h.geom, o.geom, 'sdo_batch_size=10 unit=KM', 1) = 'TRUE'
order by distance_km
fetch first 3 rows only;

-- Everything within a radius (production form: the spatial index filters first)
with todas_las_ubicaciones as (
  select location_id as id, location_name, category, city_name, country_name, geom
  from laouc_locations
  union all
  select -request_id, location_name, 'GEOCODED', city_name, country_name, gc_geometry
  from laouc_geocode_requests
  where geocode_status = 'GEOCODIFICADA'
),
origen as (
  select location_id, geom from laouc_locations where location_id = :P4_ORIGEN_ID
)
select l.location_name as ubicacion,
       initcap(replace(l.category, '_', ' ')) as tipo,
       l.city_name || ', ' || l.country_name as ciudad_pais,
       round(sdo_geom.sdo_distance(o.geom, l.geom, 0.005, 'unit=KM'), 2) as distancia_km
from origen o
join todas_las_ubicaciones l on l.id <> o.location_id
where sdo_within_distance(l.geom, o.geom,
        'distance=' || :P4_RADIUS_KM || ' unit=KM') = 'TRUE'
order by distancia_km;
