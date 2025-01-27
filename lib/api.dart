import 'package:dio/dio.dart';
import 'package:tradeable_learn/models/level_model.dart';
import 'package:tradeable_learn/models/tradeable_learn_module_model.dart';
import 'package:tradeable_learn/utils/constants.dart';
import 'package:tradeable_learn/utils/tradeable_learn_info.dart';

class Api {
  Future<List<TradeableLearnModuleModel>> getPages(PageId pageId) async {
    Response response = await Dio().get(
      "$baseUrl/v4/learn/pages",
      queryParameters: {"id": pageId.value},
      options: Options(headers: token),
    );
    return (response.data["page_level_link"] as List)
        .map((e) => TradeableLearnModuleModel.fromJson(e))
        .toList();
  }

  Future<Level> fetchLevelById(int levelId) async {
    Response response = await Dio().get(
      "$baseUrl/v4/learn/level/$levelId",
      options: Options(headers: token),
    );
    return Level.fromJson(response.data);
  }
}
