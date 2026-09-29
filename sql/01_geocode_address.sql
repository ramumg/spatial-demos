-- Page 3 (Geocoding): process "Save Geocoding Request"
-- Turns an address typed in APEX into an SDO_GEOMETRY with the eLocation geocoder.
declare
  l_geom         mdsys.sdo_geometry;
  l_country_code varchar2(2);
begin
  -- The geocoder is more accurate with an ISO country code
  l_country_code := case :P3_PAIS
                      when 'México'    then 'MX'
                      when 'Guatemala' then 'GT'
                      when 'Brasil'    then 'BR'
                      when 'Uruguay'   then 'UY'
                      when 'Argentina' then 'AR'
                      when 'Paraguay'  then 'PY'
                    end;

  l_geom := sdo_gcdr.eloc_geocode_as_geom(
              :P3_DIRECCION,
              :P3_CIUDAD,
              null,
              null,
              l_country_code);

  if l_geom is null then
    raise_application_error(-20001,
      'No location was found for this address. Please check the address, city and country.');
  end if;

  insert into laouc_geocode_requests (
    location_name, country_name, city_name, street_address,
    latitude, longitude, gc_geometry, geocode_status, processed_at)
  values (
    :P3_NOMBRE, :P3_PAIS, :P3_CIUDAD, :P3_DIRECCION,
    l_geom.sdo_point.y, l_geom.sdo_point.x, l_geom, 'GEOCODIFICADA', systimestamp);

  :P3_LATITUD  := l_geom.sdo_point.y;
  :P3_LONGITUD := l_geom.sdo_point.x;
  apex_application.g_print_success_message := 'Address geocoded and saved successfully.';
end;
