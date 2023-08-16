<a href="https://flutter.dev/"><img src="https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png" align="right" width="10%"></a>
# Weathque

## Description
Weathque is a dynamic weather application created using Flutter and Dart, offering a seamless way to stay informed about the weather conditions. Embrace every day fully prepared with accurate real-time weather updates and a comprehensive 5-day forecast. Designed with the user in mind, Weathque integrates a [Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) pattern, combining [Repository](https://developer.android.com/codelabs/basic-android-kotlin-training-repository-pattern#3) and [Bloc](https://bloclibrary.dev/#/flutterbloccoreconcepts) patterns, to ensure efficient data management and an intuitive experience.

## Table of Contents
- [Design](#design)
- [Architecture](#architecture)
- [Features](#features)
- [Supported platforms](#supported-platforms)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots and Demo](#screenshots-and-demo)
- [Used Packages](#used-packages)
- [License](#license)

<a name="design"/></a>
## Design
![Design](https://github.com/tortamque/Weathque/assets/90132962/e50c68f4-77da-4de9-8da8-c4302d3e8515)
</br><i>All design credits belong to [Desire Creative Agency](https://dribbble.com/desire-creative_agency).</i>
</br><i>The original design was taken from [Dribbble](https://dribbble.com/shots/20675054-Mobile-Weather-app).</i>

<a name="architecture"/></a>
## Architecture
Weathque fully embraces the Clean Architecture pattern, incorporating both the Bloc and Repository patterns.</br></br>
<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/90132962/261075240-56f7197b-7a51-4c80-94c1-206382e6fb1a.png" width="90%">


<a name="features"/></a>
## Features
- Get the latest weather data using the [OpenWeatherMap API](https://openweathermap.org/api) for up-to-the-moment accuracy.
- Access a 5-day weather forecast to plan ahead.
- Get weather updates for a variety of cities, allowing you to stay informed about conditions worldwide.
- Elegant design featuring captivating animations and a vibrant color palette.
- Experience a responsive design that seamlessly adapts to different devices.

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

<a name="screenshots-and-demo"/></a>
## Screenshots and Demo
### Screenshots
<img src="https://github.com/tortamque/Weathque/assets/90132962/87803b01-3b25-4b50-a674-eab5a1a57618" alt="Screenshot_1" width="200">
<img src="https://github.com/tortamque/Weathque/assets/90132962/e11c5b37-11c0-4311-9fb0-86b3c558e001" alt="Screenshot_2" width="200">
<img src="https://github.com/tortamque/Weathque/assets/90132962/4cd6d3ab-b7c3-4d03-bfe1-84ac0fd94cd9" alt="Screenshot_3" width="200">

### Demo
https://github.com/tortamque/Weathque/assets/90132962/c11dfbac-eea0-438b-afae-ba1658024ed2


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

<a name="licenses"/></a>
## License
Apache License Version 2.0
