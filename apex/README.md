# APEX application

Place the application export here as `f103.sql` (Location Intelligence LATAM).

## Import it

1. In your workspace, go to **App Builder → Import**, choose `f103.sql`, and install it.
2. Use the schema where you ran the scripts in `database/`.
3. Run the app. The Distribution Routes map stays blank until you add your own Spatial Studio project (below).

## Connect the Spatial Studio map (Page 6, Distribution Routes)

The Routes Map region is a Static Content region holding the Spatial Studio embed:

```html
<spatial-studio-project
  server-url="https://<your-adb-host>/spatialstudio/"
  project-id="<your-published-project-id>"
  token="YOUR_SPATIAL_STUDIO_TOKEN"
  project-header="off"
  layers-list="on">
</spatial-studio-project>
```

1. In Spatial Studio, build the project described in the main README and **publish** it.
2. From the published project's embed options, copy the server URL, project id and token.
3. In Page Designer, open **Page 6 → Routes Map → Source → HTML Code** and replace the three values. The region also loads the Spatial Studio embed script from `https://<your-adb-host>/spatialstudio/api/v1/...`; change its host to yours.

Never commit a real token. It grants access to your Spatial Studio project.
