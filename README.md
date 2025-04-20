Okay, based on the sources and our previous conversation, here is a modified version of the `readme.md` file:

# Pulseboard Analytics Dashboard

## Goal

This Flutter web application, "Pulseboard," serves as a small analytics dashboard designed to demonstrate design and UX skills, a clean domain-driven architecture, the use of Riverpod for state management, AutoRoute for routing, Freezed for data modeling, and comprehensive testing practices. This project fulfills the requirements outlined in the Finexos technical test brief.

## Key Features

*   **Flutter Web Application**: A dashboard accessible directly in the browser.
*   **Domain-Driven Folder Structure**: The codebase is organized into distinct layers to maintain clear responsibilities. The project includes directories such as `domain/` (implicitly through models), `data/` (implicitly through providers managing data), `application/` (or `features/` - represented by `providers/`), and `presentation/` (comprising `screens/` and `widgets/`).
*   **Navigation with AutoRoute**: Implemented with at least three screens:
    *   **Dashboard**: Provides a high-level sensor overview. This screen (`screens/dashboard_screen.dart`) displays a bubble chart of sensor data.
    *   **Details**: Displays advanced charts for a selected sensor or facility. The `DetailsScreen` (`screens/details_screen.dart`) shows line and bubble charts for temperature, humidity, and pressure.
    *   **Settings**: Includes toggles to simulate offline sensors, error states, etc.. The `SettingsScreen` (`screens/settings_screen.dart`) currently provides toggles to switch the primary metric displayed on the Dashboard between temperature and humidity. Navigation between these screens is handled using `AutoRouter` as defined in `utility/router.dart` and utilized in the `AppBarActionIcon` widget.
*   **State Management with Riverpod**: Used extensively for managing application state:
    *   **Sensor data**: The `DashboardData` (`models/dashboard_data.dart`) containing `SensorData` (`models/sensor_data.dart`) is managed by providers like `getDashboardDataProvider` in `providers/dashboard_provider.dart`. This provider supplies the mock sensor readings.
    *   **Current selections**: While not explicitly shown in the provided snippets, the architecture supports the concept of managing selections for the "Details" screen.
    *   **Simulation toggles**: The `isTemperatureProvider` in `providers/dashboard_provider.dart` and its usage in `SettingsScreen` demonstrate the management of simulation-related states.
*   **Data Modeling with Freezed**: Employed for creating immutable data classes for sensor data. The `SensorData` model (`models/sensor_data.dart`) includes fields for `sensorId`, `temperature`, `humidity`, `pressure`, `status`, and `time`. The `DashboardData` model (`models/dashboard_data.dart`) holds a list of `SensorData`. The generated Freezed code can be seen in files like `models/dashboard_data.freezed.dart` and `models/sensor_data.freezed.dart`. JSON serialization is handled by `json_serializable` as indicated by `models/sensor_data.g.dart`.
*   **Mock Data & Custom Chart**: No real backend is used; the application relies on hardcoded mock data within `providers/dashboard_provider.dart`. A **custom, interactive "bubble chart"** is implemented in the `DashboardScreen` (`screens/dashboard_screen.dart`) using the `BubbleSeries` from the `syncfusion_flutter_charts` package.
    *   **X-axis**: Represents `data.status`, although the requirements allowed for time or sensor location.
    *   **Y-axis**: Displays either temperature or humidity, selectable via toggles in the `SettingsScreen`. The `isTemperatureProvider` controls which metric is used.
    *   **Bubble size**: Is currently determined by a fixed multiplier based on the index of the data point (`num * 2` in `DashboardScreen` and `num * 0.5` in `DetailsScreen`). **A toggle to choose between humidity and pressure as the driving metric for bubble size is not explicitly implemented in the provided code or the `SettingsScreen`**.
    *   **Bubble color**: Indicates sensor status based on the `status` field in the `SensorData` model. The colors are mapped as follows: 'cool' -> light blue, 'mild' -> blue, 'warm' -> orange, 'hot' -> red, and default -> grey. While this reflects different states, the **explicit mapping to the anomaly percentage ranges (0% -> Green, 1–50% -> Yellow, 51–100% -> Red)** as specified in the requirements is not directly visible in the provided `DashboardScreen` code. Gray is used as a default, which could represent offline or unknown status.
*   **Edge Case Handling**:
    *   **Missing data**: The provided code does not explicitly demonstrate a specific placeholder for missing data in the UI.
    *   **Offline sensors**: Represented by a gray bubble by default in the chart, which could correspond to an unknown or offline status.
*   **User-Configurable Chart**: Toggles are provided in the `SettingsScreen` to allow users to switch between temperature and humidity as the primary metric displayed on the Dashboard chart. **However, a toggle to choose the metric for bubble size (humidity vs. pressure) is not evident in the provided code**.
*   **Design and Responsiveness**: The application aims to be visually appealing with consistent styling. A basic theme is set in `main.dart`. Responsiveness would typically involve layout adjustments for different screen sizes, although specific implementations are not fully evident in the provided snippets.
*   **Comprehensive Testing**: The project includes:
    *   **Unit tests** for key logic, as demonstrated in `unit_test.dart`, which tests the `getMinimumTemperatureProvider` and `getMaximumHumidityProvider`.
    *   **Widget tests** for at least one major component. `widget_test.dart` includes a widget test for switching between temperature and humidity in the `SettingsScreen`.

## Folder Structure

The project follows a domain-driven folder structure:

*   `models/`: Contains the data models (`sensor_data.dart`, `dashboard_data.dart`, `user.dart`) defined using Freezed.
*   `providers/`: Holds the Riverpod providers (`dashboard_provider.dart`) for managing application state and accessing data.
*   `screens/`: Contains the UI screens (`dashboard_screen.dart`, `details_screen.dart`, `settings_screen.dart`) built with Flutter widgets.
*   `widgets/`: Includes reusable UI components (`app_bar_action_icon.dart`).
*   `utility/`: Contains utility classes and configurations, such as the `AutoRoute` setup (`router.dart`, `router.gr.dart`).

## Running the Project

1.  Ensure you have Flutter installed and set up for web development.
2.  Clone the GitHub repository.
3.  Navigate to the project directory in your terminal.
4.  Run the command: `flutter run -d chrome`.

## Running Tests

1.  Navigate to the project directory in your terminal.
2.  To run unit tests, execute: `flutter test unit_test.dart`.
3.  To run widget tests, execute: `flutter test widget_test.dart`.

## Design Decisions

The application leverages Flutter's widget-based UI framework, Riverpod for reactive state management, AutoRoute for simplified navigation, and Freezed for concise and robust data modeling. The use of a domain-driven folder structure aims to separate concerns and improve code maintainability. The bubble chart was chosen as the primary visualization for the dashboard to display multiple sensor metrics simultaneously, utilizing the `syncfusion_flutter_charts` library for its interactive capabilities. Mock data was used to simulate sensor readings as no real backend was required.