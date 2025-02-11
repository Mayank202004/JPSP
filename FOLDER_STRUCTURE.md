# Folder Structure

```plaintext
├── .
│   └── README.md
│   └── FOLDER_STRUCTURE.md
│   ├── App
│   │   └── pubspec.lock
│   │   └── .gitignore
│   │   └── pubspec.yaml
│   │   └── analysis_options.yaml
│   │   └── .metadata
│   │   └── README.md
│   │   ├── ios
│   │   │   └── .gitignore
│   │   │   ├── Flutter
│   │   │   │   └── Release.xcconfig
│   │   │   │   └── AppFrameworkInfo.plist
│   │   │   │   └── Debug.xcconfig
│   │   │   ├── Runner
│   │   │   │   └── Info.plist
│   │   │   │   └── Runner-Bridging-Header.h
│   │   │   │   └── AppDelegate.swift
│   │   │   │   ├── Base.lproj
│   │   │   │   │   └── LaunchScreen.storyboard
│   │   │   │   │   └── Main.storyboard
│   │   │   │   ├── Assets.xcassets
│   │   │   │   │   ├── LaunchImage.imageset
│   │   │   │   │   │   └── LaunchImage.png
│   │   │   │   │   │   └── LaunchImage@2x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── README.md
│   │   │   │   │   │   └── LaunchImage@3x.png
│   │   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   │   └── Icon-App-60x60@3x.png
│   │   │   │   │   │   └── Icon-App-29x29@2x.png
│   │   │   │   │   │   └── Icon-App-1024x1024@1x.png
│   │   │   │   │   │   └── Icon-App-20x20@1x.png
│   │   │   │   │   │   └── Icon-App-40x40@1x.png
│   │   │   │   │   │   └── Icon-App-60x60@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@2x.png
│   │   │   │   │   │   └── Icon-App-76x76@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@3x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── Icon-App-20x20@2x.png
│   │   │   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@3x.png
│   │   │   │   │   │   └── Icon-App-76x76@1x.png
│   │   │   │   │   │   └── Icon-App-20x20@3x.png
│   │   │   │   │   │   └── Icon-App-29x29@1x.png
│   │   │   ├── Runner.xcodeproj
│   │   │   │   └── project.pbxproj
│   │   │   │   ├── xcshareddata
│   │   │   │   │   ├── xcschemes
│   │   │   │   │   │   └── Runner.xcscheme
│   │   │   │   ├── project.xcworkspace
│   │   │   │   │   └── contents.xcworkspacedata
│   │   │   │   │   ├── xcshareddata
│   │   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   ├── Runner.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   │   ├── xcshareddata
│   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   ├── RunnerTests
│   │   │   │   └── RunnerTests.swift
│   │   ├── android
│   │   │   └── settings.gradle
│   │   │   └── gradle.properties
│   │   │   └── .gitignore
│   │   │   └── build.gradle
│   │   │   ├── app
│   │   │   │   └── build.gradle
│   │   │   │   ├── src
│   │   │   │   │   ├── main
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   │   ├── res
│   │   │   │   │   │   │   ├── drawable
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-xhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-xxxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable-v21
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-mdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values-night
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-hdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   ├── kotlin
│   │   │   │   │   │   │   ├── com
│   │   │   │   │   │   │   │   ├── jps
│   │   │   │   │   │   │   │   │   ├── pmsss
│   │   │   │   │   │   │   │   │   │   ├── pmsss
│   │   │   │   │   │   │   │   │   │   │   └── MainActivity.kt
│   │   │   │   │   ├── debug
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   ├── profile
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   ├── gradle
│   │   │   │   ├── wrapper
│   │   │   │   │   └── gradle-wrapper.properties
│   │   ├── lib
│   │   │   └── main.dart
│   │   │   ├── services
│   │   │   │   └── supabase_service.dart
│   │   │   │   └── storage_services.dart
│   │   │   ├── widets
│   │   │   │   └── transformer.dart
│   │   │   │   └── auth_input.dart
│   │   │   ├── controllers
│   │   │   │   └── auth_controller.dart
│   │   │   ├── utils
│   │   │   │   └── env.dart
│   │   │   │   └── helper.dart
│   │   │   │   └── type_def.dart
│   │   │   │   └── storage_keys.dart
│   │   │   ├── routes
│   │   │   │   └── route.dart
│   │   │   │   └── route_names.dart
│   │   │   ├── theme
│   │   │   │   └── theme.dart
│   │   │   ├── views
│   │   │   │   ├── auth
│   │   │   │   │   └── login.dart
│   │   │   │   │   └── register.dart
│   │   │   │   │   └── getStarted.dart
│   │   │   │   ├── homePage
│   │   │   │   │   └── homePage.dart
│   │   │   │   ├── scholarships
│   │   │   │   │   └── scholarships.dart
│   │   │   │   ├── profile
│   │   │   │   │   └── MultiStepForm.dart
│   │   │   │   │   └── profile2.dart
│   │   │   │   │   └── profile.dart
│   │   │   │   ├── drawerView
│   │   │   │   │   └── drawerView.dart
│   │   ├── assets
│   │   │   ├── images
│   │   │   │   └── JP.png
│   │   │   │   └── JP1.png
│   │   │   ├── rive
│   │   │   │   └── face_1.riv
│   │   │   │   └── rivebot.riv
│   │   ├── web
│   │   │   └── favicon.png
│   │   │   └── index.html
│   │   │   └── manifest.json
│   │   │   ├── icons
│   │   │   │   └── Icon-maskable-512.png
│   │   │   │   └── Icon-512.png
│   │   │   │   └── Icon-maskable-192.png
│   │   │   │   └── Icon-192.png
│   │   ├── test
│   │   │   └── widget_test.dart
│   ├── backend
│   │   └── .prettierrc
│   │   └── .prettierignore
│   │   └── readme.md
│   │   └── .gitignore
│   │   └── package-lock.json
│   │   └── package.json
│   │   ├── src
│   │   │   └── server.js
│   │   │   └── app.js
│   │   │   ├── controllers
│   │   │   │   └── user.controller.js
│   │   │   │   └── profile.controller.js
│   │   │   ├── validators
│   │   │   │   └── user.validator.js
│   │   │   │   └── profile.validator.js
│   │   │   ├── utils
│   │   │   │   └── cloudinary.js
│   │   │   │   └── ApiResponse.js
│   │   │   │   └── asyncHandler.js
│   │   │   │   └── ApiError.js
│   │   │   ├── routes
│   │   │   │   └── user.routes.js
│   │   │   │   └── profile.routes.js
│   │   │   ├── config
│   │   │   │   └── database.js
│   │   │   ├── models
│   │   │   │   └── user.model.js
│   │   │   │   └── profile.model.js
│   │   │   ├── middlewares
│   │   │   │   └── multer.middleware.js
│   │   │   │   └── auth.middleware.js
│   │   ├── public
│   │   │   ├── images
│   │   │   │   └── .gitkeep
│   │   │   ├── temp
│   │   │   │   └── .gitkeep
```