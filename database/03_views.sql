-- Helper views used by the demo

create or replace view laouc_v_nearby_locations as
select a.location_id as origin_id,
       b.location_id,
       b.location_code,
       b.location_name,
       b.category,
       b.country_name,
       b.city_name,
       round(sdo_geom.sdo_distance(a.geom, b.geom, 0.005, 'unit=KM'), 2) as distance_km
from laouc_locations a
join laouc_locations b on a.location_id <> b.location_id;

create or replace view laouc_v_region_summary as
select r.region_id,
       r.region_code,
       r.region_name,
       r.country_name,
       r.city_name,
       count(l.location_id) as location_count
from laouc_regions r
left join laouc_locations l
  on sdo_anyinteract(r.geom, l.geom) = 'TRUE'
group by r.region_id, r.region_code, r.region_name, r.country_name, r.city_name;
