import 'package:flutter/material.dart';
import 'package:tradeable_learn/models/tradeable_learn_module_model.dart';
import 'package:tradeable_learn/tradeable_learn.dart';
import 'package:tradeable_learn/utils/page_data.dart';

class AxisPageList extends StatefulWidget {
  const AxisPageList({super.key});

  @override
  State<AxisPageList> createState() => _AxisPageListState();
}

class _AxisPageListState extends State<AxisPageList> {
  late List<TradeableLearnModuleModel> selectedModules = [];

  final List<TradeableLearnModuleModel> customLearnModules = [
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
  ];

  @override
  void initState() {
    selectedModules.addAll(PageInfo.defaultPage.learnModules);
    super.initState();
  }

  void _showMultiSelectDropdown() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Select Modules"),
              content: SingleChildScrollView(
                child: Column(
                  children: customLearnModules.map((module) {
                    return CheckboxListTile(
                      title: Text(module.name),
                      value: selectedModules.contains(module),
                      onChanged: (isChecked) {
                        setState(() {
                          if (isChecked == true) {
                            if (!selectedModules.contains(module)) {
                              selectedModules.add(module);
                            }
                          } else {
                            selectedModules.remove(module);
                          }
                        });
                        this.setState(() {});
                      },
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TradeableLearnContainer(
      pageId: PageInfo.defaultPage.id,
      levelData: selectedModules,
      learnBtnTopPos: 80,
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: _showMultiSelectDropdown,
                child: const Text("Select Modules"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
