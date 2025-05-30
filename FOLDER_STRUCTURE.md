# Folder Structure

```plaintext
├── .
│   └── .gitignore
│   └── README.md
│   └── FOLDER_STRUCTURE.md
│   ├── backend
│   │   └── package-lock.json
│   │   └── .gitignore
│   │   └── .prettierrc
│   │   └── readme.md
│   │   └── .prettierignore
│   │   └── package.json
│   │   ├── public
│   │   │   ├── temp
│   │   │   │   └── .gitkeep
│   │   │   ├── images
│   │   │   │   └── .gitkeep
│   │   ├── src
│   │   │   └── app.js
│   │   │   └── server.js
│   │   │   ├── utils
│   │   │   │   └── ApiResponse.js
│   │   │   │   └── ApiError.js
│   │   │   │   └── asyncHandler.js
│   │   │   │   └── cloudinary.js
│   │   │   ├── models
│   │   │   │   └── application.model.js
│   │   │   │   └── institute.model.js
│   │   │   │   └── admin.model.js
│   │   │   │   └── scholarship.model.js
│   │   │   │   └── user.model.js
│   │   │   │   └── notification.model.js
│   │   │   │   └── profile.model.js
│   │   │   ├── routes
│   │   │   │   └── notification.routes.js
│   │   │   │   └── application.routes.js
│   │   │   │   └── scholarship.routes.js
│   │   │   │   └── profile.routes.js
│   │   │   │   └── user.routes.js
│   │   │   │   └── institute.routes.js
│   │   │   │   └── admin.routes.js
│   │   │   ├── middlewares
│   │   │   │   └── auth.middleware.js
│   │   │   │   └── multer.middleware.js
│   │   │   ├── validators
│   │   │   │   └── scholarship.validator.js
│   │   │   │   └── profile.validator.js
│   │   │   │   └── user.validator.js
│   │   │   │   └── institute.validator.js
│   │   │   │   └── admin.validator.js
│   │   │   ├── config
│   │   │   │   └── database.js
│   │   │   ├── controllers
│   │   │   │   └── admin.controller.js
│   │   │   │   └── institute.controller.js
│   │   │   │   └── application.controller.js
│   │   │   │   └── user.controller.js
│   │   │   │   └── notification.controller.js
│   │   │   │   └── scholarship.controller.js
│   │   │   │   └── profile.controller.js
│   ├── .idea
│   │   └── other.xml
│   │   └── vcs.xml
│   │   └── workspace.xml
│   ├── App
│   │   └── .metadata
│   │   └── pubspec.lock
│   │   └── analysis_options.yaml
│   │   └── .gitignore
│   │   └── README.md
│   │   └── pubspec.yaml
│   │   ├── test
│   │   │   └── widget_test.dart
│   │   ├── web
│   │   │   └── manifest.json
│   │   │   └── index.html
│   │   │   └── favicon.png
│   │   │   ├── icons
│   │   │   │   └── Icon-192.png
│   │   │   │   └── Icon-maskable-512.png
│   │   │   │   └── Icon-maskable-192.png
│   │   │   │   └── Icon-512.png
│   │   ├── android
│   │   │   └── settings.gradle
│   │   │   └── .gitignore
│   │   │   └── gradle.properties
│   │   │   └── build.gradle
│   │   │   ├── app
│   │   │   │   └── build.gradle
│   │   │   │   ├── src
│   │   │   │   │   ├── debug
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   ├── main
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   │   ├── res
│   │   │   │   │   │   │   ├── values-night
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-xxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── values
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-xxxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-mdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable-v21
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-hdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   ├── kotlin
│   │   │   │   │   │   │   ├── com
│   │   │   │   │   │   │   │   ├── jps
│   │   │   │   │   │   │   │   │   ├── pmsss
│   │   │   │   │   │   │   │   │   │   ├── pmsss
│   │   │   │   │   │   │   │   │   │   │   └── MainActivity.kt
│   │   │   │   │   ├── profile
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   ├── gradle
│   │   │   │   ├── wrapper
│   │   │   │   │   └── gradle-wrapper.properties
│   │   ├── assets
│   │   │   ├── images
│   │   │   │   └── JP1.png
│   │   │   │   └── JP.png
│   │   │   ├── rive
│   │   │   │   └── rivebot.riv
│   │   │   │   └── face_1.riv
│   │   │   │   └── menu_button.riv
│   │   │   │   └── theme_toggle_button.riv
│   │   │   │   └── icons.riv
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
│   │   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   ├── Runner
│   │   │   │   └── AppDelegate.swift
│   │   │   │   └── Info.plist
│   │   │   │   └── Runner-Bridging-Header.h
│   │   │   │   ├── Assets.xcassets
│   │   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   │   └── Icon-App-76x76@1x.png
│   │   │   │   │   │   └── Icon-App-40x40@2x.png
│   │   │   │   │   │   └── Icon-App-20x20@1x.png
│   │   │   │   │   │   └── Icon-App-40x40@3x.png
│   │   │   │   │   │   └── Icon-App-1024x1024@1x.png
│   │   │   │   │   │   └── Icon-App-29x29@1x.png
│   │   │   │   │   │   └── Icon-App-60x60@3x.png
│   │   │   │   │   │   └── Icon-App-29x29@2x.png
│   │   │   │   │   │   └── Icon-App-20x20@2x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── Icon-App-60x60@2x.png
│   │   │   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@3x.png
│   │   │   │   │   │   └── Icon-App-40x40@1x.png
│   │   │   │   │   │   └── Icon-App-20x20@3x.png
│   │   │   │   │   │   └── Icon-App-76x76@2x.png
│   │   │   │   │   ├── LaunchImage.imageset
│   │   │   │   │   │   └── LaunchImage.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── LaunchImage@3x.png
│   │   │   │   │   │   └── README.md
│   │   │   │   │   │   └── LaunchImage@2x.png
│   │   │   │   ├── Base.lproj
│   │   │   │   │   └── Main.storyboard
│   │   │   │   │   └── LaunchScreen.storyboard
│   │   │   ├── Flutter
│   │   │   │   └── AppFrameworkInfo.plist
│   │   │   │   └── Debug.xcconfig
│   │   │   │   └── Release.xcconfig
│   │   │   ├── Runner.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   │   ├── xcshareddata
│   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   ├── lib
│   │   │   └── main.dart
│   │   │   ├── theme
│   │   │   │   └── theme.dart
│   │   │   ├── widets
│   │   │   │   └── confirmDialog.dart
│   │   │   │   └── transformer.dart
│   │   │   │   └── drawerRow.dart
│   │   │   │   └── auth_input.dart
│   │   │   ├── utils
│   │   │   │   └── storage_keys.dart
│   │   │   │   └── helper.dart
│   │   │   │   └── env.dart
│   │   │   │   └── type_def.dart
│   │   │   ├── models
│   │   │   │   └── menuItem.dart
│   │   │   │   └── myAppliedSchemesModel.dart
│   │   │   │   └── tabItem.dart
│   │   │   │   └── profileModel.dart
│   │   │   │   └── scholarshipModel.dart
│   │   │   ├── core
│   │   │   │   ├── network
│   │   │   │   │   └── token_service.dart
│   │   │   │   │   └── dio_client.dart
│   │   │   ├── routes
│   │   │   │   └── route_names.dart
│   │   │   │   └── route.dart
│   │   │   ├── services
│   │   │   │   └── storage_services.dart
│   │   │   ├── controllers
│   │   │   │   └── mySchemesController.dart
│   │   │   │   └── themeController.dart
│   │   │   │   └── settingController.dart
│   │   │   │   └── auth_controller.dart
│   │   │   │   └── scholarshipController.dart
│   │   │   │   └── profileController.dart
│   │   │   ├── views
│   │   │   │   ├── settings
│   │   │   │   │   └── settings.dart
│   │   │   │   ├── scholarships
│   │   │   │   │   └── scholarships.dart
│   │   │   │   │   └── scholarshipDetail.dart
│   │   │   │   │   └── myAppliedScholarships.dart
│   │   │   │   ├── homePage
│   │   │   │   │   └── homePage.dart
│   │   │   │   ├── displayDocument
│   │   │   │   │   └── displayDocument.dart
│   │   │   │   ├── profile
│   │   │   │   │   └── verifyProfile.dart
│   │   │   │   │   └── incomeDetails.dart
│   │   │   │   │   └── personalDetails.dart
│   │   │   │   │   └── MultiStepForm.dart
│   │   │   │   │   └── pastQualification.dart
│   │   │   │   │   └── addressDetails.dart
│   │   │   │   │   └── educationalDetails.dart
│   │   │   │   │   └── profile.dart
│   │   │   │   │   └── parentDetails.dart
│   │   │   │   │   └── hostelDetails.dart
│   │   │   │   │   └── bankDetails.dart
│   │   │   │   │   └── domicileDetails.dart
│   │   │   │   ├── auth
│   │   │   │   │   └── register.dart
│   │   │   │   │   └── login.dart
│   │   │   │   │   └── getStarted.dart
│   │   │   │   ├── drawerView
│   │   │   │   │   └── customDrawerView.dart
│   │   │   │   │   └── drawerView.dart
```