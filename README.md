# Redash input plugin for Embulk

[![Gem Version](https://badge.fury.io/rb/embulk-input-redash.svg)](https://badge.fury.io/rb/embulk-input-redash)
[![CircleCI](https://circleci.com/gh/ariarijp/embulk-input-redash.svg?style=svg)](https://circleci.com/gh/ariarijp/embulk-input-redash)

embulk-input-redash is the Embulk input plugin for [Redash](https://redash.io).

## Overview

* **Plugin type**: input
* **Resume supported**: no
* **Cleanup supported**: no
* **Guess supported**: yes

## Configuration

- **url**: URL of Query Result (string, required)
- **api_key**: API Key (string, required)

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
