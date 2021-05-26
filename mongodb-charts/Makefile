CMD=podman
NAME=mongodb-charts

.PHONY: setup
setup: create add-user

.PHONY: create
create:
	$(CMD) run --rm -it -d --name $(NAME) -p 8888:80 \
		-v `pwd`/charts-mongodb-uri:/run/secrets/charts-mongodb-uri:Z \
		-v `pwd`/keys:/mongodb-charts/volumes/keys:Z \
		-v `pwd`/logs:/mongodb-charts/volumes/logs:Z \
		quay.io/mongodb/charts

.PHONY: start
start:
	$(CMD) start $(NAME)

.PHONY: stop
stop:
	$(CMD) stop $(NAME)

.PHONY: add-user
add-user:
	sleep 20 && $(CMD) exec -it $(NAME) charts-cli add-user \
		--email "admin@example.com" --password "admin7" --role "UserAdmin"
