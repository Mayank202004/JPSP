# Folder Structure

```plaintext
├── .
│   └── FOLDER_STRUCTURE.md
│   └── .gitignore
│   └── README.md
│   ├── backend
│   │   └── package-lock.json
│   │   └── .gitignore
│   │   └── .prettierignore
│   │   └── package.json
│   │   └── .prettierrc
│   │   └── readme.md
│   │   ├── public
│   │   │   ├── temp
│   │   │   │   └── .gitkeep
│   │   │   ├── images
│   │   │   │   └── .gitkeep
│   │   ├── src
│   │   │   └── server.js
│   │   │   └── app.js
│   │   │   ├── models
│   │   │   │   └── profile.model.js
│   │   │   │   └── scholarship.model.js
│   │   │   │   └── user.model.js
│   │   │   │   └── application.model.js
│   │   │   │   └── institute.model.js
│   │   │   │   └── admin.model.js
│   │   │   │   └── notification.model.js
│   │   │   ├── controllers
│   │   │   │   └── admin.controller.js
│   │   │   │   └── application.controller.js
│   │   │   │   └── institute.controller.js
│   │   │   │   └── notification.controller.js
│   │   │   │   └── user.controller.js
│   │   │   │   └── scholarship.controller.js
│   │   │   │   └── profile.controller.js
│   │   │   ├── validators
│   │   │   │   └── admin.validator.js
│   │   │   │   └── user.validator.js
│   │   │   │   └── scholarship.validator.js
│   │   │   │   └── profile.validator.js
│   │   │   │   └── institute.validator.js
│   │   │   ├── utils
│   │   │   │   └── cloudinary.js
│   │   │   │   └── ApiResponse.js
│   │   │   │   └── ApiError.js
│   │   │   │   └── asyncHandler.js
│   │   │   ├── routes
│   │   │   │   └── profile.routes.js
│   │   │   │   └── institute.routes.js
│   │   │   │   └── scholarship.routes.js
│   │   │   │   └── user.routes.js
│   │   │   │   └── admin.routes.js
│   │   │   │   └── notification.routes.js
│   │   │   │   └── application.routes.js
│   │   │   ├── middlewares
│   │   │   │   └── auth.middleware.js
│   │   │   │   └── multer.middleware.js
│   │   │   ├── config
│   │   │   │   └── database.js
│   ├── App
│   │   └── .gitignore
│   │   └── README.md
│   │   └── analysis_options.yaml
│   │   └── pubspec.lock
│   │   └── pubspec.yaml
│   │   └── .metadata
│   │   ├── web
│   │   │   └── manifest.json
│   │   │   └── index.html
│   │   │   └── favicon.png
│   │   │   ├── icons
│   │   │   │   └── Icon-512.png
│   │   │   │   └── Icon-maskable-512.png
│   │   │   │   └── Icon-192.png
│   │   │   │   └── Icon-maskable-192.png
│   │   ├── android
│   │   │   └── build.gradle
│   │   │   └── .gitignore
│   │   │   └── gradle.properties
│   │   │   └── settings.gradle
│   │   │   ├── app
│   │   │   │   └── build.gradle
│   │   │   │   ├── src
│   │   │   │   │   ├── profile
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   ├── debug
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   ├── main
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   │   ├── res
│   │   │   │   │   │   │   ├── values
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── drawable-v21
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-mdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-hdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values-night
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-xxxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   ├── kotlin
│   │   │   │   │   │   │   ├── com
│   │   │   │   │   │   │   │   ├── jps
│   │   │   │   │   │   │   │   │   ├── pmsss
│   │   │   │   │   │   │   │   │   │   ├── pmsss
│   │   │   │   │   │   │   │   │   │   │   └── MainActivity.kt
│   │   │   ├── gradle
│   │   │   │   ├── wrapper
│   │   │   │   │   └── gradle-wrapper.properties
│   │   ├── lib
│   │   │   └── main.dart
│   │   │   ├── models
│   │   │   │   └── tabItem.dart
│   │   │   │   └── menuItem.dart
│   │   │   │   └── scholarshipModel.dart
│   │   │   │   └── profileModel.dart
│   │   │   │   └── myAppliedSchemesModel.dart
│   │   │   ├── widets
│   │   │   │   └── transformer.dart
│   │   │   │   └── auth_input.dart
│   │   │   │   └── drawerRow.dart
│   │   │   │   └── confirmDialog.dart
│   │   │   ├── controllers
│   │   │   │   └── mySchemesController.dart
│   │   │   │   └── auth_controller.dart
│   │   │   │   └── scholarshipController.dart
│   │   │   │   └── profileController.dart
│   │   │   │   └── themeController.dart
│   │   │   │   └── settingController.dart
│   │   │   ├── utils
│   │   │   │   └── type_def.dart
│   │   │   │   └── helper.dart
│   │   │   │   └── storage_keys.dart
│   │   │   │   └── env.dart
│   │   │   ├── services
│   │   │   │   └── storage_services.dart
│   │   │   ├── theme
│   │   │   │   └── theme.dart
│   │   │   ├── routes
│   │   │   │   └── route_names.dart
│   │   │   │   └── route.dart
│   │   │   ├── core
│   │   │   │   ├── network
│   │   │   │   │   └── token_service.dart
│   │   │   │   │   └── dio_client.dart
│   │   │   ├── views
│   │   │   │   ├── scholarships
│   │   │   │   │   └── scholarships.dart
│   │   │   │   │   └── scholarshipDetail.dart
│   │   │   │   │   └── myAppliedScholarships.dart
│   │   │   │   ├── drawerView
│   │   │   │   │   └── drawerView.dart
│   │   │   │   │   └── customDrawerView.dart
│   │   │   │   ├── auth
│   │   │   │   │   └── login.dart
│   │   │   │   │   └── register.dart
│   │   │   │   │   └── getStarted.dart
│   │   │   │   ├── profile
│   │   │   │   │   └── MultiStepForm.dart
│   │   │   │   │   └── domicileDetails.dart
│   │   │   │   │   └── profile.dart
│   │   │   │   │   └── verifyProfile.dart
│   │   │   │   │   └── hostelDetails.dart
│   │   │   │   │   └── incomeDetails.dart
│   │   │   │   │   └── addressDetails.dart
│   │   │   │   │   └── bankDetails.dart
│   │   │   │   │   └── parentDetails.dart
│   │   │   │   │   └── educationalDetails.dart
│   │   │   │   │   └── pastQualification.dart
│   │   │   │   │   └── personalDetails.dart
│   │   │   │   ├── settings
│   │   │   │   │   └── settings.dart
│   │   │   │   ├── homePage
│   │   │   │   │   └── homePage.dart
│   │   │   │   ├── displayDocument
│   │   │   │   │   └── displayDocument.dart
│   │   ├── assets
│   │   │   ├── images
│   │   │   │   └── JP1.png
│   │   │   │   └── JP.png
│   │   │   ├── rive
│   │   │   │   └── rivebot.riv
│   │   │   │   └── theme_toggle_button.riv
│   │   │   │   └── menu_button.riv
│   │   │   │   └── face_1.riv
│   │   │   │   └── icons.riv
│   │   ├── test
│   │   │   └── widget_test.dart
│   │   ├── ios
│   │   │   └── .gitignore
│   │   │   ├── Runner.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   │   ├── xcshareddata
│   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   │   │   └── WorkspaceSettings.xcsettings
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
│   │   │   │   └── Runner-Bridging-Header.h
│   │   │   │   └── Info.plist
│   │   │   │   └── AppDelegate.swift
│   │   │   │   ├── Base.lproj
│   │   │   │   │   └── Main.storyboard
│   │   │   │   │   └── LaunchScreen.storyboard
│   │   │   │   ├── Assets.xcassets
│   │   │   │   │   ├── LaunchImage.imageset
│   │   │   │   │   │   └── LaunchImage.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── LaunchImage@3x.png
│   │   │   │   │   │   └── LaunchImage@2x.png
│   │   │   │   │   │   └── README.md
│   │   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   │   └── Icon-App-29x29@2x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── Icon-App-40x40@2x.png
│   │   │   │   │   │   └── Icon-App-60x60@2x.png
│   │   │   │   │   │   └── Icon-App-20x20@3x.png
│   │   │   │   │   │   └── Icon-App-60x60@3x.png
│   │   │   │   │   │   └── Icon-App-29x29@3x.png
│   │   │   │   │   │   └── Icon-App-20x20@1x.png
│   │   │   │   │   │   └── Icon-App-40x40@3x.png
│   │   │   │   │   │   └── Icon-App-76x76@1x.png
│   │   │   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   │   │   │   └── Icon-App-76x76@2x.png
│   │   │   │   │   │   └── Icon-App-20x20@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@1x.png
│   │   │   │   │   │   └── Icon-App-1024x1024@1x.png
│   │   │   │   │   │   └── Icon-App-29x29@1x.png
│   │   │   ├── Flutter
│   │   │   │   └── Debug.xcconfig
│   │   │   │   └── Release.xcconfig
│   │   │   │   └── AppFrameworkInfo.plist
│   │   │   ├── RunnerTests
│   │   │   │   └── RunnerTests.swift
│   ├── .idea
│   │   └── vcs.xml
│   │   └── workspace.xml
│   │   └── other.xml
```