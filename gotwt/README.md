
# gotwt

A minimalistic cross-plattform twitter crawler that reads streams and stores
them in jsonl files.

WIP/TODO Please not that instead of searching for tweets the client should
listen on a stream.

## Usage

Run the binary and forward the query items as comma-separated list of
arguments.

```sh
$ gotwt foo,b ar,ba z
# creates foo.jsonl bar.jsonl and baz.jsonl
```

The twitter credentials have to be present in environment variables.

```sh
#!/bin/sh

export API_KEY="<consumer-key>"
export API_SECRET="<consumer-secret>"

export ACCESS_TOKEN="<access-token>"
export ACCESS_TOKEN_SECRET="<access-secret>"

QUERY="slayer,sepultura,soulfly,sodom" make run
```
