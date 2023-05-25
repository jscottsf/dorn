PROJECT_BASE := $(shell pwd)
PROJECT_OUTPUT := $(PROJECT_BASE)/output

main: print-vars build build-linux-armv6

print-vars:
	@echo "Make vars..."
	@echo PROJECT_BASE=$(PROJECT_BASE)
	@echo PROJECT_OUTOUT=$(PROJECT_OUTPUT)

##
# main
##

.PHONY: build
build: fmt
	@echo "Running go build..."
	go build -o $(PROJECT_OUTPUT)/dorn main.go
	@printf "\e[32mSuccess!\e[39m\n"

.PHONY: build-linux-armv6
build-linux-armv6: fmt
	@echo "Running go build..."
	export GOOS=linux; \
	export GOARCH=arm; \
	export GOARM=6; \
	go build -o $(PROJECT_OUTPUT)/dorn-linux-armv6 main.go
	@printf "\e[32mSuccess!\e[39m\n"

.PHONY: fmt
fmt:
	@echo "Running gofmt..."
	gofmt -s -w .
	@printf "\e[32mSuccess!\e[39m\n"
