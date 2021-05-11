import 'package:paginnation_teste/custom_dio.dart';
import 'package:paginnation_teste/model.dart';

class Repository {
  final CustomDio customDio;

  Repository(this.customDio);
  Future<DataModel> getItens(int page, int size) async {
    var dio = customDio.dio;
    try {
      var response = await dio.get(
        '/passenger',
        queryParameters: {
          'page': '$page',
          'size': '$size',
        },
      );
      return DataModel.fromJson(response.data);
    } catch (e) {
      return e;
    }
  }
}
