// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:mvvm_with_asif/data/app_exceptions.dart';
import 'package:mvvm_with_asif/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse( url, data) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 10));
      print('This is Api response ${response.statusCode}');


      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorisedException(response.body.toString());
      default:
        throw FetchDataException('Something went wrong ${response.statusCode.toString()}');
    }
  }
}
