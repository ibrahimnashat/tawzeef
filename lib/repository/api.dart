import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tawzeef/shared/consts/exports.dart';

typedef RetrieveFromJson<T> = T Function(Map<String, dynamic> json);
typedef RetrieveToJson<G> = Map<String, dynamic> Function(G json);

class Api<T, G> {
  Future<void> post({
    required String endpoint,
    required G request,
    required RetrieveToJson<G> toJson,
    required RetrieveFromJson<T> fromJson,
    required Function(int status, String message) onError,
    required Function(T response, String message) onSeccuss,
    Map<String, String> headers = const {},
  }) async {
    localStorage.printForRequest(urls.base + endpoint);
    localStorage.printForRequest(toJson(request));
    final value = await http.post(
      Uri.parse(urls.base + endpoint),
      body: toJson(request),
      headers: headers,
    );
    final data = jsonDecode(value.body);
    localStorage.print(data);
    String message = '';
    if (data["message"] != null) message = data["message"];
    if (data["status"] == 200 || data["status"] == 204) {
      return onSeccuss(fromJson(data), message);
    } else {
      return onError(data["status"], message);
    }
  }

  Future<void> postWithFiles({
    required String endpoint,
    required G request,
    required RetrieveToJson<G> toJson,
    required RetrieveFromJson<T> fromJson,
    required Function(int status, String message) onError,
    required Function(T response, String message) onSuccess,
  }) async {
    final api = http.MultipartRequest(
      'POST',
      Uri.parse(urls.base + endpoint),
    );
    for (final e in toJson(request).entries) {
      if (e.value is File) {
        api.files.add(
          await MultipartFile.fromPath(
            e.key,
            e.value.path,
          ),
        );
      } else {
        api.fields[e.key] = e.value;
      }
    }
    localStorage.printForRequest(api.fields);
    localStorage.printForRequest(api.files);
    api.headers[HttpHeaders.acceptHeader] = 'application/json';
    final res = await api.send();
    var value = await http.Response.fromStream(res);
    final data = jsonDecode(value.body);
    String message = '';
    log(data.toString());
    if (data["message"] != null) message = data["message"];
    if (data["status"] == 200 || data["status"] == 204) {
      return onSuccess(fromJson(data), message);
    } else {
      return onError(data["status"], message);
    }
  }

  Future<void> gett({
    required String endpoint,
    required RetrieveFromJson<T> fromJson,
    required Function(int status, String message) onError,
    required Function(T response) onSeccuss,
    Map<String, String> headers = const {},
  }) async {
    final value = await http.get(
      Uri.parse(urls.base + endpoint),
      headers: headers,
    );
    final data = jsonDecode(value.body);
    if (data["status"] == 200 || data["status"] == 204) {
      return onSeccuss(fromJson(data));
    } else {
      return onError(data["status"], data["message"]);
    }
  }

  Future<void> put({
    required String endpoint,
    required G request,
    required RetrieveToJson<G> toJson,
    required RetrieveFromJson<T> fromJson,
    required Function(int status, String message) onError,
    required Function(T response) onSeccuss,
    Map<String, String> headers = const {},
  }) async {
    final value = await http.put(
      Uri.parse(urls.base + endpoint),
      headers: headers,
      body: toJson(request),
    );
    final data = jsonDecode(value.body);
    if (data["status"] == 200 || data["status"] == 204) {
      return onSeccuss(fromJson(data));
    } else {
      return onError(data["status"], data["message"]);
    }
  }

  Future<void> delete({
    required String endpoint,
    required RetrieveFromJson<T> fromJson,
    required Function(int status, String message) onError,
    required Function(T response) onSeccuss,
    Map<String, String> headers = const {},
  }) async {
    final value = await http.delete(
      Uri.parse(urls.base + endpoint),
      headers: headers,
    );
    final data = jsonDecode(value.body);
    if (data["status"] == 200 || data["status"] == 204) {
      return onSeccuss(fromJson(data));
    } else {
      return onError(data["status"], data["message"]);
    }
  }
}
