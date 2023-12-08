# instagram_flutter
We are going to build a flutter application using firebase as a backend.

# Packages Required:
cloud_firestore
firebase_core
firebase_auth
firebase_storage
image_picker
intl
provider
uuid

# setup firebase
command: flutterfire configure (To configure Firebase using cli);
pod install:
rm ios/Podfile
flutter pub upgrade
flutter pub run
cd ios
pod init
pod update
flutter clean && flutter run