FLUTTER_CMD=fvm flutter
DART_CMD=fvm dart
BUILD_APK_CMD=build apk --obfuscate --split-debug-info=./split-debug-info-development --no-tree-shake-icons 
BUILD_AAB_CMD=build appbundle
# ANDROID_DIR=$(shell cd "$(dir $(lastword $(MAKEFILE_LIST)))" && cd ../android && pwd)
ANDROID_DIR="android"
PUBSPEC_FILE=pubspec.yaml
GRADLE_FILE=$(ANDROID_DIR)/app/build.gradle
FLAVOR_PRODUCTION_ARGS=--target lib/main.dart --dart-define  --dart-define-from-file .env.production

.PHONY: menu build_development build_staging build_production clean pub_get

# Function to extract version from pubspec.yaml and versionCode from build.gradle
get_pubspec_version = $(shell grep '^version:' $(PUBSPEC_FILE) | awk '{print $$2}' | cut -d '+' -f1)
get_gradle_version_code = $(shell grep 'versionCode' $(GRADLE_FILE) | awk '{print $$2}')

build_apk:
	$(FLUTTER_CMD) $(BUILD_APK_CMD) $(FLAVOR_PRODUCTION_ARGS)

build_aab_ver:
	@current_build_name=$$(grep '^version:' $(PUBSPEC_FILE) | awk '{print $$2}' | cut -d '+' -f1); \
	current_version_code=$$(grep 'versionCode' $(GRADLE_FILE) | awk '{print $$2}'); \
	echo "Current build name (from pubspec.yaml): $$current_build_name"; \
	echo "Current version code (from build.gradle): $$current_version_code"; \
	read -p "Enter new build name (or press Enter to keep $$current_build_name): " build_name; \
	read -p "Enter new version code (or press Enter to keep $$current_version_code): " version_code; \
	build_name=$${build_name:-$$current_build_name}; \
	version_code=$${version_code:-$$current_version_code}; \
	$(FLUTTER_CMD) $(BUILD_AAB_CMD) $(FLAVOR_PRODUCTION_ARGS) --build-name=$$build_name --build-number=$$version_code

clean:
	$(FLUTTER_CMD) clean
	# cd $(ANDROID_DIR) && ./gradlew clean && cd ..

pub_get:
	$(FLUTTER_CMD) pub get

clean_n_get:
	$(MAKE) clean
	$(MAKE) pub_get

build_runner:
	${DART_CMD} run build_runner build -d

dart_fix:
	$(DART_CMD) fix --dry-run

dart_apply_fix:
	$(DART_CMD) fix --apply