# Folder Structure

```plaintext
├── .
│   └── README.md
│   └── FOLDER_STRUCTURE.md
│   └── .gitignore
│   ├── .idea
│   │   └── vcs.xml
│   │   └── workspace.xml
│   │   └── other.xml
│   ├── App
│   │   └── analysis_options.yaml
│   │   └── README.md
│   │   └── pubspec.yaml
│   │   └── .metadata
│   │   └── pubspec.lock
│   │   └── .gitignore
│   │   ├── lib
│   │   │   └── main.dart
│   │   │   ├── models
│   │   │   │   └── tabItem.dart
│   │   │   │   └── profileModel.dart
│   │   │   │   └── menuItem.dart
│   │   │   │   └── scholarshipModel.dart
│   │   │   │   └── myAppliedSchemesModel.dart
│   │   │   ├── views
│   │   │   │   ├── auth
│   │   │   │   │   └── login.dart
│   │   │   │   │   └── register.dart
│   │   │   │   │   └── getStarted.dart
│   │   │   │   ├── displayDocument
│   │   │   │   │   └── displayDocument.dart
│   │   │   │   ├── drawerView
│   │   │   │   │   └── drawerView.dart
│   │   │   │   │   └── customDrawerView.dart
│   │   │   │   ├── profile
│   │   │   │   │   └── domicileDetails.dart
│   │   │   │   │   └── incomeDetails.dart
│   │   │   │   │   └── educationalDetails.dart
│   │   │   │   │   └── hostelDetails.dart
│   │   │   │   │   └── personalDetails.dart
│   │   │   │   │   └── parentDetails.dart
│   │   │   │   │   └── bankDetails.dart
│   │   │   │   │   └── addressDetails.dart
│   │   │   │   │   └── pastQualification.dart
│   │   │   │   │   └── MultiStepForm.dart
│   │   │   │   │   └── verifyProfile.dart
│   │   │   │   │   └── profile.dart
│   │   │   │   ├── homePage
│   │   │   │   │   └── homePage.dart
│   │   │   │   ├── settings
│   │   │   │   │   └── settings.dart
│   │   │   │   ├── scholarships
│   │   │   │   │   └── myAppliedScholarships.dart
│   │   │   │   │   └── scholarships.dart
│   │   │   │   │   └── scholarshipDetail.dart
│   │   │   ├── widets
│   │   │   │   └── confirmDialog.dart
│   │   │   │   └── drawerRow.dart
│   │   │   │   └── auth_input.dart
│   │   │   │   └── transformer.dart
│   │   │   ├── core
│   │   │   │   ├── network
│   │   │   │   │   └── dio_client.dart
│   │   │   │   │   └── token_service.dart
│   │   │   ├── controllers
│   │   │   │   └── profileController.dart
│   │   │   │   └── auth_controller.dart
│   │   │   │   └── scholarshipController.dart
│   │   │   │   └── settingController.dart
│   │   │   │   └── mySchemesController.dart
│   │   │   │   └── themeController.dart
│   │   │   ├── utils
│   │   │   │   └── env.dart
│   │   │   │   └── type_def.dart
│   │   │   │   └── helper.dart
│   │   │   │   └── storage_keys.dart
│   │   │   ├── theme
│   │   │   │   └── theme.dart
│   │   │   ├── routes
│   │   │   │   └── route_names.dart
│   │   │   │   └── route.dart
│   │   │   ├── services
│   │   │   │   └── storage_services.dart
│   │   ├── assets
│   │   │   ├── images
│   │   │   │   └── JP1.png
│   │   │   │   └── JP.png
│   │   │   ├── rive
│   │   │   │   └── face_1.riv
│   │   │   │   └── menu_button.riv
│   │   │   │   └── theme_toggle_button.riv
│   │   │   │   └── rivebot.riv
│   │   │   │   └── icons.riv
│   │   ├── test
│   │   │   └── widget_test.dart
│   │   ├── web
│   │   │   └── manifest.json
│   │   │   └── index.html
│   │   │   └── favicon.png
│   │   │   ├── icons
│   │   │   │   └── Icon-512.png
│   │   │   │   └── Icon-192.png
│   │   │   │   └── Icon-maskable-512.png
│   │   │   │   └── Icon-maskable-192.png
│   │   ├── android
│   │   │   └── gradle.properties
│   │   │   └── settings.gradle
│   │   │   └── build.gradle
│   │   │   └── .gitignore
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
│   │   │   │   │   │   │   ├── values-night
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-xhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-hdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-mdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-xxxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable-v21
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-xxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   ├── gradle
│   │   │   │   ├── wrapper
│   │   │   │   │   └── gradle-wrapper.properties
│   │   ├── ios
│   │   │   └── .gitignore
│   │   │   ├── RunnerTests
│   │   │   │   └── RunnerTests.swift
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
│   │   │   ├── Runner.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   │   ├── xcshareddata
│   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   ├── Runner
│   │   │   │   └── AppDelegate.swift
│   │   │   │   └── Runner-Bridging-Header.h
│   │   │   │   └── Info.plist
│   │   │   │   ├── Assets.xcassets
│   │   │   │   │   ├── LaunchImage.imageset
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── LaunchImage@2x.png
│   │   │   │   │   │   └── LaunchImage@3x.png
│   │   │   │   │   │   └── README.md
│   │   │   │   │   │   └── LaunchImage.png
│   │   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── Icon-App-20x20@2x.png
│   │   │   │   │   │   └── Icon-App-20x20@1x.png
│   │   │   │   │   │   └── Icon-App-60x60@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@2x.png
│   │   │   │   │   │   └── Icon-App-60x60@3x.png
│   │   │   │   │   │   └── Icon-App-76x76@1x.png
│   │   │   │   │   │   └── Icon-App-1024x1024@1x.png
│   │   │   │   │   │   └── Icon-App-20x20@3x.png
│   │   │   │   │   │   └── Icon-App-29x29@3x.png
│   │   │   │   │   │   └── Icon-App-76x76@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@3x.png
│   │   │   │   │   │   └── Icon-App-29x29@1x.png
│   │   │   │   │   │   └── Icon-App-29x29@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@1x.png
│   │   │   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   │   ├── Base.lproj
│   │   │   │   │   └── Main.storyboard
│   │   │   │   │   └── LaunchScreen.storyboard
│   │   │   ├── Flutter
│   │   │   │   └── Debug.xcconfig
│   │   │   │   └── AppFrameworkInfo.plist
│   │   │   │   └── Release.xcconfig
│   ├── backend
│   │   └── package.json
│   │   └── .prettierignore
│   │   └── readme.md
│   │   └── package-lock.json
│   │   └── .gitignore
│   │   └── .prettierrc
│   │   ├── src
│   │   │   └── server.js
│   │   │   └── app.js
│   │   │   ├── validators
│   │   │   │   └── user.validator.js
│   │   │   │   └── scholarship.validator.js
│   │   │   │   └── profile.validator.js
│   │   │   │   └── admin.validator.js
│   │   │   │   └── institute.validator.js
│   │   │   ├── models
│   │   │   │   └── application.model.js
│   │   │   │   └── scholarship.model.js
│   │   │   │   └── user.model.js
│   │   │   │   └── institute.model.js
│   │   │   │   └── admin.model.js
│   │   │   │   └── notification.model.js
│   │   │   │   └── profile.model.js
│   │   │   ├── middlewares
│   │   │   │   └── auth.middleware.js
│   │   │   │   └── multer.middleware.js
│   │   │   ├── controllers
│   │   │   │   └── profile.controller.js
│   │   │   │   └── scholarship.controller.js
│   │   │   │   └── admin.controller.js
│   │   │   │   └── institute.controller.js
│   │   │   │   └── application.controller.js
│   │   │   │   └── notification.controller.js
│   │   │   │   └── user.controller.js
│   │   │   ├── config
│   │   │   │   └── database.js
│   │   │   ├── utils
│   │   │   │   └── ApiResponse.js
│   │   │   │   └── ApiError.js
│   │   │   │   └── asyncHandler.js
│   │   │   │   └── cloudinary.js
│   │   │   ├── routes
│   │   │   │   └── application.routes.js
│   │   │   │   └── notification.routes.js
│   │   │   │   └── profile.routes.js
│   │   │   │   └── user.routes.js
│   │   │   │   └── institute.routes.js
│   │   │   │   └── admin.routes.js
│   │   │   │   └── scholarship.routes.js
│   │   ├── public
│   │   │   ├── images
│   │   │   │   └── .gitkeep
│   │   │   ├── temp
│   │   │   │   └── .gitkeep
```