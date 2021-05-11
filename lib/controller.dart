import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:paginnation_teste/custom_dio.dart';
import 'package:paginnation_teste/repository.dart';

import 'model.dart';

class Controllers{
  Repository repo = Repository(CustomDio());
    final PagingController<int, Datum> pagingController =
      PagingController(firstPageKey: 0);
  Future<void> fetchPage(int currentPage) async {
    var rest = await repo.getItens(currentPage, 20);
    final isLastPage = rest.totalPages < currentPage;
    if (isLastPage) {
      return pagingController.appendLastPage(rest.data);
    } else {
      final nextPageKey = currentPage + 1;
      pagingController.appendPage(rest.data, nextPageKey);
    }
  }
}