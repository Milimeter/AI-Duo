import 'dart:developer';

import 'package:ai_duo/services/storage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';





String baseUrl = 'https://fierce-spire-23282.herokuapp.com/';

class ApiService {
  static Future<Map> postData(Map data, url) async {
    try {
      Uri link = Uri.parse('$baseUrl$url');
      log(link.toString());

      var bodyEncoded = json.encode(data);
      http.Response response = await http.post(
        link,
        body: bodyEncoded,
        headers: {
          "Content-Type": "application/json",
        },
      );
      Map jsonData = json.decode(response.body);

      // if (response.statusCode.toString().contains('2')) {
      //   return jsonData;
      // } else {
      //   return {
      //     'error': jsonData["errors"][0]['message'],
      //   };
      // }

      return jsonData;
    } catch (e) {
      log("--------api error-------");
      log(e.toString());
      return {};
    }
  }

  static Future<Map> getData(String url) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    try {
      var link = Uri.parse('$baseUrl$url');
      log(link.toString());
      http.Response response = await http.get(link, headers: requestHeaders);
      Map jsonData = json.decode(response.body);
      return jsonData;
    } catch (e) {
      log(e.toString());
      return {};
    }
  }

  static Future<Map> postDataWithToken(Map data, url) async {
    try {
      var token = await Storage.readData("token");
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      };
      log(token);
      var link = Uri.parse('$baseUrl$url');
      log(link.toString());
      http.Response response = await http.post(link,
          body: jsonEncode(data), headers: requestHeaders);
      Map jsonData = json.decode(response.body);

      return jsonData;
    } catch (e) {
      log(e.toString());
      return {};
    }
  }

  static Future<Map> getDataWithToken(url) async {
    try {
      var token = await Storage.readData("token");
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      };
      log(token);

      var link = Uri.parse('$baseUrl$url');
      log(link.toString());
      http.Response response = await http.get(link, headers: requestHeaders);
      Map jsonData = json.decode(response.body);

      return jsonData;
    } catch (e) {
      log(e.toString());
      return {};
    }
  }

  static Future<Map> deleteDataWithToken(url) async {
    try {
      var token = await Storage.readData("token");
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Authorization': "Bearer $token"
      };
      log(token);
      var link = Uri.parse('$baseUrl$url');
      http.Response response = await http.delete(link, headers: requestHeaders);
      Map jsonData = json.decode(response.body);

      return jsonData;
    } catch (e) {
      log(e.toString());
      return {};
    }
  }

  static Future<int> postFileDataWithToken(
      List<String> filePaths, String url) async {
    try {
      var token = await Storage.readData("token");

      log(token);
      var uri = Uri.parse('$baseUrl$url');
      var request = http.MultipartRequest("POST", uri);
      Map<String, String> headers = {'x-auth-token': token};
      request.headers.addAll(headers);
      for (var file in filePaths.toList()) {
        http.MultipartFile multipartFileSign =
            await http.MultipartFile.fromPath(
          "photos",
          file,
        );
        request.files.add(multipartFileSign);
      }
      http.StreamedResponse response = await request.send();
      log("--------------response code ---------------${response.statusCode}=====================");

      return response.statusCode;
    } catch (e) {
      log(e.toString());
      return 500;
    }
  }
}
