depot_tools:
	git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

fetch_chromium: depot_tools
	mkdir chromium && cd chromium
	fetch --nohooks android
	cd src

sync_gclient: fetch_chromium
	echo "target_os = [ 'android' ]" >> ../.gclient
	gclient sync

build_dependencies: sync_gclient
	build/install-build-deps-android.sh

run_hooks: build_depepndencies
	gclient runhooks

config: run_hooks
	gn gen out/Default

build: config
	ninja -C out/Default chrome_public_apk

all: build
