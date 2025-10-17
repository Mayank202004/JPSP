# Folder Structure

```plaintext
├── .
│   └── README.md
│   └── FOLDER_STRUCTURE.md
│   └── .gitignore
│   ├── backend
│   │   └── package.json
│   │   └── .prettierrc
│   │   └── readme.md
│   │   └── package-lock.json
│   │   └── .gitignore
│   │   └── .prettierignore
│   │   ├── public
│   │   │   ├── images
│   │   │   │   └── .gitkeep
│   │   │   ├── temp
│   │   │   │   └── .gitkeep
│   │   ├── src
│   │   │   └── app.js
│   │   │   └── server.js
│   │   │   ├── utils
│   │   │   │   └── asyncHandler.js
│   │   │   │   └── ApiError.js
│   │   │   │   └── ApiResponse.js
│   │   │   │   └── cloudinary.js
│   │   │   ├── models
│   │   │   │   └── profile.model.js
│   │   │   │   └── admin.model.js
│   │   │   │   └── notification.model.js
│   │   │   │   └── user.model.js
│   │   │   │   └── institute.model.js
│   │   │   │   └── scholarship.model.js
│   │   │   │   └── application.model.js
│   │   │   ├── controllers
│   │   │   │   └── user.controller.js
│   │   │   │   └── application.controller.js
│   │   │   │   └── institute.controller.js
│   │   │   │   └── profile.controller.js
│   │   │   │   └── scholarship.controller.js
│   │   │   │   └── notification.controller.js
│   │   │   │   └── admin.controller.js
│   │   │   ├── routes
│   │   │   │   └── admin.routes.js
│   │   │   │   └── profile.routes.js
│   │   │   │   └── notification.routes.js
│   │   │   │   └── user.routes.js
│   │   │   │   └── application.routes.js
│   │   │   │   └── institute.routes.js
│   │   │   │   └── scholarship.routes.js
│   │   │   ├── middlewares
│   │   │   │   └── auth.middleware.js
│   │   │   │   └── multer.middleware.js
│   │   │   ├── validators
│   │   │   │   └── institute.validator.js
│   │   │   │   └── user.validator.js
│   │   │   │   └── admin.validator.js
│   │   │   │   └── profile.validator.js
│   │   │   │   └── scholarship.validator.js
│   │   │   ├── config
│   │   │   │   └── database.js
│   ├── App
│   │   └── analysis_options.yaml
│   │   └── README.md
│   │   └── pubspec.yaml
│   │   └── .metadata
│   │   └── pubspec.lock
│   │   └── .gitignore
│   │   ├── android
│   │   │   └── build.gradle
│   │   │   └── gradle.properties
│   │   │   └── settings.gradle
│   │   │   └── .gitignore
│   │   │   ├── gradle
│   │   │   │   ├── wrapper
│   │   │   │   │   └── gradle-wrapper.properties
│   │   │   ├── app
│   │   │   │   └── build.gradle
│   │   │   │   ├── src
│   │   │   │   │   ├── profile
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   ├── main
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   │   ├── res
│   │   │   │   │   │   │   ├── drawable
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-xxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-hdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values-night
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-xhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xxxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable-v21
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-mdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   ├── kotlin
│   │   │   │   │   │   │   ├── com
│   │   │   │   │   │   │   │   ├── jps
│   │   │   │   │   │   │   │   │   ├── pmsss
│   │   │   │   │   │   │   │   │   │   ├── pmsss
│   │   │   │   │   │   │   │   │   │   │   └── MainActivity.kt
│   │   │   │   │   ├── debug
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   ├── ios
│   │   │   └── .gitignore
│   │   │   ├── Runner.xcodeproj
│   │   │   │   └── project.pbxproj
│   │   │   │   ├── project.xcworkspace
│   │   │   │   │   └── contents.xcworkspacedata
│   │   │   │   │   ├── xcshareddata
│   │   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   │   ├── xcshareddata
│   │   │   │   │   ├── xcschemes
│   │   │   │   │   │   └── Runner.xcscheme
│   │   │   ├── Runner
│   │   │   │   └── AppDelegate.swift
│   │   │   │   └── Info.plist
│   │   │   │   └── Runner-Bridging-Header.h
│   │   │   │   ├── Base.lproj
│   │   │   │   │   └── Main.storyboard
│   │   │   │   │   └── LaunchScreen.storyboard
│   │   │   │   ├── Assets.xcassets
│   │   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   │   └── Icon-App-1024x1024@1x.png
│   │   │   │   │   │   └── Icon-App-76x76@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@2x.png
│   │   │   │   │   │   └── Icon-App-60x60@2x.png
│   │   │   │   │   │   └── Icon-App-60x60@3x.png
│   │   │   │   │   │   └── Icon-App-29x29@3x.png
│   │   │   │   │   │   └── Icon-App-40x40@3x.png
│   │   │   │   │   │   └── Icon-App-20x20@2x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   │   │   │   └── Icon-App-20x20@3x.png
│   │   │   │   │   │   └── Icon-App-40x40@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@1x.png
│   │   │   │   │   │   └── Icon-App-76x76@1x.png
│   │   │   │   │   │   └── Icon-App-20x20@1x.png
│   │   │   │   │   │   └── Icon-App-40x40@1x.png
│   │   │   │   │   ├── LaunchImage.imageset
│   │   │   │   │   │   └── README.md
│   │   │   │   │   │   └── LaunchImage.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── LaunchImage@3x.png
│   │   │   │   │   │   └── LaunchImage@2x.png
│   │   │   ├── Flutter
│   │   │   │   └── AppFrameworkInfo.plist
│   │   │   │   └── Release.xcconfig
│   │   │   │   └── Debug.xcconfig
│   │   │   ├── Runner.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   │   ├── xcshareddata
│   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   ├── RunnerTests
│   │   │   │   └── RunnerTests.swift
│   │   ├── assets
│   │   │   ├── rive
│   │   │   │   └── icons.riv
│   │   │   │   └── face_1.riv
│   │   │   │   └── theme_toggle_button.riv
│   │   │   │   └── rivebot.riv
│   │   │   │   └── menu_button.riv
│   │   │   ├── images
│   │   │   │   └── JP1.png
│   │   │   │   └── JP.png
│   │   ├── web
│   │   │   └── favicon.png
│   │   │   └── manifest.json
│   │   │   └── index.html
│   │   │   ├── icons
│   │   │   │   └── Icon-maskable-192.png
│   │   │   │   └── Icon-192.png
│   │   │   │   └── Icon-maskable-512.png
│   │   │   │   └── Icon-512.png
│   │   ├── test
│   │   │   └── widget_test.dart
│   │   ├── lib
│   │   │   └── main.dart
│   │   │   ├── widets
│   │   │   │   └── drawerRow.dart
│   │   │   │   └── transformer.dart
│   │   │   │   └── auth_input.dart
│   │   │   │   └── confirmDialog.dart
│   │   │   ├── utils
│   │   │   │   └── type_def.dart
│   │   │   │   └── env.dart
│   │   │   │   └── helper.dart
│   │   │   │   └── storage_keys.dart
│   │   │   ├── models
│   │   │   │   └── profileModel.dart
│   │   │   │   └── myAppliedSchemesModel.dart
│   │   │   │   └── tabItem.dart
│   │   │   │   └── scholarshipModel.dart
│   │   │   │   └── menuItem.dart
│   │   │   ├── theme
│   │   │   │   └── theme.dart
│   │   │   ├── controllers
│   │   │   │   └── mySchemesController.dart
│   │   │   │   └── settingController.dart
│   │   │   │   └── auth_controller.dart
│   │   │   │   └── scholarshipController.dart
│   │   │   │   └── profileController.dart
│   │   │   │   └── themeController.dart
│   │   │   ├── routes
│   │   │   │   └── route.dart
│   │   │   │   └── route_names.dart
│   │   │   ├── core
│   │   │   │   ├── network
│   │   │   │   │   └── token_service.dart
│   │   │   │   │   └── dio_client.dart
│   │   │   ├── views
│   │   │   │   ├── settings
│   │   │   │   │   └── settings.dart
│   │   │   │   ├── scholarships
│   │   │   │   │   └── scholarshipDetail.dart
│   │   │   │   │   └── scholarships.dart
│   │   │   │   │   └── myAppliedScholarships.dart
│   │   │   │   ├── displayDocument
│   │   │   │   │   └── displayDocument.dart
│   │   │   │   ├── profile
│   │   │   │   │   └── hostelDetails.dart
│   │   │   │   │   └── incomeDetails.dart
│   │   │   │   │   └── pastQualification.dart
│   │   │   │   │   └── MultiStepForm.dart
│   │   │   │   │   └── bankDetails.dart
│   │   │   │   │   └── profile.dart
│   │   │   │   │   └── educationalDetails.dart
│   │   │   │   │   └── addressDetails.dart
│   │   │   │   │   └── parentDetails.dart
│   │   │   │   │   └── domicileDetails.dart
│   │   │   │   │   └── personalDetails.dart
│   │   │   │   │   └── verifyProfile.dart
│   │   │   │   ├── drawerView
│   │   │   │   │   └── customDrawerView.dart
│   │   │   │   │   └── drawerView.dart
│   │   │   │   ├── auth
│   │   │   │   │   └── getStarted.dart
│   │   │   │   │   └── login.dart
│   │   │   │   │   └── register.dart
│   │   │   │   ├── homePage
│   │   │   │   │   └── homePage.dart
│   │   │   ├── services
│   │   │   │   └── storage_services.dart
│   ├── .idea
│   │   └── vcs.xml
│   │   └── other.xml
│   │   └── workspace.xml
```