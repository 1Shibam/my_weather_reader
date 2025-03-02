# WeatherWise 🌦️  

**WeatherWise** is a feature-packed weather application that fetches real-time weather and forecast details using the [OpenWeatherMap API](https://openweathermap.org/api). It provides smooth UI interactions, location suggestions, and animations to enhance the user experience.  

---

## 📸 Sample Screenshots  
_(Might take a few seconds to load GIFS...)_  

<div style="display: flex; flex-wrap: wrap; gap: 10px;">
  <img src="https://github.com/user-attachments/assets/8993da44-ce48-4a88-8dc6-88c852e7380b" alt="Weather App - Home Screen" height="300" />
  <img src="https://github.com/user-attachments/assets/d30632d3-446d-4d54-8889-c7a209b9f9f4" alt="Weather App - Search Result" height="300" />
  <img src="https://github.com/user-attachments/assets/472a17c5-0136-4120-9a65-08329601decf" alt="Weather App - Error case" height="300" />
  <img src="https://github.com/user-attachments/assets/e91a7bb6-171f-426f-a248-192a5d33a08c" alt="Weather App - Another place" height="300" />
  <img src="https://github.com/user-attachments/assets/97935ded-74c6-449b-ab7c-5121e7fdc8d7" alt="Weather App - Using latitude and longitude" height="300" />
  <img src="https://github.com/user-attachments/assets/daab129e-03a2-4728-bb60-c938c5cb38f9" alt="Weather App - Using latitude and longitude" height="300" />
  <img src="https://github.com/user-attachments/assets/f3ac88a1-fbe5-4a4a-8523-7b400455d976" alt="Weather App - Using latitude and longitude" height="300" />
  <img src="https://github.com/user-attachments/assets/15e99b24-3741-402c-bff1-b26f1a557376" alt="Weather App - Using latitude and longitude" height="300" />

</div>  

---

## ✨ Features  
- **🌍 Search by Location** – Get weather details for any city.  
- **📍 Location Suggestions** – Uses [LocationIQ API](https://locationiq.com/) for autocomplete search results.  
- **📁 Fetch Current Location** – Uses `geolocator` to detect the user's location and show real-time weather.  
- **📊 Weather Forecast & Details** – Displays temperature, humidity, wind speed, and more.  
- **🔄 Search History** – Saves searched locations in an SQLite database for quick access.  
- **⚡ Last Known Location** – If the app fails to get the user’s current location, it fetches the last searched one from the database.  
- **🛠️ Delete Search History** – Users can remove stored searches. 
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
git clone https://github.com/1Shibam/WeatherWise.git  
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





