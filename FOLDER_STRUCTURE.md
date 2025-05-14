# Folder Structure

```plaintext
├── .
│   └── FOLDER_STRUCTURE.md
│   └── README.md
│   └── .gitignore
│   ├── App
│   │   └── pubspec.lock
│   │   └── pubspec.yaml
│   │   └── .metadata
│   │   └── README.md
│   │   └── analysis_options.yaml
│   │   └── .gitignore
│   │   ├── ios
│   │   │   └── .gitignore
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
│   │   │   │   │   │   └── README.md
│   │   │   │   │   │   └── LaunchImage@3x.png
│   │   │   │   │   │   └── LaunchImage@2x.png
│   │   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   │   └── Icon-App-76x76@1x.png
│   │   │   │   │   │   └── Icon-App-40x40@2x.png
│   │   │   │   │   │   └── Icon-App-20x20@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@1x.png
│   │   │   │   │   │   └── Icon-App-60x60@3x.png
│   │   │   │   │   │   └── Icon-App-29x29@1x.png
│   │   │   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@3x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── Icon-App-20x20@3x.png
│   │   │   │   │   │   └── Icon-App-40x40@3x.png
│   │   │   │   │   │   └── Icon-App-20x20@1x.png
│   │   │   │   │   │   └── Icon-App-60x60@2x.png
│   │   │   │   │   │   └── Icon-App-76x76@2x.png
│   │   │   │   │   │   └── Icon-App-29x29@2x.png
│   │   │   │   │   │   └── Icon-App-1024x1024@1x.png
│   │   │   ├── Runner.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   │   ├── xcshareddata
│   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   ├── Flutter
│   │   │   │   └── AppFrameworkInfo.plist
│   │   │   │   └── Debug.xcconfig
│   │   │   │   └── Release.xcconfig
│   │   │   ├── RunnerTests
│   │   │   │   └── RunnerTests.swift
│   │   ├── web
│   │   │   └── manifest.json
│   │   │   └── favicon.png
│   │   │   └── index.html
│   │   │   ├── icons
│   │   │   │   └── Icon-maskable-192.png
│   │   │   │   └── Icon-192.png
│   │   │   │   └── Icon-maskable-512.png
│   │   │   │   └── Icon-512.png
│   │   ├── android
│   │   │   └── gradle.properties
│   │   │   └── build.gradle
│   │   │   └── .gitignore
│   │   │   └── settings.gradle
│   │   │   ├── app
│   │   │   │   └── build.gradle
│   │   │   │   ├── src
│   │   │   │   │   ├── profile
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   ├── main
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   │   ├── res
│   │   │   │   │   │   │   ├── mipmap-hdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xxxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── drawable
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── drawable-v21
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── mipmap-mdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values-night
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-xxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   ├── kotlin
│   │   │   │   │   │   │   ├── com
│   │   │   │   │   │   │   │   ├── jps
│   │   │   │   │   │   │   │   │   ├── pmsss
│   │   │   │   │   │   │   │   │   │   ├── pmsss
│   │   │   │   │   │   │   │   │   │   │   └── MainActivity.kt
│   │   │   │   │   ├── debug
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   ├── gradle
│   │   │   │   ├── wrapper
│   │   │   │   │   └── gradle-wrapper.properties
│   │   ├── lib
│   │   │   └── main.dart
│   │   │   ├── routes
│   │   │   │   └── route_names.dart
│   │   │   │   └── route.dart
│   │   │   ├── core
│   │   │   │   ├── network
│   │   │   │   │   └── dio_client.dart
│   │   │   │   │   └── token_service.dart
│   │   │   ├── views
│   │   │   │   ├── drawerView
│   │   │   │   │   └── customDrawerView.dart
│   │   │   │   │   └── drawerView.dart
│   │   │   │   ├── profile
│   │   │   │   │   └── MultiStepForm.dart
│   │   │   │   │   └── pastQualification.dart
│   │   │   │   │   └── bankDetails.dart
│   │   │   │   │   └── hostelDetails.dart
│   │   │   │   │   └── profile.dart
│   │   │   │   │   └── personalDetails.dart
│   │   │   │   │   └── domicileDetails.dart
│   │   │   │   │   └── verifyProfile.dart
│   │   │   │   │   └── addressDetails.dart
│   │   │   │   │   └── educationalDetails.dart
│   │   │   │   │   └── parentDetails.dart
│   │   │   │   │   └── incomeDetails.dart
│   │   │   │   ├── scholarships
│   │   │   │   │   └── scholarships.dart
│   │   │   │   │   └── scholarshipDetail.dart
│   │   │   │   │   └── myAppliedScholarships.dart
│   │   │   │   ├── displayDocument
│   │   │   │   │   └── displayDocument.dart
│   │   │   │   ├── settings
│   │   │   │   │   └── settings.dart
│   │   │   │   ├── auth
│   │   │   │   │   └── register.dart
│   │   │   │   │   └── login.dart
│   │   │   │   │   └── getStarted.dart
│   │   │   │   ├── homePage
│   │   │   │   │   └── homePage.dart
│   │   │   ├── controllers
│   │   │   │   └── mySchemesController.dart
│   │   │   │   └── settingController.dart
│   │   │   │   └── profileController.dart
│   │   │   │   └── scholarshipController.dart
│   │   │   │   └── auth_controller.dart
│   │   │   │   └── themeController.dart
│   │   │   ├── theme
│   │   │   │   └── theme.dart
│   │   │   ├── utils
│   │   │   │   └── type_def.dart
│   │   │   │   └── helper.dart
│   │   │   │   └── env.dart
│   │   │   │   └── storage_keys.dart
│   │   │   ├── models
│   │   │   │   └── tabItem.dart
│   │   │   │   └── menuItem.dart
│   │   │   │   └── profileModel.dart
│   │   │   │   └── scholarshipModel.dart
│   │   │   │   └── myAppliedSchemesModel.dart
│   │   │   ├── widets
│   │   │   │   └── auth_input.dart
│   │   │   │   └── confirmDialog.dart
│   │   │   │   └── transformer.dart
│   │   │   │   └── drawerRow.dart
│   │   │   ├── services
│   │   │   │   └── storage_services.dart
│   │   ├── assets
│   │   │   ├── images
│   │   │   │   └── JP.png
│   │   │   │   └── JP1.png
│   │   │   ├── rive
│   │   │   │   └── theme_toggle_button.riv
│   │   │   │   └── icons.riv
│   │   │   │   └── face_1.riv
│   │   │   │   └── rivebot.riv
│   │   │   │   └── menu_button.riv
│   │   ├── test
│   │   │   └── widget_test.dart
│   ├── backend
│   │   └── readme.md
│   │   └── package.json
│   │   └── package-lock.json
│   │   └── .prettierrc
│   │   └── .gitignore
│   │   └── .prettierignore
│   │   ├── public
│   │   │   ├── temp
│   │   │   │   └── .gitkeep
│   │   │   ├── images
│   │   │   │   └── .gitkeep
│   │   ├── src
│   │   │   └── app.js
│   │   │   └── server.js
│   │   │   ├── routes
│   │   │   │   └── notification.routes.js
│   │   │   │   └── scholarship.routes.js
│   │   │   │   └── application.routes.js
│   │   │   │   └── institute.routes.js
│   │   │   │   └── user.routes.js
│   │   │   │   └── profile.routes.js
│   │   │   │   └── admin.routes.js
│   │   │   ├── config
│   │   │   │   └── database.js
│   │   │   ├── controllers
│   │   │   │   └── institute.controller.js
│   │   │   │   └── application.controller.js
│   │   │   │   └── user.controller.js
│   │   │   │   └── admin.controller.js
│   │   │   │   └── notification.controller.js
│   │   │   │   └── profile.controller.js
│   │   │   │   └── scholarship.controller.js
│   │   │   ├── utils
│   │   │   │   └── cloudinary.js
│   │   │   │   └── asyncHandler.js
│   │   │   │   └── ApiResponse.js
│   │   │   │   └── ApiError.js
│   │   │   ├── models
│   │   │   │   └── profile.model.js
│   │   │   │   └── application.model.js
│   │   │   │   └── user.model.js
│   │   │   │   └── admin.model.js
│   │   │   │   └── notification.model.js
│   │   │   │   └── institute.model.js
│   │   │   │   └── scholarship.model.js
│   │   │   ├── validators
│   │   │   │   └── institute.validator.js
│   │   │   │   └── scholarship.validator.js
│   │   │   │   └── admin.validator.js
│   │   │   │   └── user.validator.js
│   │   │   │   └── profile.validator.js
│   │   │   ├── middlewares
│   │   │   │   └── multer.middleware.js
│   │   │   │   └── auth.middleware.js
│   ├── .idea
│   │   └── other.xml
│   │   └── vcs.xml
│   │   └── workspace.xml
```