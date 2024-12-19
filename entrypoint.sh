#!/bin/bash

set -eo pipefail

setOutput() {
  echo "${1}=${2}" >> "${GITHUB_OUTPUT}"
}

# https://nvd.nist.gov/vuln/detail/cve-2022-24765
git config --global --add safe.directory /github/workspace

git fetch --tags --recurse-submodules=no

versionFmt="^v?[0-9]+\.[0-9]+\.[0-9]+$"
version="$(git for-each-ref --sort=-v:refname --format '%(refname:lstrip=2)' | grep -E "$versionFmt" | head -n 1)"

# Set default tag if none is found
version="${version:="v0.0.0"}"
setOutput "currentVersion" "$version"

# Bump the patch version
newVersion=$(echo "${version}" | awk -F. -v OFS=. '{$NF += 1 ; print}')
setOutput "newVersion" "$newVersion"

# Set and push the new version tag
git tag -f "$newVersion"
git push -f origin "$newVersion"

