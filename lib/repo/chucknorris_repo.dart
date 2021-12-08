import 'package:chucknorrisapi2/networking/ApiProvider.dart';
import 'package:chucknorrisapi2/model/chucknorris_response.dart';
import 'dart:async';

class ChuckRepository {
  ApiProvider _provider = ApiProvider();

  Future<chuckResponse> fetchChuckJoke(String category) async {
    final response = await _provider.get("jokes/random?category=" + category);
    return chuckResponse.fromJson(response);
  }
}