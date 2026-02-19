Movie Browser
A Flutter-based movie browsing application developed as part of a technical interview assignment.

This project demonstrates clean architecture principles, scalable state management, dependency injection, and local caching strategies within a modern Flutter application.

Overview
Movie Browser allows users to browse movies, retrieve data from a remote API, and cache content locally for improved performance and offline access.

The architecture prioritizes:

Separation of concerns
Maintainability
Clear and predictable state management
Architecture & Tech Stack
State Management
BLoC – Reactive state management with predictable state transitions
Dependency Injection
AutoInjector – Modular and scalable dependency management
Networking
Dio – HTTP client for API communication
Local Storage
Hive – Lightweight and efficient local NoSQL database
Global Communication
EventBus – Event-driven communication layer
Localization
Intl – Internationalization support
Known Limitations and Future Improvements
Due to the one-week delivery timeline, several enhancements were not completed:


Comprehensive runtime and network error handling
Full accessibility support
Expanded BLoC unit test coverage
The project was delivered within the agreed timeframe. With additional time, priority would be given to strengthening error handling mechanisms, improving accessibility compliance, and increasing automated test coverage to enhance overall robustness and maintainability.

Getting Started
1. Clone the Repository
git clone <repository-url>
cd movie_browser
