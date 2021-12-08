import 'package:chucknorrisapi2/networking/ApiProvider.dart';
import 'dart:async';
import 'package:chucknorrisapi2/model/chucknorris_category.dart';

class ChuckCategoryRepository {
  ApiProvider _provider = ApiProvider();

  Future<chuckCategories> fetchChuckCategoryData() async {
    final response = await _provider.get("jokes/categories");
    return chuckCategories.fromJson(response);
  }
}