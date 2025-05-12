# Folder Structure

```plaintext
├── .
│   └── FOLDER_STRUCTURE.md
│   └── README.md
│   └── .gitignore
│   ├── backend
│   │   └── .prettierignore
│   │   └── package.json
│   │   └── readme.md
│   │   └── package-lock.json
│   │   └── .prettierrc
│   │   └── .gitignore
│   │   ├── public
│   │   │   ├── images
│   │   │   │   └── .gitkeep
│   │   │   ├── temp
│   │   │   │   └── .gitkeep
│   │   ├── src
│   │   │   └── app.js
│   │   │   └── server.js
│   │   │   ├── utils
│   │   │   │   └── ApiResponse.js
│   │   │   │   └── ApiError.js
│   │   │   │   └── asyncHandler.js
│   │   │   │   └── cloudinary.js
│   │   │   ├── validators
│   │   │   │   └── institute.validator.js
│   │   │   │   └── scholarship.validator.js
│   │   │   │   └── admin.validator.js
│   │   │   │   └── user.validator.js
│   │   │   │   └── profile.validator.js
│   │   │   ├── controllers
│   │   │   │   └── profile.controller.js
│   │   │   │   └── notification.controller.js
│   │   │   │   └── application.controller.js
│   │   │   │   └── scholarship.controller.js
│   │   │   │   └── admin.controller.js
│   │   │   │   └── user.controller.js
│   │   │   │   └── institute.controller.js
│   │   │   ├── routes
│   │   │   │   └── admin.routes.js
│   │   │   │   └── institute.routes.js
│   │   │   │   └── scholarship.routes.js
│   │   │   │   └── notification.routes.js
│   │   │   │   └── profile.routes.js
│   │   │   │   └── user.routes.js
│   │   │   │   └── application.routes.js
│   │   │   ├── models
│   │   │   │   └── notification.model.js
│   │   │   │   └── admin.model.js
│   │   │   │   └── application.model.js
│   │   │   │   └── user.model.js
│   │   │   │   └── scholarship.model.js
│   │   │   │   └── profile.model.js
│   │   │   │   └── institute.model.js
│   │   │   ├── config
│   │   │   │   └── database.js
│   │   │   ├── middlewares
│   │   │   │   └── multer.middleware.js
│   │   │   │   └── auth.middleware.js
│   ├── .idea
│   │   └── vcs.xml
│   │   └── workspace.xml
│   │   └── other.xml
│   ├── App
│   │   └── pubspec.yaml
│   │   └── pubspec.lock
│   │   └── README.md
│   │   └── .metadata
│   │   └── analysis_options.yaml
│   │   └── .gitignore
│   │   ├── test
│   │   │   └── widget_test.dart
│   │   ├── android
│   │   │   └── settings.gradle
│   │   │   └── build.gradle
│   │   │   └── gradle.properties
│   │   │   └── .gitignore
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
│   │   │   │   │   │   │   ├── mipmap-xxxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable-v21
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-mdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-xxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values-night
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-hdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-xhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   ├── profile
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   ├── gradle
│   │   │   │   ├── wrapper
│   │   │   │   │   └── gradle-wrapper.properties
│   │   ├── lib
│   │   │   └── main.dart
│   │   │   ├── widets
│   │   │   │   └── transformer.dart
│   │   │   │   └── auth_input.dart
│   │   │   │   └── confirmDialog.dart
│   │   │   │   └── drawerRow.dart
│   │   │   ├── utils
│   │   │   │   └── type_def.dart
│   │   │   │   └── env.dart
│   │   │   │   └── storage_keys.dart
│   │   │   │   └── helper.dart
│   │   │   ├── core
│   │   │   │   ├── network
│   │   │   │   │   └── token_service.dart
│   │   │   │   │   └── dio_client.dart
│   │   │   ├── views
│   │   │   │   ├── scholarships
│   │   │   │   │   └── scholarshipDetail.dart
│   │   │   │   │   └── scholarships.dart
│   │   │   │   │   └── myAppliedScholarships.dart
│   │   │   │   ├── settings
│   │   │   │   │   └── settings.dart
│   │   │   │   ├── homePage
│   │   │   │   │   └── homePage.dart
│   │   │   │   ├── auth
│   │   │   │   │   └── login.dart
│   │   │   │   │   └── getStarted.dart
│   │   │   │   │   └── register.dart
│   │   │   │   ├── displayDocument
│   │   │   │   │   └── displayDocument.dart
│   │   │   │   ├── drawerView
│   │   │   │   │   └── drawerView.dart
│   │   │   │   │   └── customDrawerView.dart
│   │   │   │   ├── profile
│   │   │   │   │   └── bankDetails.dart
│   │   │   │   │   └── verifyProfile.dart
│   │   │   │   │   └── educationalDetails.dart
│   │   │   │   │   └── parentDetails.dart
│   │   │   │   │   └── domicileDetails.dart
│   │   │   │   │   └── addressDetails.dart
│   │   │   │   │   └── hostelDetails.dart
│   │   │   │   │   └── profile.dart
│   │   │   │   │   └── pastQualification.dart
│   │   │   │   │   └── MultiStepForm.dart
│   │   │   │   │   └── personalDetails.dart
│   │   │   │   │   └── incomeDetails.dart
│   │   │   ├── controllers
│   │   │   │   └── themeController.dart
│   │   │   │   └── scholarshipController.dart
│   │   │   │   └── mySchemesController.dart
│   │   │   │   └── auth_controller.dart
│   │   │   │   └── profileController.dart
│   │   │   │   └── settingController.dart
│   │   │   ├── routes
│   │   │   │   └── route_names.dart
│   │   │   │   └── route.dart
│   │   │   ├── services
│   │   │   │   └── storage_services.dart
│   │   │   ├── theme
│   │   │   │   └── theme.dart
│   │   │   ├── models
│   │   │   │   └── scholarshipModel.dart
│   │   │   │   └── myAppliedSchemesModel.dart
│   │   │   │   └── profileModel.dart
│   │   │   │   └── tabItem.dart
│   │   │   │   └── menuItem.dart
│   │   ├── ios
│   │   │   └── .gitignore
│   │   │   ├── Runner.xcodeproj
│   │   │   │   └── project.pbxproj
│   │   │   │   ├── project.xcworkspace
│   │   │   │   │   └── contents.xcworkspacedata
│   │   │   │   │   ├── xcshareddata
│   │   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   │   ├── xcshareddata
│   │   │   │   │   ├── xcschemes
│   │   │   │   │   │   └── Runner.xcscheme
│   │   │   ├── RunnerTests
│   │   │   │   └── RunnerTests.swift
│   │   │   ├── Runner
│   │   │   │   └── Info.plist
│   │   │   │   └── Runner-Bridging-Header.h
│   │   │   │   └── AppDelegate.swift
│   │   │   │   ├── Base.lproj
│   │   │   │   │   └── Main.storyboard
│   │   │   │   │   └── LaunchScreen.storyboard
│   │   │   │   ├── Assets.xcassets
│   │   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   │   └── Icon-App-40x40@2x.png
│   │   │   │   │   │   └── Icon-App-76x76@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@3x.png
│   │   │   │   │   │   └── Icon-App-60x60@3x.png
│   │   │   │   │   │   └── Icon-App-20x20@3x.png
│   │   │   │   │   │   └── Icon-App-29x29@3x.png
│   │   │   │   │   │   └── Icon-App-60x60@2x.png
│   │   │   │   │   │   └── Icon-App-20x20@1x.png
│   │   │   │   │   │   └── Icon-App-20x20@2x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── Icon-App-40x40@1x.png
│   │   │   │   │   │   └── Icon-App-29x29@1x.png
│   │   │   │   │   │   └── Icon-App-76x76@1x.png
│   │   │   │   │   │   └── Icon-App-1024x1024@1x.png
│   │   │   │   │   │   └── Icon-App-29x29@2x.png
│   │   │   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   │   │   ├── LaunchImage.imageset
│   │   │   │   │   │   └── LaunchImage@2x.png
│   │   │   │   │   │   └── LaunchImage.png
│   │   │   │   │   │   └── README.md
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── LaunchImage@3x.png
│   │   │   ├── Runner.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   │   ├── xcshareddata
│   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   ├── Flutter
│   │   │   │   └── AppFrameworkInfo.plist
│   │   │   │   └── Debug.xcconfig
│   │   │   │   └── Release.xcconfig
│   │   ├── assets
│   │   │   ├── rive
│   │   │   │   └── theme_toggle_button.riv
│   │   │   │   └── rivebot.riv
│   │   │   │   └── menu_button.riv
│   │   │   │   └── icons.riv
│   │   │   │   └── face_1.riv
│   │   │   ├── images
│   │   │   │   └── JP.png
│   │   │   │   └── JP1.png
│   │   ├── web
│   │   │   └── index.html
│   │   │   └── manifest.json
│   │   │   └── favicon.png
│   │   │   ├── icons
│   │   │   │   └── Icon-512.png
│   │   │   │   └── Icon-maskable-192.png
│   │   │   │   └── Icon-192.png
│   │   │   │   └── Icon-maskable-512.png
```