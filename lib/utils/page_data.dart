import 'package:tradeable_learn/models/tradeable_learn_module_model.dart';

enum PageId {
  allModule, //default
  overview,
  optionChain,
  technicals,
  events,
  other,
}

extension PageIdValue on PageId {
  int get value {
    switch (this) {
      case PageId.allModule:
        return 1;
      case PageId.overview:
        return 8;
      case PageId.optionChain:
        return 9;
      case PageId.technicals:
        return 10;
      case PageId.events:
        return 11;
      case PageId.other:
        return 12;
    }
  }
}

enum ModuleLabel {
  moneyness,
  options,
  supportAndResistance,
  introToTA,
  circuits,
  candlestickPatterns
}

extension ModuleLabelValue on ModuleLabel {
  TradeableLearnModuleModel get value {
    switch (this) {
      case ModuleLabel.moneyness:
        return TradeableLearnModuleModel(
          id: '291',
          name: 'Moneyness',
          description: '',
          bgColor: 'EFF9EB',
          iconUrl:
              'https://tradeable-cms.s3.ap-south-1.amazonaws.com/lms_axis/level_icons/default.png',
          isRelated: true,
        );
      case ModuleLabel.options:
        return TradeableLearnModuleModel(
          id: '290',
          name: 'Options',
          description: '',
          bgColor: 'EBF0F9',
          iconUrl:
              'https://tradeable-cms.s3.ap-south-1.amazonaws.com/lms_axis/level_icons/default.png',
          isRelated: false,
        );
      case ModuleLabel.supportAndResistance:
        return TradeableLearnModuleModel(
          id: '289',
          name: 'Support & Resistance',
          description: '',
          bgColor: 'F9F1EB',
          iconUrl:
              'https://tradeable-cms.s3.ap-south-1.amazonaws.com/lms_axis/level_icons/volume.png',
          isRelated: true,
        );
      case ModuleLabel.introToTA:
        return TradeableLearnModuleModel(
          id: '288',
          name: 'Intro to TA',
          description: '',
          bgColor: 'F9EBEF',
          iconUrl:
              'https://tradeable-cms.s3.ap-south-1.amazonaws.com/lms_axis/level_icons/market_depth.png',
          isRelated: true,
        );
      case ModuleLabel.circuits:
        return TradeableLearnModuleModel(
          id: '293',
          name: 'Circuits',
          description: '',
          bgColor: 'EBF0F9',
          iconUrl:
              'https://tradeable-cms.s3.ap-south-1.amazonaws.com/lms_axis/level_icons/circuits.png',
          isRelated: false,
        );
      case ModuleLabel.candlestickPatterns:
        return TradeableLearnModuleModel(
          id: '292',
          name: 'Candlestick Patterns',
          description: '',
          bgColor: 'F9EBEF',
          iconUrl:
              'https://tradeable-cms.s3.ap-south-1.amazonaws.com/lms_axis/level_icons/candle_basics.png',
          isRelated: false,
        );
    }
  }
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
