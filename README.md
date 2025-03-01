# WeatherWise 🌦️  

**WeatherWise** is a feature-packed weather application that fetches real-time weather and forecast details using the [OpenWeatherMap API](https://openweathermap.org/api). It provides smooth UI interactions, location suggestions, and animations to enhance the user experience.  

---

## 📸 Sample Screenshots  
_(Might take a few seconds to load...)_  

<div style="display: flex; flex-wrap: wrap; gap: 10px;">
  <img src="https://github.com/user-attachments/assets/9ead101f-78ef-4e0b-9bf8-949751c64827" alt="Weather App - Home Screen" height="300" />
  <img src="https://github.com/user-attachments/assets/cb5d0a87-55d9-453e-93f7-f7304396d74b" alt="Weather App - Search Result" height="300" />
  <img src="https://github.com/user-attachments/assets/96dfdf98-1218-4b37-9b65-cf371f0b889a" alt="Weather App - Error case" height="300" />
  <img src="https://github.com/user-attachments/assets/8c3ad3d1-b302-4a6d-a197-329ef6ae41d3" alt="Weather App - Another place" height="300" />
  <img src="https://github.com/user-attachments/assets/47dacd10-a4e4-4261-abf2-c135455bc2c7" alt="Weather App - Using latitude and longitude" height="300" />
</div>  

---

## ✨ Features  
- **🌍 Search by Location** – Get weather details for any city.  
- **📍 Location Suggestions** – Uses [LocationIQ API](https://locationiq.com/) for autocomplete search results.  
- **📁 Fetch Current Location** – Uses `geolocator` to detect the user's location and show real-time weather.  
- **📊 Weather Forecast & Details** – Displays temperature, humidity, wind speed, and more.  
- **🔄 Search History** – Saves searched locations in an SQLite database for quick access.  
- **⚡ Last Known Location** – If the app fails to get the user’s current location, it fetches the last searched one from the database.  
- **🛠️ Delete Search History** – Users can remove stored searches (either by name or coordinates).  
- **🎨 Dynamic Animations & GIFs** – Displays weather-specific animations (even though it makes the app *huge* at **142MB**, but who cares? 😭💀).  

---

## 🛠 Tech Stack & Packages  
- **Framework:** Flutter (Dart)  
- **State Management:** Riverpod  
- **API Calls:** Dio  
- **Location Services:** Geolocator, LocationIQ API  
- **Database:** SQLite (for storing search history)  
- **Preferences:** Shared Preferences  
- **UI & Responsiveness:** ScreenUtil  

---

## 🚀 Setup Instructions  

1️⃣ **Clone the repository:**  
```bash
git clone https://github.com/1Shibam/my_weather_reader.git  
cd weather-app  
```  

2️⃣ **Install dependencies:**  
```bash
flutter pub get  
```  

3️⃣ **Set up API keys:**  
- Create a `.env` file in the root directory.  
- Add the following:  
```env
WEATHER_API_KEY="YOUR_OPENWEATHERMAP_API_KEY"  
LOCATIONIQ_API_KEY="YOUR_LOCATIONIQ_API_KEY"  
```  

4️⃣ **Run the app:**  
```bash
flutter run  
```  

---

## 📝 License  

This project is licensed under the **MIT License**. Feel free to use, modify, and distribute it. 

---





