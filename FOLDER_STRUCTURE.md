# Folder Structure

```plaintext
├── .
│   └── README.md
│   └── FOLDER_STRUCTURE.md
│   └── .gitignore
│   ├── App
│   │   └── README.md
│   │   └── pubspec.yaml
│   │   └── .metadata
│   │   └── analysis_options.yaml
│   │   └── pubspec.lock
│   │   └── .gitignore
│   │   ├── assets
│   │   │   ├── rive
│   │   │   │   └── menu_button.riv
│   │   │   │   └── face_1.riv
│   │   │   │   └── rivebot.riv
│   │   │   │   └── icons.riv
│   │   │   │   └── theme_toggle_button.riv
│   │   │   ├── images
│   │   │   │   └── JP.png
│   │   │   │   └── JP1.png
│   │   ├── test
│   │   │   └── widget_test.dart
│   │   ├── web
│   │   │   └── manifest.json
│   │   │   └── favicon.png
│   │   │   └── index.html
│   │   │   ├── icons
│   │   │   │   └── Icon-192.png
│   │   │   │   └── Icon-maskable-512.png
│   │   │   │   └── Icon-maskable-192.png
│   │   │   │   └── Icon-512.png
│   │   ├── android
│   │   │   └── gradle.properties
│   │   │   └── settings.gradle
│   │   │   └── build.gradle
│   │   │   └── .gitignore
│   │   │   ├── gradle
│   │   │   │   ├── wrapper
│   │   │   │   │   └── gradle-wrapper.properties
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
│   │   │   │   │   │   │   ├── mipmap-xxxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xxhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── values-night
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-hdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── mipmap-xhdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable-v21
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   │   │   ├── values
│   │   │   │   │   │   │   │   └── styles.xml
│   │   │   │   │   │   │   ├── mipmap-mdpi
│   │   │   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   │   │   ├── drawable
│   │   │   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   ├── profile
│   │   │   │   │   │   └── AndroidManifest.xml
│   │   │   │   │   ├── debug
│   │   │   │   │   │   └── AndroidManifest.xml
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
│   │   │   ├── Runner
│   │   │   │   └── Runner-Bridging-Header.h
│   │   │   │   └── Info.plist
│   │   │   │   └── AppDelegate.swift
│   │   │   │   ├── Base.lproj
│   │   │   │   │   └── LaunchScreen.storyboard
│   │   │   │   │   └── Main.storyboard
│   │   │   │   ├── Assets.xcassets
│   │   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   │   └── Icon-App-60x60@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@3x.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── Icon-App-20x20@1x.png
│   │   │   │   │   │   └── Icon-App-20x20@2x.png
│   │   │   │   │   │   └── Icon-App-60x60@3x.png
│   │   │   │   │   │   └── Icon-App-20x20@3x.png
│   │   │   │   │   │   └── Icon-App-40x40@1x.png
│   │   │   │   │   │   └── Icon-App-29x29@1x.png
│   │   │   │   │   │   └── Icon-App-29x29@3x.png
│   │   │   │   │   │   └── Icon-App-76x76@1x.png
│   │   │   │   │   │   └── Icon-App-29x29@2x.png
│   │   │   │   │   │   └── Icon-App-76x76@2x.png
│   │   │   │   │   │   └── Icon-App-40x40@2x.png
│   │   │   │   │   │   └── Icon-App-1024x1024@1x.png
│   │   │   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   │   │   ├── LaunchImage.imageset
│   │   │   │   │   │   └── README.md
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   │   └── LaunchImage@3x.png
│   │   │   │   │   │   └── LaunchImage.png
│   │   │   │   │   │   └── LaunchImage@2x.png
│   │   │   ├── Runner.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   │   ├── xcshareddata
│   │   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   ├── Flutter
│   │   │   │   └── Release.xcconfig
│   │   │   │   └── Debug.xcconfig
│   │   │   │   └── AppFrameworkInfo.plist
│   │   │   ├── RunnerTests
│   │   │   │   └── RunnerTests.swift
│   │   ├── lib
│   │   │   └── main.dart
│   │   │   ├── utils
│   │   │   │   └── env.dart
│   │   │   │   └── storage_keys.dart
│   │   │   │   └── helper.dart
│   │   │   │   └── type_def.dart
│   │   │   ├── views
│   │   │   │   ├── profile
│   │   │   │   │   └── educationalDetails.dart
│   │   │   │   │   └── pastQualification.dart
│   │   │   │   │   └── MultiStepForm.dart
│   │   │   │   │   └── verifyProfile.dart
│   │   │   │   │   └── bankDetails.dart
│   │   │   │   │   └── personalDetails.dart
│   │   │   │   │   └── incomeDetails.dart
│   │   │   │   │   └── parentDetails.dart
│   │   │   │   │   └── hostelDetails.dart
│   │   │   │   │   └── addressDetails.dart
│   │   │   │   │   └── domicileDetails.dart
│   │   │   │   │   └── profile.dart
│   │   │   │   ├── auth
│   │   │   │   │   └── login.dart
│   │   │   │   │   └── register.dart
│   │   │   │   │   └── getStarted.dart
│   │   │   │   ├── settings
│   │   │   │   │   └── settings.dart
│   │   │   │   ├── displayDocument
│   │   │   │   │   └── displayDocument.dart
│   │   │   │   ├── drawerView
│   │   │   │   │   └── drawerView.dart
│   │   │   │   │   └── customDrawerView.dart
│   │   │   │   ├── scholarships
│   │   │   │   │   └── scholarships.dart
│   │   │   │   │   └── myAppliedScholarships.dart
│   │   │   │   │   └── scholarshipDetail.dart
│   │   │   │   ├── homePage
│   │   │   │   │   └── homePage.dart
│   │   │   ├── services
│   │   │   │   └── storage_services.dart
│   │   │   ├── theme
│   │   │   │   └── theme.dart
│   │   │   ├── routes
│   │   │   │   └── route.dart
│   │   │   │   └── route_names.dart
│   │   │   ├── controllers
│   │   │   │   └── auth_controller.dart
│   │   │   │   └── profileController.dart
│   │   │   │   └── mySchemesController.dart
│   │   │   │   └── scholarshipController.dart
│   │   │   │   └── themeController.dart
│   │   │   │   └── settingController.dart
│   │   │   ├── core
│   │   │   │   ├── network
│   │   │   │   │   └── dio_client.dart
│   │   │   │   │   └── token_service.dart
│   │   │   ├── widets
│   │   │   │   └── auth_input.dart
│   │   │   │   └── confirmDialog.dart
│   │   │   │   └── drawerRow.dart
│   │   │   │   └── transformer.dart
│   │   │   ├── models
│   │   │   │   └── menuItem.dart
│   │   │   │   └── scholarshipModel.dart
│   │   │   │   └── myAppliedSchemesModel.dart
│   │   │   │   └── tabItem.dart
│   │   │   │   └── profileModel.dart
│   ├── .idea
│   │   └── workspace.xml
│   │   └── other.xml
│   │   └── vcs.xml
│   ├── backend
│   │   └── package-lock.json
│   │   └── readme.md
│   │   └── .prettierrc
│   │   └── package.json
│   │   └── .prettierignore
│   │   └── .gitignore
│   │   ├── src
│   │   │   └── server.js
│   │   │   └── app.js
│   │   │   ├── utils
│   │   │   │   └── ApiResponse.js
│   │   │   │   └── ApiError.js
│   │   │   │   └── cloudinary.js
│   │   │   │   └── asyncHandler.js
│   │   │   ├── config
│   │   │   │   └── database.js
│   │   │   ├── routes
│   │   │   │   └── application.routes.js
│   │   │   │   └── user.routes.js
│   │   │   │   └── scholarship.routes.js
│   │   │   │   └── admin.routes.js
│   │   │   │   └── notification.routes.js
│   │   │   │   └── profile.routes.js
│   │   │   │   └── institute.routes.js
│   │   │   ├── middlewares
│   │   │   │   └── multer.middleware.js
│   │   │   │   └── auth.middleware.js
│   │   │   ├── controllers
│   │   │   │   └── institute.controller.js
│   │   │   │   └── user.controller.js
│   │   │   │   └── admin.controller.js
│   │   │   │   └── scholarship.controller.js
│   │   │   │   └── profile.controller.js
│   │   │   │   └── application.controller.js
│   │   │   │   └── notification.controller.js
│   │   │   ├── validators
│   │   │   │   └── institute.validator.js
│   │   │   │   └── user.validator.js
│   │   │   │   └── profile.validator.js
│   │   │   │   └── admin.validator.js
│   │   │   │   └── scholarship.validator.js
│   │   │   ├── models
│   │   │   │   └── scholarship.model.js
│   │   │   │   └── user.model.js
│   │   │   │   └── profile.model.js
│   │   │   │   └── application.model.js
│   │   │   │   └── admin.model.js
│   │   │   │   └── notification.model.js
│   │   │   │   └── institute.model.js
│   │   ├── public
│   │   │   ├── temp
│   │   │   │   └── .gitkeep
│   │   │   ├── images
│   │   │   │   └── .gitkeep
```