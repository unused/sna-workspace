
# Data Management

A collection of scripts to management Twitter data.

## Usage

```sh
$ make import # import imports/*.jsonl files, adds a .done file when imported
$ make export # export data to exports/*.csv
$ make console # start a interactive session
# see Makefile for further actions
```

## Notes

Stores tweets and users in a mongodb. As a convention keep all attributes
immutable and only extend information by adding attributes with prefix `_`.

Use `background` indizes not to slow inserts and updates down.

The user decision tree categorizes users but has a static configuration.
