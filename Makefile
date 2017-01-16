sync_gclient:
	cd src
	echo "target_os = [ 'android' ]" >> ../.gclient
	gclient sync

build_dependencies: sync_gclient
	build/install-build-deps-android.sh

run_hooks: build_dependencies
	gclient runhooks

config: run_hooks
	gn gen out/Default

build: config
	ninja -C out/Default chrome_public_apk

all: build
