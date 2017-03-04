# Redash input plugin for Embulk

embulk-input-redash is the Embulk input plugin for [Redash](https://redash.io).

## Overview

* **Plugin type**: input
* **Resume supported**: yes
* **Cleanup supported**: yes
* **Guess supported**: yes

## Configuration

- **url**: description (string, required)
- **api_key**: description (string, required)

## Example

```yaml
in:
  type: redash
  url: https://localhost:5000/api/queries/1234/results.json
  api_key: YOUR_REDASH_API_KEY
```

## Build

```
$ rake
```
