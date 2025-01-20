# Folder Structure

```plaintext
├── .
│   └── FOLDER_STRUCTURE.md
│   └── README.md
│   ├── backend
│   │   └── .prettierrc
│   │   └── package-lock.json
│   │   └── .gitignore
│   │   └── readme.md
│   │   └── package.json
│   │   └── .prettierignore
│   │   ├── src
│   │   │   └── server.js
│   │   │   └── app.js
│   │   │   ├── models
│   │   │   │   └── user.model.js
│   │   │   ├── config
│   │   │   │   └── database.js
│   │   │   ├── middlewares
│   │   │   │   └── multer.middleware.js
│   │   │   ├── utils
│   │   │   │   └── ApiResponse.js
│   │   │   │   └── cloudinary.js
│   │   │   │   └── ApiError.js
│   │   │   │   └── asyncHandler.js
│   │   │   ├── controllers
│   │   │   │   └── .gitkeep
│   │   ├── public
│   │   │   ├── images
│   │   │   │   └── .gitkeep
│   │   │   ├── temp
│   │   │   │   └── .gitkeep
│   ├── App
│   │   └── pubspec.yaml
│   │   └── README.md
│   │   └── .gitignore
│   │   └── .metadata
│   │   └── analysis_options.yaml
│   │   └── pubspec.lock
│   │   ├── assets
│   │   │   ├── images
│   │   │   │   └── JP.png
│   │   │   │   └── JP1.png
│   │   ├── web
│   │   │   └── manifest.json
│   │   │   └── index.html
│   │   │   └── favicon.png
│   │   │   ├── icons
│   │   │   │   └── Icon-maskable-192.png
│   │   │   │   └── Icon-maskable-512.png
│   │   │   │   └── Icon-512.png
│   │   │   │   └── Icon-192.png
│   │   ├── android
│   │   │   └── build.gradle
│   │   │   └── .gitignore
│   │   │   └── settings.gradle
│   │   │   └── gradle.properties
│   │   │   ├── app
│   │   │   │   └── build.gradle
│   │   │   │   ├── src
│   │   │   │   │   ├── main
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   │   ├── res
│   │   │   │   │   │   │   ├── mipmap-xhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values-night
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── drawable
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-xxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── drawable-v21
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-hdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xxxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-mdpi
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
│   │   │   ├── routes
│   │   │   │   └── route.dart
│   │   │   │   └── route_names.dart
│   │   │   ├── widets
│   │   │   │   └── auth_input.dart
│   │   │   ├── views
│   │   │   │   ├── drawerView
│   │   │   │   │   └── drawerView.dart
│   │   │   │   ├── auth
│   │   │   │   │   └── login.dart
│   │   │   │   │   └── register.dart
│   │   │   │   ├── homePage
│   │   │   │   │   └── homePage.dart
│   │   │   │   ├── scholarships
│   │   │   │   │   └── scholarships.dart
│   │   │   │   ├── profile
│   │   │   │   │   └── profile2.dart
│   │   │   │   │   └── profile.dart
│   │   │   ├── services
│   │   │   │   └── storage_services.dart
│   │   │   │   └── supabase_service.dart
│   │   │   ├── utils
│   │   │   │   └── env.dart
│   │   │   │   └── helper.dart
│   │   │   │   └── type_def.dart
│   │   │   │   └── storage_keys.dart
│   │   │   ├── controllers
│   │   │   │   └── auth_controller.dart
│   │   │   ├── theme
│   │   │   │   └── theme.dart
│   │   ├── ios
│   │   │   └── .gitignore
│   │   │   ├── RunnerTests
│   │   │   │   └── RunnerTests.swift
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
│   │   │   ├── Flutter
│   │   │   │   └── Debug.xcconfig
│   │   │   │   └── AppFrameworkInfo.plist
│   │   │   │   └── Release.xcconfig
│   │   │   ├── Runner.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   │   ├── xcshareddata
│   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   ├── Runner
│   │   │   │   └── AppDelegate.swift
│   │   │   │   └── Runner-Bridging-Header.h
│   │   │   │   └── Info.plist
│   │   │   │   ├── Base.lproj
│   │   │   │   │   └── Main.storyboard
│   │   │   │   │   └── LaunchScreen.storyboard
│   │   │   │   ├── Assets.xcassets
│   │   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   │   └── Icon-App-76x76@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@1x.png
│   │   │   │   │   │   └── Icon-App-40x40@2x.png
│   │   │   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── Icon-App-20x20@3x.png
│   │   │   │   │   │   └── Icon-App-29x29@3x.png
│   │   │   │   │   │   └── Icon-App-20x20@1x.png
│   │   │   │   │   │   └── Icon-App-1024x1024@1x.png
│   │   │   │   │   │   └── Icon-App-60x60@2x.png
│   │   │   │   │   │   └── Icon-App-20x20@2x.png
│   │   │   │   │   │   └── Icon-App-76x76@1x.png
│   │   │   │   │   │   └── Icon-App-40x40@3x.png
│   │   │   │   │   │   └── Icon-App-40x40@1x.png
│   │   │   │   │   │   └── Icon-App-29x29@2x.png
│   │   │   │   │   │   └── Icon-App-60x60@3x.png
│   │   │   │   │   ├── LaunchImage.imageset
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── LaunchImage.png
│   │   │   │   │   │   └── README.md
│   │   │   │   │   │   └── LaunchImage@2x.png
│   │   │   │   │   │   └── LaunchImage@3x.png
│   │   ├── test
│   │   │   └── widget_test.dart
```