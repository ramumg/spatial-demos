# Demo run sheet: Location Intelligence LATAM

## Before you go on stage

Run the whole demo once, 30 minutes before, in the browser you will present from.

- [ ] Sign in to APEX and Spatial Studio. Keep three tabs: the app, App Builder, and the Spatial Studio project.
- [ ] Click **Reset Demo** so Geocoding and Ask the Map start clean.
- [ ] Open Distribution Routes once. The Spatial Studio embed is slow on its first load.
- [ ] Run one Ask the Map question to warm up the `GENAI_PROFILE` Select AI profile.
- [ ] Zoom the browser to about 125% so SQL and map labels read from the back of the room.
- [ ] Keep the deck's screenshots (slides 8–11, 14) as the fallback if Wi-Fi drops.

## Demo stops

The pattern every time: show the page, run one action, then open it in Page Designer and point at the one piece of SQL or PL/SQL that does the work.

| After slide | App page | Click and show | Say | Page Designer: point at |
| --- | --- | --- | --- | --- |
| 7 | Home, Locations Map (p. 2) | Menu matches the 5 steps on slide 7. Toggle the Density (Heat Map) layer, click a point. | "Every page reads the same tables." | Map region → Layers: Locations, Density (Heat Map), Geocoded Locations. |
| 8–9 | Geocoding (p. 3) | Enter Paseo de la Reforma 222, Ciudad de México, México → Geocode. Go back to Home to show the new point. | "Text in, geometry out, in one PL/SQL call." | Process *Save Geocoding Request* ([sql/01](../sql/01_geocode_address.sql)). |
| 10 | Near Me (p. 4), Regional Coverage (p. 5) | Pick an origin, change the radius. Show *Nearest 3 Hubs*. Then the coverage map and summary. | "Near, nearest, inside: three operators." | [sql/02](../sql/02_near_me.sql), [sql/03](../sql/03_coverage.sql). |
| 11 | Coverage Gaps (p. 10) | KPI cards, then *Sites Outside Coverage*. | Carrasco ~1 km: extend. Rio 358 km, Guadalajara 459 km: new zones. Córdoba 640 km: strategic. | Cards and report source: distance to every zone, nearest wins, CASE gives the recommendation. |
| 14 | Distribution Routes (p. 6) | Walk the map legend, then the Routes Summary table. | "Straight line 462 km, by road 547 km. Guatemala: 1,455 km, about 18 h." | See below. |
| 20 | Ask the Map (p. 11) | Ask the three questions from slide 20. Show the answer, the SQL and the map. | "Same spatial engine as Coverage Gaps, in plain language." | Process *Ask Select AI* ([sql/05](../sql/05_ask_the_map_select_ai.sql)). |

## Page Designer: Distribution Routes (Page 6)

1. **Rendering tree.** Three regions: the intro text, *Routes Map*, and the *Routes Summary* Interactive Report.
2. **Routes Map → Source → HTML Code.** A Static Content region with the `<spatial-studio-project>` embed. No iframe, no JavaScript. Keep the token off screen.
3. **Routes Summary → Source → SQL Query.** Reads `LAOUC_LOCATIONS` directly: the drive time, distance and route that Spatial Studio wrote back.
4. **Columns.** English headings over Spanish aliases, all declarative.
5. **Optional contrast.** Page 2's native Map region layers, to set up slide 14's "when to use which".

## Timing

| Part | Slides | Minutes |
| --- | --- | --- |
| Opening and architecture | 1–7 | 8 |
| Demos with their slides | 8–14 | 20 |
| Select AI | 15–19 | 5 |
| Ask the Map | 20 | 5 |
| Close and Q&A | 21–24 | 7 |

## If something breaks

- **Studio embed stays blank:** refresh once, or open the project in Spatial Studio.
- **Ask the Map errors:** show Coverage Gaps instead. Same spatial logic, written by hand.
- **Geocoding finds nothing:** use a well-known address and a country the process maps to an ISO code.
