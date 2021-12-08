import 'dart:async';

import 'package:chucknorrisapi2/networking/Repsonse.dart';
import 'package:chucknorrisapi2/repo/chucknorris_category_repo.dart';
import 'package:chucknorrisapi2/model/chucknorris_category.dart';

class ChuckCategoryBloc {
  ChuckCategoryRepository _chuckRepository;
  StreamController _chuckListController;

  StreamSink<Response<chuckCategories>> get chuckListSink =>
      _chuckListController.sink;

  Stream<Response<chuckCategories>> get chuckListStream =>
      _chuckListController.stream;

  ChuckCategoryBloc() {
    _chuckListController = StreamController<Response<chuckCategories>>();
    _chuckRepository = ChuckCategoryRepository();
    fetchCategories();
  }

  fetchCategories() async {
    chuckListSink.add(Response.loading('Espri yükleniyor.'));
    try {
      chuckCategories chuckCats =
      await _chuckRepository.fetchChuckCategoryData();
      chuckListSink.add(Response.completed(chuckCats));
    } catch (e) {
      chuckListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _chuckListController?.close();
  }
}