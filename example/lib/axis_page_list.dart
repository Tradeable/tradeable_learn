import 'package:flutter/material.dart';
import 'package:tradeable_learn/models/tradeable_learn_module_model.dart';
import 'package:tradeable_learn/tradeable_learn.dart';
import 'package:tradeable_learn/utils/page_data.dart';
import 'package:tradeable_learn/widgets/option_strategy_widget.dart';

class AxisPageList extends StatefulWidget {
  const AxisPageList({super.key});

  @override
  State<AxisPageList> createState() => _AxisPageListState();
}

class _AxisPageListState extends State<AxisPageList> {
  PageId? selectedPage;
  List<ModuleLabel> moduleLabels = [];
  late List<TradeableLearnModuleModel> selectedModules = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TradeableLearnContainer(
      pageId: selectedPage,
      modules: moduleLabels,
      learnBtnTopPos: 80,
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropdownButton<PageId>(
                    value: selectedPage,
                    items: PageId.values.map((PageId page) {
                      return DropdownMenuItem<PageId>(
                        value: page,
                        child: Text(page.name),
                      );
                    }).toList(),
                    onChanged: (PageId? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedPage = newValue;
                        });
                      }
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          selectedPage = null;
                        });
                      },
                      icon: const Icon(Icons.cancel_rounded))
                ],
              ),
              MultiModuleSelector(
                selectedModules: moduleLabels.toSet(),
                onSelectionChanged: (newSelection) {
                  setState(() {
                    moduleLabels = newSelection.toList(growable: true);
                  });
                },
              ),
              const OptionStrategyWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class MultiModuleSelector extends StatefulWidget {
  final Set<ModuleLabel> selectedModules;
  final Function(Set<ModuleLabel>) onSelectionChanged;

  const MultiModuleSelector({
    super.key,
    required this.selectedModules,
    required this.onSelectionChanged,
  });

  @override
  State<MultiModuleSelector> createState() => _MultiModuleSelectorState();
}

class _MultiModuleSelectorState extends State<MultiModuleSelector> {
  late Set<ModuleLabel> _selectedModules;

  @override
  void initState() {
    super.initState();
    _selectedModules = Set.from(widget.selectedModules);
  }

  void _toggleModule(ModuleLabel module) {
    setState(() {
      if (_selectedModules.contains(module)) {
        _selectedModules.remove(module);
      } else {
        _selectedModules.add(module);
      }
      widget.onSelectionChanged(_selectedModules);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 12.0,
          runSpacing: 12.0,
          children: ModuleLabel.values.map((module) {
            final moduleData = module.value;
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _toggleModule(module),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Color(int.parse('0xFF${moduleData.bgColor}')),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _selectedModules.contains(module)
                          ? Colors.blue
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      // Image.network(
                      //   moduleData.iconUrl,
                      //   width: 32,
                      //   height: 32,
                      //   errorBuilder: (context, error, stackTrace) =>
                      //       const Icon(Icons.book, size: 32),
                      // ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              moduleData.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            // if (moduleData.isRelated)
                            //   Container(
                            //     margin: const EdgeInsets.only(top: 4),
                            //     padding: const EdgeInsets.symmetric(
                            //       horizontal: 8,
                            //       vertical: 2,
                            //     ),
                            //     decoration: BoxDecoration(
                            //       color: Colors.green.withOpacity(0.1),
                            //       borderRadius: BorderRadius.circular(12),
                            //     ),
                            //     child: const Text(
                            //       'Related',
                            //       style: TextStyle(
                            //         color: Colors.green,
                            //         fontSize: 12,
                            //       ),
                            //     ),
                            //   ),
                          ],
                        ),
                      ),
                      Checkbox(
                        value: _selectedModules.contains(module),
                        onChanged: (_) => _toggleModule(module),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
