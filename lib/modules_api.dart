import 'package:dio/dio.dart';
import 'package:tradeable_learn/models/tradeable_learn_module_model.dart';
import 'package:tradeable_learn/utils/constants.dart';

class ModulesApi {
  Future<List<TradeableLearnModuleModel>> fetchModulesData(int pageId) async {
    Response response = await Dio().get(
      "$baseUrl/learn/pages",
      queryParameters: {"id": pageId},
      options: Options(headers: token),
    );

    return response.data["modules"]
        .map((e) => TradeableLearnModuleModel.fromJson(e))
        .toList();
  }
}
