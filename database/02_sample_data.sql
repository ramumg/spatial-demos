-- Location Intelligence LATAM: sample data (15 sites, 6 coverage zones)
-- Run after 01_tables.sql. Drive times/routes are filled later by Spatial Studio.
set define off

insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (1, 'MX-CDMX-01', 'Centro de Distribución CDMX', 'CENTRO_DISTRIBUCION', 'México', 'Ciudad de México', 'Av. Paseo de la Reforma 222', 19.4271, -99.1677, 'ACTIVA', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-99.1677, 19.4271, null), null, null));
insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (2, 'MX-CDMX-02', 'Cliente Roma Norte', 'CLIENTE', 'México', 'Ciudad de México', 'Calle Orizaba 42', 19.4194, -99.1624, 'ACTIVA', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-99.1624, 19.4194, null), null, null));
insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (3, 'MX-GDL-01', 'Sucursal Guadalajara', 'SUCURSAL', 'México', 'Guadalajara', 'Av. Vallarta 3959', 20.6736, -103.387, 'ACTIVA', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-103.387, 20.6736, null), null, null));
insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (4, 'GT-GUA-01', 'Centro de Servicio Guatemala', 'CENTRO_SERVICIO', 'Guatemala', 'Ciudad de Guatemala', 'Zona 10, Avenida Reforma', 14.5996, -90.515, 'ACTIVA', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-90.515, 14.5996, null), null, null));
insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (5, 'GT-GUA-02', 'Cliente Zona 14', 'CLIENTE', 'Guatemala', 'Ciudad de Guatemala', '5a Avenida 12-20', 14.5828, -90.5114, 'PENDIENTE', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-90.5114, 14.5828, null), null, null));
insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (6, 'BR-SAO-01', 'Hub São Paulo', 'CENTRO_DISTRIBUCION', 'Brasil', 'São Paulo', 'Av. Paulista 1578', -23.5614, -46.6559, 'ACTIVA', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-46.6559, -23.5614, null), null, null));
insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (7, 'BR-SAO-02', 'Cliente Vila Madalena', 'CLIENTE', 'Brasil', 'São Paulo', 'Rua Harmonia 342', -23.554, -46.691, 'ACTIVA', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-46.691, -23.554, null), null, null));
insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (8, 'BR-RIO-01', 'Sucursal Rio de Janeiro', 'SUCURSAL', 'Brasil', 'Rio de Janeiro', 'Av. Atlântica 1702', -22.9711, -43.1822, 'ACTIVA', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-43.1822, -22.9711, null), null, null));
insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (9, 'UY-MVD-01', 'Centro Operativo Montevideo', 'CENTRO_DISTRIBUCION', 'Uruguay', 'Montevideo', 'Rambla República de México 6125', -34.8771, -56.0797, 'ACTIVA', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-56.0797, -34.8771, null), null, null));
insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (10, 'UY-MVD-02', 'Cliente Pocitos', 'CLIENTE', 'Uruguay', 'Montevideo', 'Av. Brasil 2831', -34.9107, -56.1586, 'ACTIVA', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-56.1586, -34.9107, null), null, null));
insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (11, 'AR-BUE-01', 'Hub Buenos Aires', 'CENTRO_DISTRIBUCION', 'Argentina', 'Buenos Aires', 'Av. Corrientes 1500', -34.6037, -58.3816, 'ACTIVA', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-58.3816, -34.6037, null), null, null));
insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (12, 'AR-BUE-02', 'Cliente Palermo', 'CLIENTE', 'Argentina', 'Buenos Aires', 'Av. Santa Fe 3253', -34.5874, -58.4131, 'PENDIENTE', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-58.4131, -34.5874, null), null, null));
insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (13, 'AR-COR-01', 'Sucursal Córdoba', 'SUCURSAL', 'Argentina', 'Córdoba', 'Av. Colón 500', -31.4167, -64.1833, 'ACTIVA', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-64.1833, -31.4167, null), null, null));
insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (14, 'PY-ASU-01', 'Centro de Servicio Asunción', 'CENTRO_SERVICIO', 'Paraguay', 'Asunción', 'Aviadores del Chaco 2050', -25.2867, -57.5819, 'ACTIVA', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-57.5819, -25.2867, null), null, null));
insert into laouc_locations (location_id, location_code, location_name, category, country_name, city_name, street_address, latitude, longitude, operational_status, geocode_status, geom)
values (15, 'PY-ASU-02', 'Cliente Villa Morra', 'CLIENTE', 'Paraguay', 'Asunción', 'Senador Long 389', -25.2941, -57.5867, 'ACTIVA', 'SEED_COORDINATES', sdo_geometry(2001, 4326, sdo_point_type(-57.5867, -25.2941, null), null, null));

insert into laouc_regions (region_id, region_code, region_name, country_name, city_name, geom)
values (1, 'CDMX_CENTRO', 'Cobertura Centro CDMX', 'México', 'Ciudad de México', sdo_util.from_wktgeometry('POLYGON ((-99.19 19.4, -99.19 19.445, -99.14 19.445, -99.14 19.4, -99.19 19.4))', 4326));
insert into laouc_regions (region_id, region_code, region_name, country_name, city_name, geom)
values (2, 'GUA_CENTRO', 'Cobertura Ciudad de Guatemala', 'Guatemala', 'Ciudad de Guatemala', sdo_util.from_wktgeometry('POLYGON ((-90.535 14.565, -90.535 14.62, -90.49 14.62, -90.49 14.565, -90.535 14.565))', 4326));
insert into laouc_regions (region_id, region_code, region_name, country_name, city_name, geom)
values (3, 'SAO_CENTRO', 'Cobertura São Paulo', 'Brasil', 'São Paulo', sdo_util.from_wktgeometry('POLYGON ((-46.72 -23.59, -46.72 -23.53, -46.63 -23.53, -46.63 -23.59, -46.72 -23.59))', 4326));
insert into laouc_regions (region_id, region_code, region_name, country_name, city_name, geom)
values (4, 'MVD_COSTA', 'Cobertura Montevideo', 'Uruguay', 'Montevideo', sdo_util.from_wktgeometry('POLYGON ((-56.185 -34.93, -56.185 -34.855, -56.055 -34.855, -56.055 -34.93, -56.185 -34.93))', 4326));
insert into laouc_regions (region_id, region_code, region_name, country_name, city_name, geom)
values (5, 'BUE_CENTRO', 'Cobertura Buenos Aires', 'Argentina', 'Buenos Aires', sdo_util.from_wktgeometry('POLYGON ((-58.435 -34.63, -58.435 -34.57, -58.35 -34.57, -58.35 -34.63, -58.435 -34.63))', 4326));
insert into laouc_regions (region_id, region_code, region_name, country_name, city_name, geom)
values (6, 'ASU_CENTRO', 'Cobertura Asunción', 'Paraguay', 'Asunción', sdo_util.from_wktgeometry('POLYGON ((-57.61 -25.315, -57.61 -25.265, -57.555 -25.265, -57.555 -25.315, -57.61 -25.315))', 4326));

commit;

-- Keep identity columns ahead of the seeded ids
alter table laouc_locations modify location_id generated by default as identity (start with limit value);
alter table laouc_regions modify region_id generated by default as identity (start with limit value);
