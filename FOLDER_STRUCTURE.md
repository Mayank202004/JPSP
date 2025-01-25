# Folder Structure

```plaintext
├── .
│   └── FOLDER_STRUCTURE.md
│   └── README.md
│   ├── App
│   │   └── analysis_options.yaml
│   │   └── pubspec.yaml
│   │   └── .gitignore
│   │   └── .metadata
│   │   └── pubspec.lock
│   │   └── README.md
│   │   ├── ios
│   │   │   └── .gitignore
│   │   │   ├── RunnerTests
│   │   │   │   └── RunnerTests.swift
│   │   │   ├── Runner
│   │   │   │   └── AppDelegate.swift
│   │   │   │   └── Info.plist
│   │   │   │   └── Runner-Bridging-Header.h
│   │   │   │   ├── Base.lproj
│   │   │   │   │   └── LaunchScreen.storyboard
│   │   │   │   │   └── Main.storyboard
│   │   │   │   ├── Assets.xcassets
│   │   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   │   └── Icon-App-29x29@3x.png
│   │   │   │   │   │   └── Icon-App-40x40@3x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── Icon-App-40x40@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@1x.png
│   │   │   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   │   │   │   └── Icon-App-1024x1024@1x.png
│   │   │   │   │   │   └── Icon-App-76x76@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@1x.png
│   │   │   │   │   │   └── Icon-App-20x20@3x.png
│   │   │   │   │   │   └── Icon-App-60x60@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@2x.png
│   │   │   │   │   │   └── Icon-App-60x60@3x.png
│   │   │   │   │   │   └── Icon-App-20x20@1x.png
│   │   │   │   │   │   └── Icon-App-20x20@2x.png
│   │   │   │   │   │   └── Icon-App-76x76@1x.png
│   │   │   │   │   ├── LaunchImage.imageset
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── LaunchImage@3x.png
│   │   │   │   │   │   └── LaunchImage@2x.png
│   │   │   │   │   │   └── LaunchImage.png
│   │   │   │   │   │   └── README.md
│   │   │   ├── Runner.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   │   ├── xcshareddata
│   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   ├── Flutter
│   │   │   │   └── Debug.xcconfig
│   │   │   │   └── AppFrameworkInfo.plist
│   │   │   │   └── Release.xcconfig
│   │   │   ├── Runner.xcodeproj
│   │   │   │   └── project.pbxproj
│   │   │   │   ├── xcshareddata
│   │   │   │   │   ├── xcschemes
│   │   │   │   │   │   └── Runner.xcscheme
│   │   │   │   ├── project.xcworkspace
│   │   │   │   │   └── contents.xcworkspacedata
│   │   │   │   │   ├── xcshareddata
│   │   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   ├── lib
│   │   │   └── main.dart
│   │   │   ├── theme
│   │   │   │   └── theme.dart
│   │   │   ├── routes
│   │   │   │   └── route_names.dart
│   │   │   │   └── route.dart
│   │   │   ├── views
│   │   │   │   ├── drawerView
│   │   │   │   │   └── drawerView.dart
│   │   │   │   ├── profile
│   │   │   │   │   └── MultiStepForm.dart
│   │   │   │   │   └── profile.dart
│   │   │   │   │   └── profile2.dart
│   │   │   │   ├── homePage
│   │   │   │   │   └── homePage.dart
│   │   │   │   ├── scholarships
│   │   │   │   │   └── scholarships.dart
│   │   │   │   ├── auth
│   │   │   │   │   └── register.dart
│   │   │   │   │   └── login.dart
│   │   │   ├── utils
│   │   │   │   └── helper.dart
│   │   │   │   └── type_def.dart
│   │   │   │   └── env.dart
│   │   │   │   └── storage_keys.dart
│   │   │   ├── widets
│   │   │   │   └── auth_input.dart
│   │   │   ├── controllers
│   │   │   │   └── auth_controller.dart
│   │   │   ├── services
│   │   │   │   └── supabase_service.dart
│   │   │   │   └── storage_services.dart
│   │   ├── android
│   │   │   └── build.gradle
│   │   │   └── .gitignore
│   │   │   └── settings.gradle
│   │   │   └── gradle.properties
│   │   │   ├── app
│   │   │   │   └── build.gradle
│   │   │   │   ├── src
│   │   │   │   │   ├── profile
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   ├── main
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   │   ├── kotlin
│   │   │   │   │   │   │   ├── com
│   │   │   │   │   │   │   │   ├── jps
│   │   │   │   │   │   │   │   │   ├── pmsss
│   │   │   │   │   │   │   │   │   │   ├── pmsss
│   │   │   │   │   │   │   │   │   │   │   └── MainActivity.kt
│   │   │   │   │   │   ├── res
│   │   │   │   │   │   │   ├── drawable
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-xxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-xhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values-night
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-xxxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-mdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable-v21
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-hdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   ├── debug
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   ├── gradle
│   │   │   │   ├── wrapper
│   │   │   │   │   └── gradle-wrapper.properties
│   │   ├── test
│   │   │   └── widget_test.dart
│   │   ├── web
│   │   │   └── manifest.json
│   │   │   └── index.html
│   │   │   └── favicon.png
│   │   │   ├── icons
│   │   │   │   └── Icon-maskable-192.png
│   │   │   │   └── Icon-512.png
│   │   │   │   └── Icon-192.png
│   │   │   │   └── Icon-maskable-512.png
│   │   ├── assets
│   │   │   ├── images
│   │   │   │   └── JP1.png
│   │   │   │   └── JP.png
│   ├── backend
│   │   └── package-lock.json
│   │   └── readme.md
│   │   └── .prettierrc
│   │   └── .gitignore
│   │   └── package.json
│   │   └── .prettierignore
│   │   ├── src
│   │   │   └── server.js
│   │   │   └── app.js
│   │   │   ├── routes
│   │   │   │   └── user.routes.js
│   │   │   ├── models
│   │   │   │   └── user.model.js
│   │   │   ├── utils
│   │   │   │   └── cloudinary.js
│   │   │   │   └── ApiError.js
│   │   │   │   └── asyncHandler.js
│   │   │   │   └── ApiResponse.js
│   │   │   ├── middlewares
│   │   │   │   └── multer.middleware.js
│   │   │   │   └── auth.middleware.js
│   │   │   ├── config
│   │   │   │   └── database.js
│   │   │   ├── controllers
│   │   │   │   └── user.controller.js
│   │   │   ├── validators
│   │   │   │   └── user.validator.js
│   │   ├── public
│   │   │   ├── images
│   │   │   │   └── .gitkeep
│   │   │   ├── temp
│   │   │   │   └── .gitkeep
```