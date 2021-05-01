
GOCMD=go

.PHONY: all
all: build exec

.PHONY: build
build:
	$(GOCMD) build -o bin/gotwt cmd/client.go

.PHONY: build
exec:
	./bin/gotwt $(QUERY)

.PHONY: run
run:
	$(GOCMD) run cmd/client.go $(QUERY)

.PHONY: clean
clean:
	rm -f *.jsonl
