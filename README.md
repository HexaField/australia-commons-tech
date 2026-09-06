# Australian Commons Tech

Directory of commons-oriented tech communities, organisations, funders, and related directories across Australia — shared hardware, free software, and community infrastructure, city by city.

65 communities, 13 organisations, 7 funders, 13 directories across 13 cities. Interactive map, weekly schedule, category and city filters, geolocation nearby sort.

## Structure

```
communities/          # One JSON file per community group
organisations/        # One JSON file per non-profit, co-op, or social enterprise
funders/              # One JSON file per foundation, corporate, or industry funder
directories/          # One JSON file per related external directory
data/
  cities.json         # City definitions (id, label, lat/lng, zoom)
  categories.json     # Category definitions (id, label, color)
  schedule.json       # Weekly schedule entries
  gaps.json           # Per-city gap analysis (data preserved, hidden in UI)
  all.json            # Generated — assembled from all of the above
schema/
  community.json      # JSON Schema for community files
  organisation.json   # JSON Schema for organisation files
  funder.json         # JSON Schema for funder files
  directory.json      # JSON Schema for directory files
index.html            # Single-page app — loads data/all.json
build.sh              # Assembles individual files into data/all.json
```

## Entity types

| Type | Folder | Examples |
|---|---|---|
| Community | `communities/` | Meetup groups, hackerspaces, user groups |
| Organisation | `organisations/` | Non-profits, cooperatives, social enterprises, peak bodies |
| Funder | `funders/` | Foundations, corporate philanthropy, industry body grants |
| Directory | `directories/` | External directories and maps covering related verticals |

## Adding an entity

1. Create a JSON file in the appropriate folder following the matching schema in `schema/`
2. For communities, optionally add schedule entries to `data/schedule.json`
3. Run `./build.sh`
4. Open `index.html` in a browser to verify

## Serving locally

```bash
python3 -m http.server 8321
```
