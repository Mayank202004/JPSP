# Folder Structure

```plaintext
├── .
│   └── .gitignore
│   └── README.md
│   └── FOLDER_STRUCTURE.md
│   ├── .idea
│   │   └── workspace.xml
│   │   └── other.xml
│   │   └── vcs.xml
│   ├── backend
│   │   └── .gitignore
│   │   └── .prettierignore
│   │   └── readme.md
│   │   └── package.json
│   │   └── .prettierrc
│   │   └── package-lock.json
│   │   ├── src
│   │   │   └── app.js
│   │   │   └── server.js
│   │   │   ├── controllers
│   │   │   │   └── profile.controller.js
│   │   │   │   └── notification.controller.js
│   │   │   │   └── scholarship.controller.js
│   │   │   │   └── user.controller.js
│   │   │   │   └── application.controller.js
│   │   │   │   └── admin.controller.js
│   │   │   │   └── institute.controller.js
│   │   │   ├── config
│   │   │   │   └── database.js
│   │   │   ├── middlewares
│   │   │   │   └── auth.middleware.js
│   │   │   │   └── multer.middleware.js
│   │   │   ├── validators
│   │   │   │   └── user.validator.js
│   │   │   │   └── admin.validator.js
│   │   │   │   └── scholarship.validator.js
│   │   │   │   └── profile.validator.js
│   │   │   │   └── institute.validator.js
│   │   │   ├── routes
│   │   │   │   └── scholarship.routes.js
│   │   │   │   └── notification.routes.js
│   │   │   │   └── institute.routes.js
│   │   │   │   └── profile.routes.js
│   │   │   │   └── user.routes.js
│   │   │   │   └── application.routes.js
│   │   │   │   └── admin.routes.js
│   │   │   ├── models
│   │   │   │   └── institute.model.js
│   │   │   │   └── user.model.js
│   │   │   │   └── profile.model.js
│   │   │   │   └── admin.model.js
│   │   │   │   └── scholarship.model.js
│   │   │   │   └── notification.model.js
│   │   │   │   └── application.model.js
│   │   │   ├── utils
│   │   │   │   └── ApiError.js
│   │   │   │   └── cloudinary.js
│   │   │   │   └── ApiResponse.js
│   │   │   │   └── asyncHandler.js
│   │   ├── public
│   │   │   ├── images
│   │   │   │   └── .gitkeep
│   │   │   ├── temp
│   │   │   │   └── .gitkeep
│   ├── App
│   │   └── .gitignore
│   │   └── README.md
│   │   └── analysis_options.yaml
│   │   └── pubspec.yaml
│   │   └── .metadata
│   │   └── pubspec.lock
│   │   ├── android
│   │   │   └── .gitignore
│   │   │   └── build.gradle
│   │   │   └── settings.gradle
│   │   │   └── gradle.properties
│   │   │   ├── app
│   │   │   │   └── build.gradle
│   │   │   │   ├── src
│   │   │   │   │   ├── profile
│   │   │   │   │   │   └── AndroidManifest.xml
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
│   │   │   │   │   │   │   ├── mipmap-xhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-mdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── drawable-v21
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-xxxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values-night
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-hdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   ├── gradle
│   │   │   │   ├── wrapper
│   │   │   │   │   └── gradle-wrapper.properties
│   │   ├── web
│   │   │   └── favicon.png
│   │   │   └── manifest.json
│   │   │   └── index.html
│   │   │   ├── icons
│   │   │   │   └── Icon-maskable-512.png
│   │   │   │   └── Icon-maskable-192.png
│   │   │   │   └── Icon-512.png
│   │   │   │   └── Icon-192.png
│   │   ├── ios
│   │   │   └── .gitignore
│   │   │   ├── Runner
│   │   │   │   └── Info.plist
│   │   │   │   └── AppDelegate.swift
│   │   │   │   └── Runner-Bridging-Header.h
│   │   │   │   ├── Assets.xcassets
│   │   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   │   └── Icon-App-1024x1024@1x.png
│   │   │   │   │   │   └── Icon-App-60x60@3x.png
│   │   │   │   │   │   └── Icon-App-20x20@3x.png
│   │   │   │   │   │   └── Icon-App-76x76@1x.png
│   │   │   │   │   │   └── Icon-App-76x76@2x.png
│   │   │   │   │   │   └── Icon-App-20x20@1x.png
│   │   │   │   │   │   └── Icon-App-20x20@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@3x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── Icon-App-40x40@1x.png
│   │   │   │   │   │   └── Icon-App-29x29@3x.png
│   │   │   │   │   │   └── Icon-App-40x40@2x.png
│   │   │   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   │   │   │   └── Icon-App-60x60@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@1x.png
│   │   │   │   │   ├── LaunchImage.imageset
│   │   │   │   │   │   └── LaunchImage.png
│   │   │   │   │   │   └── README.md
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── LaunchImage@2x.png
│   │   │   │   │   │   └── LaunchImage@3x.png
│   │   │   │   ├── Base.lproj
│   │   │   │   │   └── Main.storyboard
│   │   │   │   │   └── LaunchScreen.storyboard
│   │   │   ├── Flutter
│   │   │   │   └── Release.xcconfig
│   │   │   │   └── Debug.xcconfig
│   │   │   │   └── AppFrameworkInfo.plist
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
│   │   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   ├── Runner.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   │   ├── xcshareddata
│   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   ├── test
│   │   │   └── widget_test.dart
│   │   ├── lib
│   │   │   └── main.dart
│   │   │   ├── views
│   │   │   │   ├── profile
│   │   │   │   │   └── verifyProfile.dart
│   │   │   │   │   └── MultiStepForm.dart
│   │   │   │   │   └── bankDetails.dart
│   │   │   │   │   └── pastQualification.dart
│   │   │   │   │   └── educationalDetails.dart
│   │   │   │   │   └── domicileDetails.dart
│   │   │   │   │   └── personalDetails.dart
│   │   │   │   │   └── profile.dart
│   │   │   │   │   └── hostelDetails.dart
│   │   │   │   │   └── parentDetails.dart
│   │   │   │   │   └── incomeDetails.dart
│   │   │   │   │   └── addressDetails.dart
│   │   │   │   ├── displayDocument
│   │   │   │   │   └── displayDocument.dart
│   │   │   │   ├── drawerView
│   │   │   │   │   └── drawerView.dart
│   │   │   │   │   └── customDrawerView.dart
│   │   │   │   ├── homePage
│   │   │   │   │   └── homePage.dart
│   │   │   │   ├── scholarships
│   │   │   │   │   └── scholarshipDetail.dart
│   │   │   │   │   └── myAppliedScholarships.dart
│   │   │   │   │   └── scholarships.dart
│   │   │   │   ├── auth
│   │   │   │   │   └── register.dart
│   │   │   │   │   └── getStarted.dart
│   │   │   │   │   └── login.dart
│   │   │   │   ├── settings
│   │   │   │   │   └── settings.dart
│   │   │   ├── core
│   │   │   │   ├── network
│   │   │   │   │   └── token_service.dart
│   │   │   │   │   └── dio_client.dart
│   │   │   ├── widets
│   │   │   │   └── drawerRow.dart
│   │   │   │   └── auth_input.dart
│   │   │   │   └── transformer.dart
│   │   │   │   └── confirmDialog.dart
│   │   │   ├── controllers
│   │   │   │   └── auth_controller.dart
│   │   │   │   └── profileController.dart
│   │   │   │   └── mySchemesController.dart
│   │   │   │   └── themeController.dart
│   │   │   │   └── scholarshipController.dart
│   │   │   │   └── settingController.dart
│   │   │   ├── services
│   │   │   │   └── storage_services.dart
│   │   │   ├── routes
│   │   │   │   └── route_names.dart
│   │   │   │   └── route.dart
│   │   │   ├── models
│   │   │   │   └── myAppliedSchemesModel.dart
│   │   │   │   └── scholarshipModel.dart
│   │   │   │   └── menuItem.dart
│   │   │   │   └── profileModel.dart
│   │   │   │   └── tabItem.dart
│   │   │   ├── utils
│   │   │   │   └── helper.dart
│   │   │   │   └── env.dart
│   │   │   │   └── storage_keys.dart
│   │   │   │   └── type_def.dart
│   │   │   ├── theme
│   │   │   │   └── theme.dart
│   │   ├── assets
│   │   │   ├── images
│   │   │   │   └── JP1.png
│   │   │   │   └── JP.png
│   │   │   ├── rive
│   │   │   │   └── menu_button.riv
│   │   │   │   └── theme_toggle_button.riv
│   │   │   │   └── icons.riv
│   │   │   │   └── face_1.riv
│   │   │   │   └── rivebot.riv
```