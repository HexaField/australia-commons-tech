# Australian Commons Tech

Directory of commons-oriented tech communities across Australia — shared hardware, free software, and community infrastructure, city by city.

65 communities across 13 cities. Interactive map, weekly schedule, category and city filters, geolocation nearby sort.

## Structure

```
communities/          # One JSON file per community (source of truth)
directories/          # One JSON file per related external directory
data/
  cities.json         # City definitions (id, label, lat/lng, zoom)
  categories.json     # Category definitions (id, label, color)
  schedule.json       # Weekly schedule entries
  gaps.json           # Per-city gap analysis
  all.json            # Generated — assembled from all of the above
schema/
  community.json      # JSON Schema for community files
  directory.json      # JSON Schema for directory files
index.html            # Single-page app — loads data/all.json
build.sh              # Assembles individual files into data/all.json
```

## Adding a community

1. Create a JSON file in `communities/` following `schema/community.json`
2. Optionally add schedule entries to `data/schedule.json`
3. Run `./build.sh`
4. Open `index.html` in a browser to verify

## Serving locally

```bash
python3 -m http.server 8321
```
