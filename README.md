# Weather App 🌦️

This is a simple and visually appealing weather application that allows users to check the current weather details of any location. It uses the [OpenWeatherMap API](https://openweathermap.org/api) for weather data and provides animated icons and GIFs to enhance the user experience.

---

## Features
- 🌍 **Search by Location**: Enter the name of any city to fetch weather details in real-time.
- 📊 **Weather Details**: Displays temperature, humidity, wind speed, and more.
- 🎨 **Dynamic Icons and Animations**: Shows icons and GIF animations tailored to the weather condition (e.g., sunny, rainy, snowy).
- 🕒 **Static Date & Time**: The date and time match the weather data's fetch moment.

---

## Technologies Used
- **Frontend**: Flutter (Dart)
- **State Management**: Riverpod
- **API**: [OpenWeatherMap API](https://openweathermap.org/api)

---

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/1Shibam/my_weather_reader.git
   cd weather-app
2. Install dependencies:
    ```bash
    flutter pub get
3. Add your OpenWeatherMap API key(you can visit [OpenWeatherMap API](https://openweathermap.org/api) and generate your own api ):
   <br>-Create a .env file in the root directory.
   <br>-Add the following line, replacing YOUR_API_KEY with your actual API key:
   <br>WEATHER_API_KEY = "YOUR_API_KEY"
4. Run the app:
   ~~~bash
   flutter run

## Sample Images of the App (might take few seconds to load.. big file you know )

<div style="display: flex; flex-wrap: wrap; gap: 10px;">
  <img src="https://github.com/user-attachments/assets/9ead101f-78ef-4e0b-9bf8-949751c64827" alt="Weather App - Home Screen" width="300" />
  <img src="https://github.com/user-attachments/assets/cb5d0a87-55d9-453e-93f7-f7304396d74b" alt="Weather App - Search Result" width="300" />
  <img src="https://github.com/user-attachments/assets/96dfdf98-1218-4b37-9b65-cf371f0b889a" alt="Weather App - Error case" width="300" />
  <img src="https://github.com/user-attachments/assets/8c3ad3d1-b302-4a6d-a197-329ef6ae41d3" alt="Weather App - another place" width="300" />
  <img src="https://github.com/user-attachments/assets/47dacd10-a4e4-4261-abf2-c135455bc2c7" alt="Weather App - Using latitude and longitude" width="300" />

</div>

