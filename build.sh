#!/usr/bin/env bash
# Assemble individual JSON files into data/all.json for the frontend.
# Run after adding/editing any community, organisation, directory, or funder file.
set -euo pipefail
cd "$(dirname "$0")"

node -e '
const fs = require("fs");
const path = require("path");

function readDir(dir) {
  if (!fs.existsSync(dir)) return [];
  return fs.readdirSync(dir)
    .filter(f => f.endsWith(".json"))
    .sort()
    .map(f => JSON.parse(fs.readFileSync(path.join(dir, f), "utf8")));
}

const data = {
  cities: JSON.parse(fs.readFileSync("data/cities.json", "utf8")),
  categories: JSON.parse(fs.readFileSync("data/categories.json", "utf8")),
  communities: readDir("communities"),
  organisations: readDir("organisations"),
  funders: readDir("funders"),
  directories: readDir("directories"),
  schedule: JSON.parse(fs.readFileSync("data/schedule.json", "utf8")),
  gaps: JSON.parse(fs.readFileSync("data/gaps.json", "utf8")),
};

fs.writeFileSync("data/all.json", JSON.stringify(data, null, 2) + "\n");
console.log(
  "Built data/all.json —",
  data.communities.length, "communities,",
  data.organisations.length, "organisations,",
  data.funders.length, "funders,",
  data.directories.length, "directories,",
  data.cities.length, "cities"
);
'
