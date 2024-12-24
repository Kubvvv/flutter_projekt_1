# **Projekt 1: To-Do List**

A simple Flutter application to manage tasks. The app allows users to add tasks, mark tasks as done, move tasks back to "To-Do," and delete tasks. Tasks are dynamically categorized into "To-Do Tasks" and "Done Tasks" for better organization.

## **Features**

- Add new tasks to the "To-Do" list.
- Mark tasks as done and move them to the "Done Tasks" section.
- Undo completed tasks and move them back to the "To-Do" section.
- Delete tasks from either list.
- Automatically disables the "Add Task" button when the input field is empty.
- Dynamically updates the UI to reflect changes.

---

## **Screenshots**

> Include screenshots of the app in the To-Do and Done Tasks states here. If you’d like, I can guide you on how to take screenshots or mockups.

---

## **Technologies Used**

- **Flutter**: A UI toolkit for building natively compiled apps.
- **Dart**: The programming language used in Flutter development.

---

## **How to Run the App**

Follow these steps to run the project locally:

### **1. Prerequisites**

- Install Flutter on your system:
  - Follow the [Flutter installation guide](https://docs.flutter.dev/get-started/install) for your operating system.
- Ensure you have an emulator or physical device ready:
  - For iOS: Install Xcode and set up an iOS simulator.
  - For Android: Install Android Studio or set up Android Debug Bridge (ADB).
- Install a code editor (e.g., VS Code or Android Studio).

---

### **2. Clone the Repository**

Clone the project repository to your local machine:

```bash
git clone https://github.com/your-username/projekt_1_todo_list.git
cd projekt_1_todo_list
```

---

### **3. Install Dependencies**

Run the following command to fetch all the necessary dependencies:

```bash
flutter pub get
```

---

### **4. Run the App**

- For iOS:
  ```bash
  flutter run -d ios
  ```
- For Android:
  ```bash
  flutter run -d android
  ```
- For Web (if enabled):
  ```bash
  flutter run -d chrome
  ```

If you are using VS Code, you can press `F5` or click "Run" in the debug menu.

---

### **5. Features in the App**

Once the app is running:

1. **Add Tasks**:
   - Enter a task in the input field and click the "Add Task" button.
   - Tasks are automatically added to the "To-Do Tasks" list.
2. **Mark as Done**:
   - Click the checkmark icon next to a task to move it to the "Done Tasks" list.
3. **Undo Tasks**:
   - Click the undo icon next to a completed task to move it back to the "To-Do Tasks" list.
4. **Delete Tasks**:
   - Click the trash can icon to delete a task permanently.

---
