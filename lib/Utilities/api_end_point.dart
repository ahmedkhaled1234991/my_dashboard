
class APIEndPoint{
  static const String baseServerURL = "https://jsonplaceholder.typicode.com";
  static const String _baseURL = "$baseServerURL/";



  //=========================== api User ====================================
  static const String test = "${_baseURL}todos";
  static const String login = "${_baseURL}login";
  static const String register = "${_baseURL}register";
  static String currentTemp(lat,long) => "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m";
}



