# Folder Structure

```plaintext
├── .
│   └── FOLDER_STRUCTURE.md
│   └── README.md
│   └── .gitignore
│   ├── .idea
│   │   └── workspace.xml
│   │   └── other.xml
│   │   └── vcs.xml
│   ├── App
│   │   └── analysis_options.yaml
│   │   └── README.md
│   │   └── .metadata
│   │   └── pubspec.lock
│   │   └── .gitignore
│   │   └── pubspec.yaml
│   │   ├── ios
│   │   │   └── .gitignore
│   │   │   ├── Runner.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   │   ├── xcshareddata
│   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   ├── Flutter
│   │   │   │   └── Release.xcconfig
│   │   │   │   └── AppFrameworkInfo.plist
│   │   │   │   └── Debug.xcconfig
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
│   │   │   ├── RunnerTests
│   │   │   │   └── RunnerTests.swift
│   │   │   ├── Runner
│   │   │   │   └── Info.plist
│   │   │   │   └── AppDelegate.swift
│   │   │   │   └── Runner-Bridging-Header.h
│   │   │   │   ├── Base.lproj
│   │   │   │   │   └── LaunchScreen.storyboard
│   │   │   │   │   └── Main.storyboard
│   │   │   │   ├── Assets.xcassets
│   │   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   │   └── Icon-App-20x20@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@3x.png
│   │   │   │   │   │   └── Icon-App-76x76@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@1x.png
│   │   │   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   │   │   │   └── Icon-App-60x60@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@3x.png
│   │   │   │   │   │   └── Icon-App-76x76@1x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── Icon-App-40x40@2x.png
│   │   │   │   │   │   └── Icon-App-20x20@3x.png
│   │   │   │   │   │   └── Icon-App-60x60@3x.png
│   │   │   │   │   │   └── Icon-App-29x29@2x.png
│   │   │   │   │   │   └── Icon-App-1024x1024@1x.png
│   │   │   │   │   │   └── Icon-App-20x20@1x.png
│   │   │   │   │   │   └── Icon-App-40x40@1x.png
│   │   │   │   │   ├── LaunchImage.imageset
│   │   │   │   │   │   └── README.md
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── LaunchImage@2x.png
│   │   │   │   │   │   └── LaunchImage@3x.png
│   │   │   │   │   │   └── LaunchImage.png
│   │   ├── assets
│   │   │   ├── images
│   │   │   │   └── JP1.png
│   │   │   │   └── JP.png
│   │   │   ├── rive
│   │   │   │   └── menu_button.riv
│   │   │   │   └── face_1.riv
│   │   │   │   └── icons.riv
│   │   │   │   └── rivebot.riv
│   │   │   │   └── theme_toggle_button.riv
│   │   ├── lib
│   │   │   └── main.dart
│   │   │   ├── controllers
│   │   │   │   └── profileController.dart
│   │   │   │   └── auth_controller.dart
│   │   │   │   └── settingController.dart
│   │   │   │   └── mySchemesController.dart
│   │   │   │   └── themeController.dart
│   │   │   │   └── scholarshipController.dart
│   │   │   ├── services
│   │   │   │   └── storage_services.dart
│   │   │   ├── views
│   │   │   │   ├── settings
│   │   │   │   │   └── settings.dart
│   │   │   │   ├── displayDocument
│   │   │   │   │   └── displayDocument.dart
│   │   │   │   ├── homePage
│   │   │   │   │   └── homePage.dart
│   │   │   │   ├── profile
│   │   │   │   │   └── parentDetails.dart
│   │   │   │   │   └── MultiStepForm.dart
│   │   │   │   │   └── personalDetails.dart
│   │   │   │   │   └── domicileDetails.dart
│   │   │   │   │   └── hostelDetails.dart
│   │   │   │   │   └── addressDetails.dart
│   │   │   │   │   └── verifyProfile.dart
│   │   │   │   │   └── incomeDetails.dart
│   │   │   │   │   └── bankDetails.dart
│   │   │   │   │   └── profile.dart
│   │   │   │   │   └── pastQualification.dart
│   │   │   │   │   └── educationalDetails.dart
│   │   │   │   ├── scholarships
│   │   │   │   │   └── scholarships.dart
│   │   │   │   │   └── scholarshipDetail.dart
│   │   │   │   │   └── myAppliedScholarships.dart
│   │   │   │   ├── drawerView
│   │   │   │   │   └── customDrawerView.dart
│   │   │   │   │   └── drawerView.dart
│   │   │   │   ├── auth
│   │   │   │   │   └── login.dart
│   │   │   │   │   └── register.dart
│   │   │   │   │   └── getStarted.dart
│   │   │   ├── models
│   │   │   │   └── scholarshipModel.dart
│   │   │   │   └── tabItem.dart
│   │   │   │   └── profileModel.dart
│   │   │   │   └── menuItem.dart
│   │   │   ├── utils
│   │   │   │   └── type_def.dart
│   │   │   │   └── storage_keys.dart
│   │   │   │   └── env.dart
│   │   │   │   └── helper.dart
│   │   │   ├── theme
│   │   │   │   └── theme.dart
│   │   │   ├── core
│   │   │   │   ├── network
│   │   │   │   │   └── token_service.dart
│   │   │   │   │   └── dio_client.dart
│   │   │   ├── routes
│   │   │   │   └── route.dart
│   │   │   │   └── route_names.dart
│   │   │   ├── widets
│   │   │   │   └── confirmDialog.dart
│   │   │   │   └── transformer.dart
│   │   │   │   └── drawerRow.dart
│   │   │   │   └── auth_input.dart
│   │   ├── android
│   │   │   └── gradle.properties
│   │   │   └── build.gradle
│   │   │   └── .gitignore
│   │   │   └── settings.gradle
│   │   │   ├── app
│   │   │   │   └── build.gradle
│   │   │   │   ├── src
│   │   │   │   │   ├── debug
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
│   │   │   │   │   │   │   ├── mipmap-xxxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable-v21
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-mdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-xhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-hdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values-night
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   ├── profile
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   ├── gradle
│   │   │   │   ├── wrapper
│   │   │   │   │   └── gradle-wrapper.properties
│   │   ├── test
│   │   │   └── widget_test.dart
│   │   ├── web
│   │   │   └── index.html
│   │   │   └── manifest.json
│   │   │   └── favicon.png
│   │   │   ├── icons
│   │   │   │   └── Icon-maskable-512.png
│   │   │   │   └── Icon-192.png
│   │   │   │   └── Icon-512.png
│   │   │   │   └── Icon-maskable-192.png
│   ├── backend
│   │   └── package.json
│   │   └── .prettierrc
│   │   └── .prettierignore
│   │   └── readme.md
│   │   └── package-lock.json
│   │   └── .gitignore
│   │   ├── src
│   │   │   └── server.js
│   │   │   └── app.js
│   │   │   ├── controllers
│   │   │   │   └── application.controller.js
│   │   │   │   └── user.controller.js
│   │   │   │   └── notification.controller.js
│   │   │   │   └── institute.controller.js
│   │   │   │   └── profile.controller.js
│   │   │   │   └── scholarship.controller.js
│   │   │   │   └── admin.controller.js
│   │   │   ├── config
│   │   │   │   └── database.js
│   │   │   ├── middlewares
│   │   │   │   └── multer.middleware.js
│   │   │   │   └── auth.middleware.js
│   │   │   ├── models
│   │   │   │   └── user.model.js
│   │   │   │   └── scholarship.model.js
│   │   │   │   └── institute.model.js
│   │   │   │   └── profile.model.js
│   │   │   │   └── notification.model.js
│   │   │   │   └── application.model.js
│   │   │   │   └── admin.model.js
│   │   │   ├── utils
│   │   │   │   └── ApiResponse.js
│   │   │   │   └── cloudinary.js
│   │   │   │   └── ApiError.js
│   │   │   │   └── asyncHandler.js
│   │   │   ├── routes
│   │   │   │   └── user.routes.js
│   │   │   │   └── scholarship.routes.js
│   │   │   │   └── institute.routes.js
│   │   │   │   └── application.routes.js
│   │   │   │   └── notification.routes.js
│   │   │   │   └── admin.routes.js
│   │   │   │   └── profile.routes.js
│   │   │   ├── validators
│   │   │   │   └── user.validator.js
│   │   │   │   └── scholarship.validator.js
│   │   │   │   └── institute.validator.js
│   │   │   │   └── profile.validator.js
│   │   │   │   └── admin.validator.js
│   │   ├── public
│   │   │   ├── temp
│   │   │   │   └── .gitkeep
│   │   │   ├── images
│   │   │   │   └── .gitkeep
```