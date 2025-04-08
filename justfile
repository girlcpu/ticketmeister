default:
	@just --list

build:
	swift build -c release

clean:
	swift package clean

build-macos-arm:
	swift build -c release --swift-sdk arm64-apple-macosx

build-linux-x86:
	swift build -c release --swift-sdk x86_64-linux-musl

build-linux-arm:
	swift build -c release --swift-sdk aarch64-linux-musl

build-all: build-macos-arm build-linux-x86 build-linux-arm
	@echo "Built for all platforms"

release: build-all
	@rm -rf release
	@mkdir -p release
	@cp -f .build/release/*/$(basename $(pwd)) release/$(basename $(pwd))-macos-arm64 || true
	@cp -f .build/release/*/$(basename $(pwd)) release/$(basename $(pwd))-linux-x86_64 || true
	@cp -f .build/release/*/$(basename $(pwd)) release/$(basename $(pwd))-linux-arm64 || true
	@echo "Release binaries placed in the release/ directory"

run *ARGS:
	swift run -c release {{ARGS}}
