
.PHONY: start
start:
	podman start mongodb

.PHONY: stop
stop:
	podman stop mongodb

.PHONY: setup
setup:
	bundle install --path vendor

.PHONY: console
console:
	@bundle exec ruby ./console.rb

.PHONY: create-indexes
create-indexes:
	@bundle exec ruby ./create-indexes.rb

.PHONY: pre-process
pre-process:
	@bundle exec ruby ./pre-process.rb

.PHONY: import
import: $(patsubst %.jsonl,%.done,$(wildcard ./imports/*.jsonl))

%.done: %.jsonl
	@bundle exec ruby ./import.rb $< && touch $*.done

.PHONY: export
export:
	@bundle exec ruby ./export.rb
