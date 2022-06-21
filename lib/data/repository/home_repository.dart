


import 'package:mvvm_with_asif/constants/app_urls.dart';
import 'package:mvvm_with_asif/data/model/movie_model.dart';
import 'package:mvvm_with_asif/data/network/base_api_service.dart';
import 'package:mvvm_with_asif/data/network/network_api_service.dart';

class HomeRepository{

  BaseApiService _apiService = NetworkApiService();

  Future<MovieListModel> fetchMovieList() async {
    try {
      dynamic response = await _apiService.getGetApiResponse(AppUrls.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


}