# Folder Structure

```plaintext
├── .
│   └── FOLDER_STRUCTURE.md
│   └── .gitignore
│   └── README.md
│   ├── .idea
│   │   └── other.xml
│   │   └── vcs.xml
│   │   └── workspace.xml
│   ├── App
│   │   └── pubspec.yaml
│   │   └── .metadata
│   │   └── analysis_options.yaml
│   │   └── pubspec.lock
│   │   └── .gitignore
│   │   └── README.md
│   │   ├── android
│   │   │   └── settings.gradle
│   │   │   └── gradle.properties
│   │   │   └── build.gradle
│   │   │   └── .gitignore
│   │   │   ├── app
│   │   │   │   └── build.gradle
│   │   │   │   ├── src
│   │   │   │   │   ├── main
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   │   ├── kotlin
│   │   │   │   │   │   │   ├── com
│   │   │   │   │   │   │   │   ├── jps
│   │   │   │   │   │   │   │   │   ├── pmsss
│   │   │   │   │   │   │   │   │   │   ├── pmsss
│   │   │   │   │   │   │   │   │   │   │   └── MainActivity.kt
│   │   │   │   │   │   ├── res
│   │   │   │   │   │   │   ├── values-night
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── drawable-v21
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-hdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-xxxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-mdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   ├── profile
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   ├── debug
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   ├── gradle
│   │   │   │   ├── wrapper
│   │   │   │   │   └── gradle-wrapper.properties
│   │   ├── assets
│   │   │   ├── rive
│   │   │   │   └── icons.riv
│   │   │   │   └── rivebot.riv
│   │   │   │   └── theme_toggle_button.riv
│   │   │   │   └── face_1.riv
│   │   │   │   └── menu_button.riv
│   │   │   ├── images
│   │   │   │   └── JP1.png
│   │   │   │   └── JP.png
│   │   ├── lib
│   │   │   └── main.dart
│   │   │   ├── utils
│   │   │   │   └── storage_keys.dart
│   │   │   │   └── helper.dart
│   │   │   │   └── env.dart
│   │   │   │   └── type_def.dart
│   │   │   ├── theme
│   │   │   │   └── theme.dart
│   │   │   ├── models
│   │   │   │   └── profileModel.dart
│   │   │   │   └── menuItem.dart
│   │   │   │   └── scholarshipModel.dart
│   │   │   │   └── tabItem.dart
│   │   │   │   └── myAppliedSchemesModel.dart
│   │   │   ├── services
│   │   │   │   └── storage_services.dart
│   │   │   ├── widets
│   │   │   │   └── transformer.dart
│   │   │   │   └── confirmDialog.dart
│   │   │   │   └── auth_input.dart
│   │   │   │   └── drawerRow.dart
│   │   │   ├── routes
│   │   │   │   └── route.dart
│   │   │   │   └── route_names.dart
│   │   │   ├── core
│   │   │   │   ├── network
│   │   │   │   │   └── token_service.dart
│   │   │   │   │   └── dio_client.dart
│   │   │   ├── controllers
│   │   │   │   └── auth_controller.dart
│   │   │   │   └── profileController.dart
│   │   │   │   └── mySchemesController.dart
│   │   │   │   └── scholarshipController.dart
│   │   │   │   └── themeController.dart
│   │   │   │   └── settingController.dart
│   │   │   ├── views
│   │   │   │   ├── homePage
│   │   │   │   │   └── homePage.dart
│   │   │   │   ├── drawerView
│   │   │   │   │   └── drawerView.dart
│   │   │   │   │   └── customDrawerView.dart
│   │   │   │   ├── auth
│   │   │   │   │   └── register.dart
│   │   │   │   │   └── login.dart
│   │   │   │   │   └── getStarted.dart
│   │   │   │   ├── settings
│   │   │   │   │   └── settings.dart
│   │   │   │   ├── displayDocument
│   │   │   │   │   └── displayDocument.dart
│   │   │   │   ├── profile
│   │   │   │   │   └── incomeDetails.dart
│   │   │   │   │   └── verifyProfile.dart
│   │   │   │   │   └── profile.dart
│   │   │   │   │   └── domicileDetails.dart
│   │   │   │   │   └── pastQualification.dart
│   │   │   │   │   └── MultiStepForm.dart
│   │   │   │   │   └── personalDetails.dart
│   │   │   │   │   └── educationalDetails.dart
│   │   │   │   │   └── parentDetails.dart
│   │   │   │   │   └── bankDetails.dart
│   │   │   │   │   └── hostelDetails.dart
│   │   │   │   │   └── addressDetails.dart
│   │   │   │   ├── scholarships
│   │   │   │   │   └── myAppliedScholarships.dart
│   │   │   │   │   └── scholarships.dart
│   │   │   │   │   └── scholarshipDetail.dart
│   │   ├── ios
│   │   │   └── .gitignore
│   │   │   ├── Runner.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   │   ├── xcshareddata
│   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   ├── Runner
│   │   │   │   └── Runner-Bridging-Header.h
│   │   │   │   └── Info.plist
│   │   │   │   └── AppDelegate.swift
│   │   │   │   ├── Base.lproj
│   │   │   │   │   └── LaunchScreen.storyboard
│   │   │   │   │   └── Main.storyboard
│   │   │   │   ├── Assets.xcassets
│   │   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   │   └── Icon-App-40x40@1x.png
│   │   │   │   │   │   └── Icon-App-20x20@1x.png
│   │   │   │   │   │   └── Icon-App-76x76@2x.png
│   │   │   │   │   │   └── Icon-App-60x60@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@1x.png
│   │   │   │   │   │   └── Icon-App-40x40@2x.png
│   │   │   │   │   │   └── Icon-App-1024x1024@1x.png
│   │   │   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   │   │   │   └── Icon-App-20x20@2x.png
│   │   │   │   │   │   └── Icon-App-76x76@1x.png
│   │   │   │   │   │   └── Icon-App-29x29@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@3x.png
│   │   │   │   │   │   └── Icon-App-20x20@3x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── Icon-App-29x29@3x.png
│   │   │   │   │   │   └── Icon-App-60x60@3x.png
│   │   │   │   │   ├── LaunchImage.imageset
│   │   │   │   │   │   └── LaunchImage.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── LaunchImage@3x.png
│   │   │   │   │   │   └── LaunchImage@2x.png
│   │   │   │   │   │   └── README.md
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
│   │   │   ├── Flutter
│   │   │   │   └── AppFrameworkInfo.plist
│   │   │   │   └── Debug.xcconfig
│   │   │   │   └── Release.xcconfig
│   │   │   ├── RunnerTests
│   │   │   │   └── RunnerTests.swift
│   │   ├── test
│   │   │   └── widget_test.dart
│   │   ├── web
│   │   │   └── manifest.json
│   │   │   └── index.html
│   │   │   └── favicon.png
│   │   │   ├── icons
│   │   │   │   └── Icon-192.png
│   │   │   │   └── Icon-maskable-192.png
│   │   │   │   └── Icon-maskable-512.png
│   │   │   │   └── Icon-512.png
│   ├── backend
│   │   └── .prettierignore
│   │   └── package.json
│   │   └── readme.md
│   │   └── package-lock.json
│   │   └── .prettierrc
│   │   └── .gitignore
│   │   ├── src
│   │   │   └── app.js
│   │   │   └── server.js
│   │   │   ├── config
│   │   │   │   └── database.js
│   │   │   ├── utils
│   │   │   │   └── ApiResponse.js
│   │   │   │   └── asyncHandler.js
│   │   │   │   └── ApiError.js
│   │   │   │   └── cloudinary.js
│   │   │   ├── models
│   │   │   │   └── admin.model.js
│   │   │   │   └── profile.model.js
│   │   │   │   └── institute.model.js
│   │   │   │   └── scholarship.model.js
│   │   │   │   └── application.model.js
│   │   │   │   └── notification.model.js
│   │   │   │   └── user.model.js
│   │   │   ├── validators
│   │   │   │   └── institute.validator.js
│   │   │   │   └── admin.validator.js
│   │   │   │   └── user.validator.js
│   │   │   │   └── scholarship.validator.js
│   │   │   │   └── profile.validator.js
│   │   │   ├── routes
│   │   │   │   └── admin.routes.js
│   │   │   │   └── profile.routes.js
│   │   │   │   └── institute.routes.js
│   │   │   │   └── user.routes.js
│   │   │   │   └── scholarship.routes.js
│   │   │   │   └── notification.routes.js
│   │   │   │   └── application.routes.js
│   │   │   ├── controllers
│   │   │   │   └── scholarship.controller.js
│   │   │   │   └── profile.controller.js
│   │   │   │   └── notification.controller.js
│   │   │   │   └── admin.controller.js
│   │   │   │   └── application.controller.js
│   │   │   │   └── user.controller.js
│   │   │   │   └── institute.controller.js
│   │   │   ├── middlewares
│   │   │   │   └── auth.middleware.js
│   │   │   │   └── multer.middleware.js
│   │   ├── public
│   │   │   ├── temp
│   │   │   │   └── .gitkeep
│   │   │   ├── images
│   │   │   │   └── .gitkeep
```