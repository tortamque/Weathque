<a href="https://flutter.dev/"><img src="https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png" align="right" width="10%"></a>
# Weathque

## Description
Weathque is a dynamic weather application created using Flutter and Dart, offering a seamless way to stay informed about the weather conditions. Embrace every day fully prepared with accurate real-time weather updates and a comprehensive 5-day forecast.</br>
Designed with the user in mind, Weathque integrates a [Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) pattern, combining [Repository](https://developer.android.com/codelabs/basic-android-kotlin-training-repository-pattern#3) and [Bloc](https://bloclibrary.dev/#/flutterbloccoreconcepts) patterns, to ensure efficient data management and an intuitive experience.

## Table of Contents
- [Design](#design)
- [Architecture](#architecture)
- [Features](#features)
- [Supported platforms](#supported-platforms)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots and Demo](#screenshots-and-demo)
- [Changelog](#changelog)
- [Used Packages](#used-packages)
- [License](#license)

<a name="design"/></a>
## Design
![Design](https://github.com/tortamque/Weathque/assets/90132962/e50c68f4-77da-4de9-8da8-c4302d3e8515)
</br><i>All design credits belong to [Desire Creative Agency](https://dribbble.com/desire-creative_agency).</i>
</br><i>The original design was taken from [Dribbble](https://dribbble.com/shots/20675054-Mobile-Weather-app).</i>

<a name="architecture"/></a>
## Architecture
Weathque fully embraces the Clean Architecture pattern, incorporating both the Bloc and Repository patterns.</br>
Clean Architecture consists of the following layers: 
1) Data Layer
2) Domain Layer (Business Logic)
3) Presentation Layer (UI) </br></br>

Architecture for <b>API calls</b>:
![API](https://github.com/tortamque/Weathque/assets/90132962/4293e9f4-f2ef-4255-ae59-b6caa9a0bb3f)

Architecture for <b>Storage calls</b>:
![Prefs](https://github.com/tortamque/Weathque/assets/90132962/33e5c053-7fcc-4080-819c-6d823adf6220)

<a name="features"/></a>
## Features
- Get the latest weather data using the [OpenWeatherMap API](https://openweathermap.org/api) for up-to-the-moment accuracy.
- Access a 5-day weather forecast to plan ahead.
- Get weather updates for a variety of cities, allowing you to stay informed about conditions worldwide.
- Elegant design featuring captivating animations and a vibrant color palette.
- Experience a responsive design that seamlessly adapts to different devices.
- Easily add your own cities and track the weather in each of them.

<a name="supported-platforms"/></a>
## Supported platforms
Weathque is a cross-platform mobile application that supports both <b>Android</b> and <b>iOS</b> platforms.

<a name="installation"/></a>
## Installation
To run the Weathque app locally, follow these steps:

1. Clone this repository to your local machine.
2. Ensure you have Flutter and Dart installed on your system.
3. Navigate to the project directory in your terminal.
4. Run the command `flutter pub get` to install the required dependencies.
5. Connect a device or start an emulator.
6. Run the command `flutter run` to launch the app.

<a name="usage"/></a>
## Usage
1. Launch the Weathque app on your device or emulator.
2. Swipe right to navigate to the weather forecast of the next city.
3. Swipe left to move back to the weather forecast of the previous city.
4. For a 5-day weather forecast, simply swipe the "Weekly Forecast" cards.
5. To add your own city, follow these steps:
    * Tap the "Settings" icon on the app bar.   
    * Enter your city name.
    * A new card will appear on the screen.
    * Close the Settings menu.
    * Swipe to your newly added city.
7. To remove unnecessary city tap "Settings" icon on the app bar
    * Tap the "Settings" icon on the app bar.
    * Swipe right or left on the city you want to remove.
    * The city will be removed.

<a name="screenshots-and-demo"/></a>
## Screenshots and Demo
### Screenshots
<img src="https://github.com/tortamque/Weathque/assets/90132962/46b8891c-d7a9-48eb-8787-a572dbc0edd1" alt="Screenshot_1" width="200">
<img src="https://github.com/tortamque/Weathque/assets/90132962/f337aa82-84ce-43cb-a6aa-c1690c612b21" alt="Screenshot_2" width="200">
<img src="https://github.com/tortamque/Weathque/assets/90132962/21956b23-9a88-44fd-b75d-ac3185403177" alt="Screenshot_3" width="200">
<img src="https://github.com/tortamque/Weathque/assets/90132962/4b3a76ff-fb5c-4c8b-ad12-9265781df2fa" alt="Screenshot_4" width="200">

### Demo
https://github.com/tortamque/Weathque/assets/90132962/9016515a-ecdc-461d-abbc-47d882c64d4c

<a name="changelog"/></a>
## Changelog
### [1.1] - 25.08.2023
  #### Added
 - Now you can easily add your own cities and track the weather in each of them. 🔮
 
### [1.0] - 16-08-2023
  #### Added
 - Initial release.

<a name="used-packages"/></a>
## Used Packages
The Weathque app utilizes the following packages:

| Name                   | Version | Link on pub.dev                                          |
|------------------------|---------|----------------------------------------------------------|
| flutter_bloc           | 8.1.3   | [Link](https://pub.dev/packages/flutter_bloc)            |
| retrofit               | 4.0.1   | [Link](https://pub.dev/packages/retrofit)                |
| get_it                 | 7.6.0   | [Link](https://pub.dev/packages/get_it)                  |
| intl                   | 0.18.1  | [Link](https://pub.dev/packages/intl)                    |
| flutter_carousel_slider| 1.1.0   | [Link](https://pub.dev/packages/flutter_carousel_slider) |
| fluttertoast           | 8.2.2   | [Link](https://pub.dev/packages/fluttertoast)            |
| shared_preferences     | 2.2.0   | [Link](https://pub.dev/packages/shared_preferences)      |

<a name="licenses"/></a>
## License
Apache License Version 2.0
