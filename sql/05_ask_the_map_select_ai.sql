-- Page 11 (Ask the Map): Select AI + Spatial
-- Requires a Select AI profile named GENAI_PROFILE (see README).
-- The full page process in the app export also runs the generated SELECT with DBMS_SQL
-- and collects LOCATION_IDs to plot on the map layer.

declare
  -- Grounding: explain data values and teach the spatial rule
  l_ctx varchar2(2000) :=
    'Always return the LOCATION_ID and LOCATION_NAME columns of LAOUC_LOCATIONS when the question is about locations. '
 || 'Data values are in Spanish: CATEGORY is one of CENTRO_DISTRIBUCION (distribution center), CENTRO_SERVICIO (service center), '
 || 'SUCURSAL (branch), CLIENTE (client); OPERATIONAL_STATUS is ACTIVA (active) or PENDIENTE (pending). '
 || 'LAOUC_REGIONS.GEOM are coverage zone polygons; a location is covered when SDO_ANYINTERACT(r.GEOM, l.GEOM) = ''TRUE''. '
 || 'Distances in km: SDO_GEOM.SDO_DISTANCE(a.GEOM, b.GEOM, 0.005, ''unit=KM''). Answer in English. Question: ';
  l_q   varchar2(4000) := trim(coalesce(:P11_QUESTION, :P11_SAMPLE));
  l_sql clob;
begin
  -- 1. Ask: generate the SQL
  l_sql := dbms_cloud_ai.generate(prompt => l_ctx || l_q, profile_name => 'GENAI_PROFILE', action => 'showsql');
  :P11_SQL := dbms_lob.substr(l_sql, 4000, 1);

  -- 2. Answer: plain-language response
  :P11_ANSWER := dbms_lob.substr(
                   dbms_cloud_ai.generate(prompt => l_ctx || l_q, profile_name => 'GENAI_PROFILE', action => 'narrate'),
                   4000, 1);

  -- 3. Map it: only run read-only, single-statement SELECTs
  if regexp_like(l_sql, '^\s*(select|with)\s', 'in') and instr(l_sql, ';') = 0 then
    null; -- parse with DBMS_SQL, find the LOCATION_ID column, collect ids into :P11_IDS
  end if;
end;
