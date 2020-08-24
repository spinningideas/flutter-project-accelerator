# Flutter Project Accelerator

Flutter project accelerator that can serve as reference for bootstrapping projects.

Includes localization via services based approach to
manage state and flutter itself for UX

STATUS: Alpha

Note: This repo is under active change and this code should be used as reference implementation ONLY and not used in a production application

## Getting Started

1. Read and install all things mentioned in flutter getting started guide

https://flutter.dev/docs/get-started/install

2. Setup editor - can use VS Code - https://flutter.dev/docs/get-started/editor?tab=vscode

3. Setup Device Emulator - Android: https://flutter.dev/docs/get-started/install/windows#set-up-your-android-device or iOS: https://flutter.dev/docs/get-started/flutter-for/ios-devs

4. Ensure a Device is available and running via emulator

5. Check that flutter development setup is ok:

```
flutter doctor
```

If things are not building try:

```
flutter clean
```

5. Run the app via terminal - type:

```
flutter run
```

## Features

- Global navigation via app header and drawer menu
- Search
- Localization via local json files and a service based approach
- Form validation

## Notes

### Navigation/Drawer

There are a number of ways to create a drawer and this project uses material version of Drawer with custom layout

- https://medium.com/flutter-community/flutter-push-pop-push-1bb718b13c31
- https://flutter.dev/docs/catalog/samples/basic-app-bar
- https://flutter.dev/docs/cookbook/design/drawer#4-close-the-drawer-programmatically
- https://github.com/ayalma/flutter_multi_page_drawer
- https://medium.com/flutter-community/navigate-without-context-in-flutter-with-a-navigation-service-e6d76e880c1c

### Layout

- https://flutter.dev/docs/development/ui/layout

### BLoC

Enable Reactive Programming via BLoC pattern - this project does not use this pattern but it can be useful

- https://medium.com/flutter-community/flutter-bloc-package-295b53e95c5c

### Storage

This project stores user selected language code in local data store

- https://pusher.com/tutorials/local-data-flutter

### Forms

### Search

- https://github.com/felangel/bloc/blob/master/examples/github_search/flutter_github_search/lib/search_form.dart

### Icons

- https://api.flutter.dev/flutter/material/Icons-class.html

### Localization

There are a number of ways to do localization - this project uses a service to manage converting localized keys to values stored in json for given locale. Below are some links for more traditional
approach using AppLocalizations class and delegates

- https://pub.dev/packages/flutter_i18n
- https://flutter.dev/docs/development/accessibility-and-localization/internationalization
- https://github.com/flutter/website/blob/master/examples/internationalization/minimal/lib/main.dart
- https://resocoder.com/2019/06/01/flutter-localization-the-easy-way-internationalization-with-json/

### Data

https://www.developerlibs.com/2018/11/flutter-how-to-parse-local-json-file-in.html

## General Resouces

- https://flutterawesome.com/
