# To-Do List App

A simple, interactive To-Do List app built with Flutter and GetX. This app helps you manage tasks by adding, editing, checking off, and deleting them. It includes three screens: a main list, an edit screen, and a completed tasks view. Data persists across app restarts using local storage.

This project is designed for learning Flutter concepts like state management (GetX), reactive UI, navigation, animations, and gestures. It builds on basic skills (from a weather app) and introduces new ones like filtering lists and passing data between screens.

## Features

- **Add Tasks**: Type and add new tasks to your list
- **Mark as Done/Undone**: Check/uncheck tasks with a checkbox
- **Edit Tasks**: Tap a task to edit its title on a separate screen
- **Delete Tasks**: Swipe left on a task to delete it with animation
- **View Completed Tasks**: Navigate to a dedicated screen showing only completed tasks (tap to unmark)
- **Persistence**: Tasks are saved locally and reload when you reopen the app
- **UI Enhancements**: Gradient backgrounds, fade-in animations, custom themes, and swipe gestures for a modern feel
- **Reactive Updates**: The UI updates automatically when tasks change (thanks to GetX)

## Screenshots/Mockups

### Home Screen
```
+-----------------------------+
|       To-Do List (App Bar)  |
+-----------------------------+
| [Add task field] [Add Btn]  |
+-----------------------------+
| [ ] Buy milk                |
| [X] Walk dog (strikethrough)|
+-----------------------------+
```

### Edit Screen
```
+-----------------------------+
|        Edit Task            |
+-----------------------------+
| [Pre-filled: Walk dog]      |
| [Save Button]               |
+-----------------------------+
```

### Completed Tasks Screen
```
+-----------------------------+
|     Completed Tasks         |
+-----------------------------+
| [✓] Walk dog (tap to unmark)|
+-----------------------------+
```

## Technologies Used

- **Flutter**: Framework for building the UI and app logic
- **GetX**: For state management (reactive variables), navigation (routes), and dependency injection
- **SharedPreferences**: For saving/loading tasks locally (no database needed for simplicity)
- **Dart**: Programming language for all code

**Why These?** Flutter is cross-platform (Android/iOS). GetX simplifies state and navigation compared to setState. SharedPreferences is lightweight for small data like this.

## Installation and Setup

Follow these steps to run the app on your machine. This assumes you have Flutter installed (if not, visit [flutter.dev](https://flutter.dev) for setup).

### 1. Clone or Create the Project

Open a terminal and run:
```bash
flutter create todo_app
cd todo_app
```

### 2. Add Dependencies

Open `pubspec.yaml` and add these under `dependencies`:
```yaml
get: ^4.6.5
shared_preferences: ^2.2.2
```

Run the following to install them:
```bash
flutter pub get
```

### 3. Add the Code

Replace the contents of the following files with the code provided in the project:
- `lib/main.dart`
- `lib/models/task_model.dart`
- `lib/controllers/task_controller.dart`
- `lib/screens/home_screen.dart`
- `lib/screens/edit_task_screen.dart`
- `lib/screens/completed_tasks_screen.dart`

Ensure the folder structure matches:
```
lib/
├── main.dart
├── models/
│   └── task_model.dart
├── controllers/
│   └── task_controller.dart
└── screens/
    ├── home_screen.dart
    ├── edit_task_screen.dart
    └── completed_tasks_screen.dart
```

### 4. Run the App

Connect a device/emulator and run:
```bash
flutter run
```

The app should open on the home screen.

### Troubleshooting

- If you get errors like "Package not found," run `flutter pub get` again
- For Android/iOS issues, check `flutter doctor` for setup problems
- If navigation fails, ensure routes in `main.dart` match the screen names

## Usage Guide

Once the app is running, here's how to use it:

### Adding Tasks
On the home screen, type a task (e.g., "Buy groceries") in the text field and press the "Add Task" button or hit Enter. The task appears in the list.

### Marking Tasks as Done
Tap the checkbox next to a task. It gets a strikethrough and moves to "completed" status.

### Editing Tasks
Tap on a task's title. It opens the edit screen with the title pre-filled. Change the text and tap "Save." The app returns to the home screen with the update.

### Deleting Tasks
Swipe left on a task. A red delete background appears—release to confirm.

### Viewing Completed Tasks
Tap the check-circle icon in the app bar (top-right) to see only completed tasks. Tap one to unmark it (removes from completed list).

### Persistence
Close and reopen the app—your tasks are still there!

**Learning Tips**: Experiment by changing colors in the theme or adding a new feature (e.g., task priorities). This reinforces how GetX and reactive UI work.

## Project Structure

```
todo_app/
├── lib/
│   ├── main.dart                 # App entry point and routes
│   ├── models/
│   │   └── task_model.dart       # Task data class
│   ├── controllers/
│   │   └── task_controller.dart  # Logic for tasks (add, edit, etc.)
│   └── screens/
│       ├── home_screen.dart      # Main list screen
│       ├── edit_task_screen.dart # Edit task screen
│       └── completed_tasks_screen.dart # Completed tasks screen
├── pubspec.yaml                  # Dependencies
├── README.md                     # This file
└── ... (other Flutter files)
```

**Why This Structure?** It separates concerns: Models for data, Controllers for logic, Screens for UI. This makes the code easy to read and expand.

## Contributing

This is a learning project! If you want to improve it:

- Add features like categories or due dates
- Fix bugs or improve UI (e.g., add icons)
- Share your changes by forking on GitHub

## License

This project is for educational purposes. Feel free to use and modify it.

## Author

Built as a learning exercise. If you have questions, check the code comments or ask in the community!
