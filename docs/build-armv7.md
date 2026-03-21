```
flutter build apk --release --target-platform=android-arm --dart-define=DART_VM_PRODUCT=true
flutter build apk --release --target-platform=android-arm
adb -s 5200d78bfa479449 install -r build/app/outputs/flutter-apk/app-release.apk


flutter build apk --obfuscate --split-debug-info=./debug_info