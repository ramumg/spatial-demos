-- Page 5 (Regional Coverage): how many sites fall inside each coverage zone
with todas_las_ubicaciones as (
  select geom from laouc_locations
  union all
  select gc_geometry from laouc_geocode_requests where geocode_status = 'GEOCODIFICADA'
)
select r.country_name as pais,
       r.city_name    as ciudad,
       r.region_name  as zona_operativa,
       count(u.geom)  as ubicaciones_cubiertas
from laouc_regions r
left join todas_las_ubicaciones u
  on sdo_anyinteract(r.geom, u.geom) = 'TRUE'
group by r.country_name, r.city_name, r.region_name
order by r.country_name, r.city_name;

-- Page 10 (Coverage Gaps): sites outside every coverage zone
select l.location_name
from laouc_locations l
where not exists (
  select 1
  from laouc_regions r
  where sdo_anyinteract(r.geom, l.geom) = 'TRUE');

-- Page 10: distance from each site to its nearest zone, with a recommendation
select l.location_name,
       min(sdo_geom.sdo_distance(r.geom, l.geom, 0.005, 'unit=KM')) as dist_km,
       case
         when min(sdo_geom.sdo_distance(r.geom, l.geom, 0.005, 'unit=KM')) = 0   then 'Covered'
         when min(sdo_geom.sdo_distance(r.geom, l.geom, 0.005, 'unit=KM')) <= 10  then 'Quick win: extend the existing zone'
         when min(sdo_geom.sdo_distance(r.geom, l.geom, 0.005, 'unit=KM')) <= 500 then 'Candidate for a new coverage zone'
         else 'Strategic expansion'
       end as recommendation
from laouc_locations l
cross join laouc_regions r
group by l.location_name
order by dist_km desc;
