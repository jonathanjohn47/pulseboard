# Pulseboard Analytics Dashboard - Finexos Technical Test

This Flutter web application, **"Pulseboard"**, serves as a small analytics dashboard built as part of the Finexos Flutter Developer role selection process. It is designed to be a realistic demonstration of the kind of work expected at Finexos and an opportunity to showcase **design thinking, technical decisions, and attention to detail**.

## Goal

The primary goal of this project is to build a Flutter web app that acts as a small analytics dashboard, effectively demonstrating:

*   **Design/UX skills**: Polished layouts and custom charts.
*   **Architecture**: Clean, domain-driven folder structure.
*   **Use of key technologies**: Riverpod (state management), AutoRoute (routing), and Freezed (data modeling).
*   **Testing practices**: Implementation of unit and widget tests.

## Key Features

*   **Flutter Web Application**: A dashboard accessible directly in the browser.
*   **Domain-Driven Folder Structure**: The codebase is organized into distinct layers with clear responsibilities, such as `domain/`, `data/`, `application/` (or `features/`), and `presentation/`.
*   **Navigation with AutoRoute**: Implemented with at least three screens:
    *   **Dashboard**: Provides a high-level overview of sensor data.
    *   **Details**: Displays advanced charts for a selected sensor or facility.
    *   **Settings**: Includes toggles to simulate offline sensors and error states.
*   **State Management with Riverpod**: Used to manage:
    *   Sensor data.
    *   Current selections.
    *   Simulation toggles.
*   **Data Modeling with Freezed**: Employed for creating robust and concise sensor data models (e.g., temperature, humidity, status). The `SensorData` model in the sources includes fields for `sensorId`, `temperature`, `humidity`, `pressure`, `status`, and `time`. The `DashboardData` model contains a list of `SensorData`.
*   **Mock Data and Custom Chart**: No real backend is used; the application relies on mock data. A **custom, interactive "bubble chart"** is implemented to display multiple metrics:
    *   **X-axis**: Represents time (e.g., hourly from 08:00–18:00) or sensor location (e.g., "Line A," "Line B," etc.).
    *   **Y-axis**: Displays temperature (or another key metric).
    *   **Bubble size**: Controlled by humidity or pressure, selectable via a toggle.
    *   **Bubble color**: Indicates sensor status based on anomaly level:
        *   0% anomaly → Green
        *   1–50% anomaly → Yellow
        *   51–100% anomaly → Red
        *   Offline / Unknown → Gray
*   **Edge Case Handling**: The application accounts for:
    *   **Missing data**: Displayed with a placeholder (e.g., "?") or a distinct shape.
    *   **Offline sensors**: Represented by a gray bubble, optionally smaller or translucent.
*   **User-Configurable Chart**: Toggles are provided to allow users to choose which metric determines the bubble size. The settings screen in the provided code includes toggles for switching between temperature and humidity display.
*   **Design and Responsiveness**: The application is designed to be visually appealing and responsive, with consistent styling (color palette, text, spacing).
*   **Comprehensive Testing**: The project includes:
    *   **Unit tests** for key logic (e.g., data transformations, state changes), as demonstrated in the `unit_test.dart` file which tests the minimum and maximum temperature and humidity providers.
    *   **Widget tests** for at least one major component, such as the custom chart widget, as shown in `widget_test.dart` which tests the switching between temperature and humidity in the settings screen.

## Technologies Used

*   **Flutter**: The primary framework for building the web application.
*   **Riverpod**: Used for robust state management. The `providers/dashboard_provider.dart` file defines providers for accessing dashboard data and derived states like minimum and maximum temperature, humidity, and pressure.
*   **AutoRoute**: Implemented for declarative routing. The `utility/router.dart` and `utility/router.gr.dart` files define the application's routes for the `DashboardScreen`, `DetailsScreen`, and `SettingsScreen`.
*   **Freezed**: Utilized for efficient data modeling, as seen in the `models/dashboard_data.dart`, `models/sensor_data.dart`, and their generated `.freezed.dart` and `.g.dart` files.

## How to Run the Project

1.  Ensure you have Flutter installed and configured for web development.
2.  Clone this GitHub repository.
3.  Navigate to the project directory in your terminal.
4.  Run the command: `flutter run -d chrome`

## How to Run Tests

Instructions on how to run the tests are as follows:

1.  Navigate to the project directory in your terminal.
2.  Navigate to the `test/` directory.
3.  To run unit tests, use the command: `flutter test unit_test.dart`
4.  To run widget tests, use the command: `flutter test widget_test.dart`

## Folder Structure and Design Decisions

The project follows a domain-driven architecture, separating concerns into distinct layers.

*   **domain/**: Contains core business logic and entities (e.g., sensor data).
*   **data/**: Handles data sources and repositories (in this case, mock data).
*   **application/** (or **features/**): Implements use cases and application logic, often using Riverpod providers. The `providers/` directory serves this purpose in the provided code.
*   **presentation/**: Contains the UI layer (widgets and screens), such as the `screens/` and `widgets/` directories.

Key design decisions include the choice of Riverpod for reactive state management, AutoRoute for type-safe navigation, and Freezed for boilerplate-free data classes. The custom bubble chart in the `DashboardScreen` is implemented using `syncfusion_flutter_charts`. The `SettingsScreen` allows toggling between temperature and humidity as the primary metric displayed on the `DashboardScreen`. The `DetailsScreen` provides more detailed views of the sensor data using different chart types.
