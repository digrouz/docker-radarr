#!/usr/bin/env bash

RADARR_URL="https://api.github.com/repos/Radarr/Radarr/tags"


LAST_VERSION=$(curl -SsL ${RADARR_URL} | jq .[0].name -r )

sed -i -e "s|RADARR_VERSION='.*'|RADARR_VERSION='${LAST_VERSION}'|" Dockerfile_*

if output=$(git status --porcelain) && [ -z "$output" ]; then
  # Working directory clean
  echo "No new version available!"
else 
  # Uncommitted changes
  git commit -a -m "update to version: ${LAST_VERSION}"
  git push
fi
