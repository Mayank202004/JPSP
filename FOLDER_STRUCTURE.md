# Folder Structure

```plaintext
├── .
│   └── README.md
│   └── FOLDER_STRUCTURE.md
│   └── .gitignore
│   ├── .idea
│   │   └── workspace.xml
│   │   └── other.xml
│   │   └── vcs.xml
│   ├── backend
│   │   └── package-lock.json
│   │   └── readme.md
│   │   └── package.json
│   │   └── .prettierignore
│   │   └── .prettierrc
│   │   └── .gitignore
│   │   ├── public
│   │   │   ├── temp
│   │   │   │   └── .gitkeep
│   │   │   ├── images
│   │   │   │   └── .gitkeep
│   │   ├── src
│   │   │   └── app.js
│   │   │   └── server.js
│   │   │   ├── controllers
│   │   │   │   └── scholarship.controller.js
│   │   │   │   └── profile.controller.js
│   │   │   │   └── institute.controller.js
│   │   │   │   └── application.controller.js
│   │   │   │   └── notification.controller.js
│   │   │   │   └── user.controller.js
│   │   │   │   └── admin.controller.js
│   │   │   ├── config
│   │   │   │   └── database.js
│   │   │   ├── routes
│   │   │   │   └── notification.routes.js
│   │   │   │   └── admin.routes.js
│   │   │   │   └── profile.routes.js
│   │   │   │   └── institute.routes.js
│   │   │   │   └── user.routes.js
│   │   │   │   └── scholarship.routes.js
│   │   │   │   └── application.routes.js
│   │   │   ├── models
│   │   │   │   └── institute.model.js
│   │   │   │   └── user.model.js
│   │   │   │   └── admin.model.js
│   │   │   │   └── scholarship.model.js
│   │   │   │   └── profile.model.js
│   │   │   │   └── application.model.js
│   │   │   │   └── notification.model.js
│   │   │   ├── middlewares
│   │   │   │   └── multer.middleware.js
│   │   │   │   └── auth.middleware.js
│   │   │   ├── validators
│   │   │   │   └── profile.validator.js
│   │   │   │   └── institute.validator.js
│   │   │   │   └── scholarship.validator.js
│   │   │   │   └── user.validator.js
│   │   │   │   └── admin.validator.js
│   │   │   ├── utils
│   │   │   │   └── asyncHandler.js
│   │   │   │   └── cloudinary.js
│   │   │   │   └── ApiResponse.js
│   │   │   │   └── ApiError.js
│   ├── App
│   │   └── .metadata
│   │   └── pubspec.yaml
│   │   └── README.md
│   │   └── analysis_options.yaml
│   │   └── pubspec.lock
│   │   └── .gitignore
│   │   ├── web
│   │   │   └── manifest.json
│   │   │   └── index.html
│   │   │   └── favicon.png
│   │   │   ├── icons
│   │   │   │   └── Icon-512.png
│   │   │   │   └── Icon-maskable-192.png
│   │   │   │   └── Icon-192.png
│   │   │   │   └── Icon-maskable-512.png
│   │   ├── test
│   │   │   └── widget_test.dart
│   │   ├── assets
│   │   │   ├── rive
│   │   │   │   └── theme_toggle_button.riv
│   │   │   │   └── icons.riv
│   │   │   │   └── face_1.riv
│   │   │   │   └── menu_button.riv
│   │   │   │   └── rivebot.riv
│   │   │   ├── images
│   │   │   │   └── JP1.png
│   │   │   │   └── JP.png
│   │   ├── lib
│   │   │   └── main.dart
│   │   │   ├── controllers
│   │   │   │   └── themeController.dart
│   │   │   │   └── auth_controller.dart
│   │   │   │   └── mySchemesController.dart
│   │   │   │   └── profileController.dart
│   │   │   │   └── settingController.dart
│   │   │   │   └── scholarshipController.dart
│   │   │   ├── core
│   │   │   │   ├── network
│   │   │   │   │   └── dio_client.dart
│   │   │   │   │   └── token_service.dart
│   │   │   ├── views
│   │   │   │   ├── auth
│   │   │   │   │   └── login.dart
│   │   │   │   │   └── register.dart
│   │   │   │   │   └── getStarted.dart
│   │   │   │   ├── displayDocument
│   │   │   │   │   └── displayDocument.dart
│   │   │   │   ├── scholarships
│   │   │   │   │   └── scholarshipDetail.dart
│   │   │   │   │   └── scholarships.dart
│   │   │   │   │   └── myAppliedScholarships.dart
│   │   │   │   ├── drawerView
│   │   │   │   │   └── customDrawerView.dart
│   │   │   │   │   └── drawerView.dart
│   │   │   │   ├── profile
│   │   │   │   │   └── profile.dart
│   │   │   │   │   └── incomeDetails.dart
│   │   │   │   │   └── educationalDetails.dart
│   │   │   │   │   └── hostelDetails.dart
│   │   │   │   │   └── MultiStepForm.dart
│   │   │   │   │   └── pastQualification.dart
│   │   │   │   │   └── addressDetails.dart
│   │   │   │   │   └── personalDetails.dart
│   │   │   │   │   └── bankDetails.dart
│   │   │   │   │   └── parentDetails.dart
│   │   │   │   │   └── domicileDetails.dart
│   │   │   │   │   └── verifyProfile.dart
│   │   │   │   ├── settings
│   │   │   │   │   └── settings.dart
│   │   │   │   ├── homePage
│   │   │   │   │   └── homePage.dart
│   │   │   ├── theme
│   │   │   │   └── theme.dart
│   │   │   ├── routes
│   │   │   │   └── route_names.dart
│   │   │   │   └── route.dart
│   │   │   ├── models
│   │   │   │   └── profileModel.dart
│   │   │   │   └── menuItem.dart
│   │   │   │   └── myAppliedSchemesModel.dart
│   │   │   │   └── tabItem.dart
│   │   │   │   └── scholarshipModel.dart
│   │   │   ├── utils
│   │   │   │   └── helper.dart
│   │   │   │   └── storage_keys.dart
│   │   │   │   └── env.dart
│   │   │   │   └── type_def.dart
│   │   │   ├── services
│   │   │   │   └── storage_services.dart
│   │   │   ├── widets
│   │   │   │   └── auth_input.dart
│   │   │   │   └── transformer.dart
│   │   │   │   └── confirmDialog.dart
│   │   │   │   └── drawerRow.dart
│   │   ├── android
│   │   │   └── gradle.properties
│   │   │   └── settings.gradle
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
│   │   │   │   │   │   │   ├── mipmap-xhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-hdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values-night
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── drawable-v21
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── drawable
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-xxxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-mdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   ├── profile
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   ├── debug
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   ├── gradle
│   │   │   │   ├── wrapper
│   │   │   │   │   └── gradle-wrapper.properties
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
│   │   │   │   └── Runner-Bridging-Header.h
│   │   │   │   └── Info.plist
│   │   │   │   ├── Base.lproj
│   │   │   │   │   └── LaunchScreen.storyboard
│   │   │   │   │   └── Main.storyboard
│   │   │   │   ├── Assets.xcassets
│   │   │   │   │   ├── LaunchImage.imageset
│   │   │   │   │   │   └── LaunchImage.png
│   │   │   │   │   │   └── LaunchImage@2x.png
│   │   │   │   │   │   └── README.md
│   │   │   │   │   │   └── LaunchImage@3x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   │   └── Icon-App-20x20@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@1x.png
│   │   │   │   │   │   └── Icon-App-20x20@1x.png
│   │   │   │   │   │   └── Icon-App-29x29@3x.png
│   │   │   │   │   │   └── Icon-App-40x40@2x.png
│   │   │   │   │   │   └── Icon-App-20x20@3x.png
│   │   │   │   │   │   └── Icon-App-1024x1024@1x.png
│   │   │   │   │   │   └── Icon-App-40x40@3x.png
│   │   │   │   │   │   └── Icon-App-29x29@2x.png
│   │   │   │   │   │   └── Icon-App-60x60@3x.png
│   │   │   │   │   │   └── Icon-App-76x76@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@1x.png
│   │   │   │   │   │   └── Icon-App-60x60@2x.png
│   │   │   │   │   │   └── Icon-App-76x76@1x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   ├── RunnerTests
│   │   │   │   └── RunnerTests.swift
│   │   │   ├── Flutter
│   │   │   │   └── Release.xcconfig
│   │   │   │   └── AppFrameworkInfo.plist
│   │   │   │   └── Debug.xcconfig
│   │   │   ├── Runner.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   │   ├── xcshareddata
│   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   │   │   └── WorkspaceSettings.xcsettings
```