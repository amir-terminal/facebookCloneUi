# Facebook Feed UI Study

A Flutter prototype focused on a social feed layout. It shows stories, rooms, posts, and tab navigation using sample data. [`lib/server/data.dart`](lib/server/data.dart) supplies the demo feed.

## Run locally

Use a Flutter SDK that bundles Dart 2 and satisfies the constraint in [`pubspec.yaml`](pubspec.yaml). Start an Android emulator or iOS simulator, or connect a device.

~~~bash
flutter pub get
flutter devices
flutter run
~~~

- [`lib/screens/`](lib/screens/) defines the feed and navigation.
- [`lib/widgets/`](lib/widgets/) contains the story cards, room row, and post widgets.
- [`lib/models/`](lib/models/) defines the user, story, and post models.
