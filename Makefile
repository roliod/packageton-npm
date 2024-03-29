default: help

## Display this message
help:
	@echo "Usage: make <target>"
	@echo "Available targets:"
	@awk '/^##/ {c=$$0}; /^[a-zA-Z_-]+:/ {gsub(":$$", "", $$1); gsub(/^#+/, "", c); printf "\033[36m%-30s\033[0m %s\n", $$1, c}; /^([^#]|$$)/ {c=""}' $(MAKEFILE_LIST)

## Start the application
start:
	npm start

## Install all dependencies
install:
	npm install

## Update all dependencies
update:
	npm update

## Run static code analysis
analyse-code:
	eslint .

## Run all analysis tasks
delivery: analyse-code