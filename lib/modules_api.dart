import 'package:dio/dio.dart';
import 'package:example/utils/constants.dart';

class ModulesApi {
  Future<List<TradeableLearnModuleModel>> fetchModulesData(int pageId) async {
    Response response = await Dio().get(
      "$baseUrl/learn/pages",
      queryParameters: {"id": pageId},
      options: Options(headers: token),
    );

    return response.data["modules"].map((e) => TradeableLearnModuleModel.fromJson(e)).toList();
  }

}
