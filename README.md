# Simple Weather App

## Overview

This is a simple weather application built using the OpenWeather API, Lottie animations for enhanced visuals, and geolocation services using the Geolocator and Nominatim (OpenStreetMap) for reverse geocoding. The app provides current weather information based on the user's location and displays it with beautiful animations.

## Features

- **Current Weather**: Fetches and displays the current weather for the user's location.
- **Geolocation**: Automatically detects the user's location using GPS.
- **Reverse Geocoding**: Converts geographic coordinates into a readable address using Nominatim.
- **Animated Weather**: Utilizes Lottie animations to display visually appealing weather conditions.
- **Responsive UI**: The app's user interface adapts to different screen sizes for a consistent experience.

## Technologies Used

- **[OpenWeather API](https://openweathermap.org/api)**: Provides the weather data used by the app.
- **[Lottie](https://airbnb.io/lottie/)**: Handles the animations for the weather conditions.
- **[Geolocator](https://pub.dev/packages/geolocator)**: Manages location services and provides the user's current location.
- **[Nominatim](https://nominatim.org/)**: A geocoding service that converts coordinates into a human-readable address.

## Getting Started

### Prerequisites

- **Flutter SDK**: Ensure you have Flutter installed on your machine.
- **OpenWeather API Key**: Sign up for an API key from [OpenWeather](https://home.openweathermap.org/users/sign_up).

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/simple-weather-app.git
    ```
2. Navigate to the project directory:
    ```bash
    cd simple-weather-app
    ```
3. Install dependencies:
    ```bash
    flutter pub get
    ```
4. Add your OpenWeather API key:
   - Open `lib/constants.dart`.
   - Replace `YOUR_API_KEY` with your actual OpenWeather API key.
    ```dart
    const String weatherApiKey = 'YOUR_API_KEY';
    ```
5. Run the app:
    ```bash
    flutter run
    ```

### Configuration

- **Geolocation**: The app uses the Geolocator plugin to fetch the user's location. Ensure that location services are enabled on your device.
- **Reverse Geocoding**: The app uses Nominatim for reverse geocoding, which converts latitude and longitude into a readable address.

## Usage

- Open the app, and it will automatically fetch and display the weather for your current location.
- The weather data will be accompanied by Lottie animations that correspond to the current weather conditions.

## Screenshots

Add some screenshots or GIFs showing the app in action.

## Contributing

Contributions are welcome! If you have any ideas, feel free to fork the project and submit a pull request.

### Steps to Contribute

1. Fork the repository.
2. Create a new branch:
    ```bash
    git checkout -b feature-branch
    ```
3. Make your changes.
4. Commit your changes:
    ```bash
    git commit -m 'Add some feature'
    ```
5. Push to the branch:
    ```bash
    git push origin feature-branch
    ```
6. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- **OpenWeather** for providing the weather data.
- **Lottie** for the beautiful animations.
- **Geolocator** and **Nominatim** for handling geolocation and reverse geocoding.

## Contact

If you have any questions or suggestions, feel free to reach out.

- **Email**: your-email@example.com
- **GitHub**: [your-username](https://github.com/your-username)
