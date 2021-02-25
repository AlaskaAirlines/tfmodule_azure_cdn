all: brew install

brew:
	brew bundle --no-lock

install: brew
	git init
	pre-commit uninstall
	pre-commit install -f
	tfenv install
	go get -u golang.org/x/lint/golint

test:
	go get -u github.com/gruntwork-io/terratest/modules/terraform
	go get -u github.com/stretchr/testify/assert
	go test -v ./test/cdn_test.go	

.PHONY: brew install test
