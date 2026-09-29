-- Page 6 (Distribution Routes): Routes Summary report
-- DRIVE_DISTANCE, DRIVE_TIME and ROUTE_GEOM are written back to LAOUC_LOCATIONS
-- by the Spatial Studio "Calculate driving route" analysis (destination: the CDMX distribution center).
select location_name                        as origen,
       city_name || ', ' || country_name    as ciudad_origen,
       round(drive_distance, 1)             as distancia_km,
       round(drive_time, 0)                 as tiempo_min
from laouc_locations
where route_geom is not null
  and drive_distance > 0
order by drive_time;

-- Straight-line distance to the CDMX distribution center, for comparison
select l.location_name,
       round(sdo_geom.sdo_distance(c.geom, l.geom, 0.005, 'unit=KM')) as straight_line_km,
       round(l.drive_distance, 1) as road_km,
       round(l.drive_time)        as drive_min
from laouc_locations l
join laouc_locations c on c.location_code = 'MX-CDMX-01'
where l.drive_distance > 0
order by road_km;
