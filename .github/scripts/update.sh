#!/usr/bin/env bash

RADARR_URL="https://radarr.servarr.com/v1/update/master/changes?runtime=netcore&os=linux"

LAST_VERSION=$(curl -SsL ${RADARR_URL} | jq .[0].version -r )

sed -i -e "s|RADARR_VERSION='.*'|RADARR_VERSION='${LAST_VERSION}'|" Dockerfile*

if output=$(git status --porcelain) && [ -z "$output" ]; then
  # Working directory clean
  echo "No new version available!"
else 
  # Uncommitted changes
  git commit -a -m "update to version: ${LAST_VERSION}"
  git push
fi
