import 'dart:convert';

class TempModel {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  int? elevation;
  CurrentWeather? currentWeather;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  TempModel({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentWeather,
    this.hourlyUnits,
    this.hourly,
  });

  factory TempModel.fromRawJson(String str) =>
      TempModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TempModel.fromJson(Map<String, dynamic> json) => TempModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        currentWeather: json["current_weather"] == null
            ? null
            : CurrentWeather.fromJson(json["current_weather"]),
        hourlyUnits: json["hourly_units"] == null
            ? null
            : HourlyUnits.fromJson(json["hourly_units"]),
        hourly: json["hourly"] == null ? null : Hourly.fromJson(json["hourly"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_weather": currentWeather?.toJson(),
        "hourly_units": hourlyUnits?.toJson(),
        "hourly": hourly?.toJson(),
      };
}

class CurrentWeather {
  double? temperature;
  double? windspeed;
  int? winddirection;
  int? weathercode;
  int? isDay;
  String? time;

  CurrentWeather({
    this.temperature,
    this.windspeed,
    this.winddirection,
    this.weathercode,
    this.isDay,
    this.time,
  });

  factory CurrentWeather.fromRawJson(String str) =>
      CurrentWeather.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        temperature: json["temperature"]?.toDouble(),
        windspeed: json["windspeed"]?.toDouble(),
        winddirection: json["winddirection"],
        weathercode: json["weathercode"],
        isDay: json["is_day"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "windspeed": windspeed,
        "winddirection": winddirection,
        "weathercode": weathercode,
        "is_day": isDay,
        "time": time,
      };
}

class Hourly {
  List<String>? time;
  List<double>? temperature2M;
  List<int>? relativehumidity2M;
  List<double>? windspeed10M;

  Hourly({
    this.time,
    this.temperature2M,
    this.relativehumidity2M,
    this.windspeed10M,
  });

  factory Hourly.fromRawJson(String str) => Hourly.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: json["time"] == null
            ? []
            : List<String>.from(json["time"]!.map((x) => x)),
        temperature2M: json["temperature_2m"] == null
            ? []
            : List<double>.from(
                json["temperature_2m"]!.map((x) => x?.toDouble())),
        relativehumidity2M: json["relativehumidity_2m"] == null
            ? []
            : List<int>.from(json["relativehumidity_2m"]!.map((x) => x)),
        windspeed10M: json["windspeed_10m"] == null
            ? []
            : List<double>.from(
                json["windspeed_10m"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "time": time == null ? [] : List<dynamic>.from(time!.map((x) => x)),
        "temperature_2m": temperature2M == null
            ? []
            : List<dynamic>.from(temperature2M!.map((x) => x)),
        "relativehumidity_2m": relativehumidity2M == null
            ? []
            : List<dynamic>.from(relativehumidity2M!.map((x) => x)),
        "windspeed_10m": windspeed10M == null
            ? []
            : List<dynamic>.from(windspeed10M!.map((x) => x)),
      };
}

class HourlyUnits {
  String? time;
  String? temperature2M;
  String? relativehumidity2M;
  String? windspeed10M;

  HourlyUnits({
    this.time,
    this.temperature2M,
    this.relativehumidity2M,
    this.windspeed10M,
  });

  factory HourlyUnits.fromRawJson(String str) =>
      HourlyUnits.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
        time: json["time"],
        temperature2M: json["temperature_2m"],
        relativehumidity2M: json["relativehumidity_2m"],
        windspeed10M: json["windspeed_10m"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "temperature_2m": temperature2M,
        "relativehumidity_2m": relativehumidity2M,
        "windspeed_10m": windspeed10M,
      };
}
