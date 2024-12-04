# Notes App

**Notes** is a feature-rich Flutter application designed for organizing your thoughts and ideas. With a clean and intuitive interface, the app allows users to create, customize, and manage notes effortlessly.

---

## Features

- **Add Notes**: Create new notes with ease.
- **Customize Notes**:
  - Choose a background color for your notes.
  - Select from various font families.
  - Change text font colors to suit your preferences.
- **Update and Delete Notes**: Modify your notes or remove them when no longer needed.
- **Smooth Animations**: Experience seamless transitions and animations for a delightful user experience.
- **Efficient Data Management**: Notes are saved locally using the **sqflite** database.

---

## Technologies Used

The app is built using modern Flutter practices, focusing on performance and maintainability.

- **Flutter Framework**: Cross-platform mobile development.
- **State Management**: Powered by **Cubit** for predictable and scalable state handling.
- **Dependency Injection**: Implemented with **getIt** for clean architecture.
- **Local Database**: Utilizes **sqflite** for offline storage.
- **Animations**: Enhances user interactions with smooth and responsive animations.

---

## Clean Architecture

The project is structured following the principles of Clean Architecture to ensure scalability, testability, and maintainability.

- **Presentation Layer**: Handles the UI and user interactions with Cubit for state management.
- **Domain Layer**: Contains the core business logic and use cases.
- **Data Layer**: Manages data sources, including the sqflite database and repositories.

---

## Screenshots

Add screenshots or GIFs here to showcase your app's UI and features.  
Example:  
![Screenshot_1731939055](https://github.com/user-attachments/assets/b3b26339-140a-4ccb-b71d-2aba9cf63e01)

---

## Installation

To run the Notes app locally, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/notes-app.git
