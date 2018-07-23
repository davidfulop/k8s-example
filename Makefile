build-server:
	@docker build --build-arg version=$(VERSION) -t k8sexample .
.PHONY: build-server

run-server: build-server
	@docker run --rm --network=host -p 80:80 k8sexample
.PHONY: run-server

#tests
build-smoke-tests:
	docker build -t k8sexample-smoketests -f SmokeTests.Dockerfile .
.PHONY: build-smoke-tests

run-smoke-tests: build-smoke-tests
	docker run --rm --network=host k8sexample-smoketests
.PHONY: run-smoke-tests
