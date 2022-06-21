// ignore_for_file: prefer_final_fields

import 'package:mvvm_with_asif/constants/app_urls.dart';
import 'package:mvvm_with_asif/data/network/base_api_service.dart';
import 'package:mvvm_with_asif/data/network/network_api_service.dart';

class AuthRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiService.getPostApiResponse(AppUrls.logInUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response = await _apiService.getPostApiResponse(AppUrls.registerUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
