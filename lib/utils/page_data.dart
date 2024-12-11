import 'package:tradeable_learn/models/tradeable_learn_module_model.dart';

enum PageInfo {
  defaultPage(id: 1, name: "Default Page", learnModules: []);

  final int id;
  final String name;
  final List<TradeableLearnModuleModel> learnModules;

  const PageInfo(
      {required this.id, required this.name, this.learnModules = const []});
}

List<TradeableLearnModuleModel> learnLevels = [
  TradeableLearnModuleModel(
    id: '291',
    name: 'Moneyness',
    description: '',
    bgColor: 'EFF9EB',
    iconUrl:
        'https://tradeable-cms.s3.ap-south-1.amazonaws.com/lms_axis/level_icons/default.png',
    isRelated: true,
  ),
  TradeableLearnModuleModel(
    id: '290',
    name: 'Options',
    description: '',
    bgColor: 'EBF0F9',
    iconUrl:
        'https://tradeable-cms.s3.ap-south-1.amazonaws.com/lms_axis/level_icons/default.png',
    isRelated: false,
  ),
  TradeableLearnModuleModel(
    id: '289',
    name: 'Support & Resistance',
    description: '',
    bgColor: 'F9F1EB',
    iconUrl:
        'https://tradeable-cms.s3.ap-south-1.amazonaws.com/lms_axis/level_icons/volume.png',
    isRelated: true,
  ),
  TradeableLearnModuleModel(
    id: '288',
    name: 'Intro to TA',
    description: '',
    bgColor: 'F9EBEF',
    iconUrl:
        'https://tradeable-cms.s3.ap-south-1.amazonaws.com/lms_axis/level_icons/market_depth.png',
    isRelated: true,
  ),
  TradeableLearnModuleModel(
    id: '293',
    name: 'Circuits',
    description: '',
    bgColor: 'EBF0F9',
    iconUrl:
        'https://tradeable-cms.s3.ap-south-1.amazonaws.com/lms_axis/level_icons/circuits.png',
    isRelated: false,
  ),
  TradeableLearnModuleModel(
    id: '292',
    name: 'Candlestick Patterns',
    description: '',
    bgColor: 'F9EBEF',
    iconUrl:
        'https://tradeable-cms.s3.ap-south-1.amazonaws.com/lms_axis/level_icons/candle_basics.png',
    isRelated: false,
  ),
];
