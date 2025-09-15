# Makefile for QML + Go Archive Wrapper (kat)

APP_NAME := kat
GO_CMD := go
QT_PREP := $(GO_CMD) run github.com/therecipe/qt/cmd/qtdeploy

all: build

# Prepare the QML resources (required by therecipe/qt)
prepare:
	$(QT_PREP) prep

# Build the binary
build: prepare
	$(QT_PREP) build desktop

# Clean generated files and binary
clean:
	$(QT_PREP) clean
	rm -f $(APP_NAME)

# Run without building
run:
	$(GO_CMD) run main.go

.PHONY: all prepare build clean run
