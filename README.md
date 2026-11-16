# BringMe

BringMe is a Flutter mobile application for helping people keep track of the items they carry. It lets a user organise items into groups, record when an item was last handled, attach images, and associate an item with a location. The app also includes a shared lost-and-found flow and a lightweight feature-suggestion channel.

The project was built with FlutterFlow and extended with Flutter/Dart code and Firebase services.

## What it does

- Creates item groups and checklists for everyday belongings.
- Records item status, timestamps, images, and last-known locations.
- Shows item details and location history with map views and reverse geocoding.
- Supports local notifications and notification preferences to prompt users to check their items.
- Provides onboarding, authentication, and account-level data storage.
- Includes a community lost-and-found area backed by Firestore.
- Lets users submit feature suggestions.

## Architecture

| Area | Implementation |
| --- | --- |
| Mobile client | Flutter/Dart, generated FlutterFlow UI plus custom actions/widgets |
| Authentication and data | Firebase Authentication and Cloud Firestore |
| Media | Firebase Storage |
| Observability | Firebase Analytics and Crashlytics |
| Server-side automation | Firebase Cloud Functions |
| Maps and geocoding | Google Maps Flutter SDK and Google Geocoding API |
| Local state | SharedPreferences and Provider |

Firestore and Storage rules are kept in [`firebase/`](firebase/) alongside the Cloud Functions source.

## Local setup

This repository intentionally does **not** contain live Firebase or Google Maps credentials.

1. Install a compatible Flutter stable SDK and run `flutter pub get`.
2. Create your own Firebase project and add its configuration files locally:
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`
3. Add your Google Maps key locally:
   - Android: add `google.maps.api.key=YOUR_KEY` to `android/local.properties`.
   - iOS: replace `YOUR_GOOGLE_MAPS_API_KEY` in `ios/Runner/Info.plist`.
   - Web: pass the Firebase values and `GOOGLE_MAPS_API_KEY` via `--dart-define` when running or building.
4. For Firebase Functions, run `npm install` inside `firebase/functions/` and configure Firebase CLI access for your own project.
5. Run `flutter run`.

For example, a web run needs values similar to:

```bash
flutter run -d chrome \
  --dart-define=FIREBASE_WEB_API_KEY=... \
  --dart-define=FIREBASE_WEB_AUTH_DOMAIN=... \
  --dart-define=FIREBASE_WEB_PROJECT_ID=... \
  --dart-define=FIREBASE_WEB_STORAGE_BUCKET=... \
  --dart-define=FIREBASE_WEB_MESSAGING_SENDER_ID=... \
  --dart-define=FIREBASE_WEB_APP_ID=... \
  --dart-define=FIREBASE_WEB_MEASUREMENT_ID=... \
  --dart-define=GOOGLE_MAPS_API_KEY=...
```

## Repository hygiene

Generated build artifacts, dependency folders, signing data, and Firebase configuration files are ignored. Use restricted API keys and Firebase rules appropriate to the environment before deploying.
