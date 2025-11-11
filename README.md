# User Items App (Afrifounders Flutter Task)

A Flutter mini-app that allows users to manage a list of items (tasks, notes, or shopping items).
Built using **Clean Architecture**, **Bloc** for state management, Dio & Retrofit for networking, **Hive** for local persistence, and Freezed for immutable models and union states.
The app supports offline access, **pagination, add/edit/delete functionality**, and a smooth, responsive UI.


Home Screen Page ( Item Board ) 


https://github.com/user-attachments/assets/74daabf4-d696-4e84-b22c-e9673a5e5c85



## 📌 Demo Video
 
The full video is too large to upload here.  
Copy the link below into your browser to watch the full demo video:

```bash
https://drive.google.com/file/d/1-2NMH91JZTc20eUwbPq_JoKK7AH6LE6m/view?usp=sharing
```

In the demo, I showcased:

- Add, edit, and delete items with toast notifications

- Fetches data from MockAPI (real network requests)

- Offline support with cached data using Hive

- Network connection checker to handle online/offline states

- Pagination for large item lists

- Smooth navigation between screens using AutoRoute

- Loading, error, and empty states handling


## 🚀 Getting Started

### 📦 Installation

**Clone the Repository**

```bash
git clone git@github.com:jmcfx/startup-task-app.git

cd startup-task-app
```


### 🚀 Steps to Run




#### 1. 🔧 Set Up Dependencies and Generate Code ‼️

Run the following to clean the project, install dependencies, generate localization, and `build_runner` outputs (e.g., `freezed`, `json_serializable`):
```bash
make fresh
``` 
This will run the following commands:


-   `flutter clean` – Resets the build directory
-   `flutter pub get` – Fetches dependencies
-   `dart run build_runner build -d` – Generates `freezed`, `json_serializable`

#### 2. 🚀 Run the app on a connected device or emulator ‼️

```bash
flutter run
```

### 3. 🔄 Regenerate Code Only

If you just need to regenerate code (e.g., after editing models or annotations):

```bash
make runner
```

> Runs `dart run build_runner build -d`

#### 4. 👀 Watch for File Changes

Automatically regenerates code on file changes during development:
```bash
make watch
```

> Runs `dart run build_runner watch -d`

#### 5. 📦 Build APK (for Android)

To create an APK:
```bash
make apk
``` 

> Equivalent to:  
> `flutter clean && flutter build apk`


## Folder Structure :open_file_folder:


```
lib/
├─ core/
│ ├─ app/ 
│ ├─ enums/ 
│ ├─ errors/
│ ├─ extension/ 
│ ├─ networks/ 
│ ├─ use_case/
│ └─ utils/ 
├─ di/ 
├─ features/
│ └─ items/
│ ├─ data/
│ │ ├─ client/ 
│ │ ├─ data_sources/ 
│ │ ├─ models/ 
│ │ └─ repositories_impl/ 
│ ├─ domain/
│ │ ├─ entities/ 
│ │ ├─ repositories/
│ │ └─ use_cases/
│ └─ presentation/
│ ├─ blocs/ 
│ ├─ pages/ 
│ └─ widgets/ 
├─ shared/ 
└─ main.dart/
```

### ✨ Features

🧼 Clean Architecture & Bloc state management

💾 Local persistence & offline support using Hive

🔄 Pagination support for large lists

📝 Add, Edit, Delete items with smooth UI

⚡ Loading, empty, and error states handled

🌐 Networking with Dio & Retrofit

🧩 Reusable UI widgets for flexibility

📱 Responsive design using ScreenUtil

🔗 Smooth navigation using AutoRoute *( HomeScreen, Edit Item Screen, Add Item Screen )*

✅ Offline mode with cached data fallback


### Architecture

This project follows Clean Architecture principles:

Data Layer: Handles network requests, local caching, and repository implementations.

Domain Layer: Contains entities, abstract repositories, and use cases.

Presentation Layer: UI implementation with Bloc for state management and reusable widgets.

## 📦 Dependencies

- **flutter** – The core Flutter SDK used to build cross-platform apps.
- **cupertino_icons** – Provides iOS-style icons for your Flutter app.
- **dartz** – Functional programming tools for Dart (e.g., Either, Option types).
- **equatable** – Simplifies value comparison in Dart classes, useful for state management.
- **dio** – A powerful HTTP client with interceptors and cancellation support.
- **freezed_annotation** – For generating immutable data classes with `freezed`.
- **json_annotation** – Provides annotations for JSON serialization with `json_serializable`.
- **retrofit** – Type-safe HTTP client generator inspired by Retrofit.
- **get_it** – Lightweight service locator for dependency injection.
- **internet_connection_checker** – Checks internet connectivity status.
- **hive** – Lightweight and fast key-value database for local storage.
- **flutter_bloc** – Bloc library for state management in Flutter.
- **flutter_screenutil** – For responsive UI scaling.
- **delight_toast** – Easy-to-use toast notifications.
- **logger** – Logging utility to track events, errors, and debug info.


### Dev Dependencies

- **flutter_test** – Flutter's built-in testing framework.
- **flutter_lints** – Lint rules for Flutter projects.
- **build_runner** – Runs code generation tools like `freezed` or `json_serializable`.
- **freezed** – Code generator for immutable classes and unions/sealed classes.
- **json_serializable** – Generates JSON serialization logic for annotated models.
- **retrofit_generator** – Generates Retrofit API client code from annotations.
