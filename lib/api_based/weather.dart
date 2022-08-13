class Weather {
  String? location;
  double? temperature;
  String? pressure;
  String? humidity;
  String? windSpeed;
  String? windDirection;
  String? mainWeather;

  Weather({
    this.location,
    this.temperature,
    this.humidity,
    this.windSpeed,
    this.windDirection,
    this.mainWeather,
    this.pressure,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    location = json["name"].toString();
    temperature = json["main"]["temp"]; // in double kelvin
    humidity = json["main"]["humidity"].toString();
    windSpeed = json["wind"]["speed"].toString();
    windDirection = json["wind"]["deg"].toString();
    mainWeather = json["weather"][0]["description"].toString();
    pressure = json["main"]["pressure"].toString();
  }
}
