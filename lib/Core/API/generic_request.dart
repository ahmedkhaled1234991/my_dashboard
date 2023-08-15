
import '../API/request_method.dart';

class GenericRequest<T>{
  T Function(Map<String, dynamic> json) fromMap;
  RequestApi method;

  GenericRequest({required this.fromMap,required this.method});

  Future<T> getObject() async {
    Map<String,dynamic> response = await method.request();
    return fromMap(response["data"]);
  }

  Future<List<T>> getList() async {
    Map<String,dynamic> response = await method.request();
    return List<T>.from(response["data"].map((e)=> fromMap(e)));
  }

  Future<T> getResponse() async {
    Map<String,dynamic> response = await method.request();
    return fromMap(response);
  }
}
