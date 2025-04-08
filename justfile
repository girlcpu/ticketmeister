default:
	@just --list

clean:
	swift package clean

[confirm]
deepclean: clean
	rm -rf .build/
	rm -rf .index-build/

update:
	swift package resolve
	swift package update

_build configuration sdk:
	swift build -c {{configuration}} --swift-sdk {{sdk}}

_run configuration *ARGS:
	swift run -c {{configuration}} {{ARGS}}

build:
	swift build -c release
build-macos-arm: (_build "release" "arm64-apple-macosx")
build-linux-x86: (_build "release" "x86_64-swift-linux-musl")
build-linux-arm: (_build "release" "aarch64-swift-linux-musl")
build-all: build-macos-arm build-linux-x86 build-linux-arm
	@echo "Built for all platforms"

run *ARGS: (_run "release" ARGS)
debug *ARGS: (_run "debug" ARGS)
