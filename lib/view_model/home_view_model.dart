import 'package:flutter/cupertino.dart';
import 'package:mvvm_with_asif/data/model/movie_model.dart';
import 'package:mvvm_with_asif/data/repository/home_repository.dart';
import 'package:mvvm_with_asif/data/response/api_response.dart';

class HomeViewModel extends ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMovieList(ApiResponse<MovieListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMovieList() async {

    setMovieList(ApiResponse.loading());

    _myRepo.fetchMovieList().then((value) {
      setMovieList(ApiResponse.completed(value));

    }).onError((error, stackTrace)
    {
      setMovieList(ApiResponse.error(error.toString()));
    });
  }
}
