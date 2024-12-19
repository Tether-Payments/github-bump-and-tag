# GitHub Bump and Tag

A GitHub Action that increments a SemVer patch version number

# Usage
```yaml
jobs:
  deploy:
    steps:
        - name: Bump And Tag
          uses: Tether-Payments/github-bump-and-tag@v0.1.0
```

## Outputs
* currentVersion - the current version
* newVersion - the newly calculated version

### Usage
```yaml
${{ steps.tag_version.outputs.currentVersion }}
${{ steps.tag_version.outputs.newVersion }}
```
