SHELL = /bin/bash

test:
	@if test -z "$(VERSION)"; then echo "error VERSION is undefined, you can set VERSION=1.0"; exit 1; fi

build: test
	@echo "build theplant/node-chrome:$(VERSION) ..."
	@docker build -t "theplant/node-chrome:$(VERSION)" .

push: build
	docker tag "theplant/node-chrome:$(VERSION)" "theplant/node-chrome:$(VERSION)"
	docker push "theplant/node-chrome:$(VERSION)"
