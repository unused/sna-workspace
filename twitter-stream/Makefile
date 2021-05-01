
CMD=./run.sh

all: setup run

run:
	while :; do $(CMD); done

console:
	bundle exec ruby console.rb

setup:
	bundle install

clean:
	# rm -f *.jsonl
	echo "deactivated!"

.PHONY: all run setup clean
