import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tradeable_learn/api.dart';
import 'package:tradeable_learn/level_screen.dart';
import 'package:tradeable_learn/models/tradeable_learn_module_model.dart';
import 'package:tradeable_learn/utils/page_data.dart';
import 'package:tradeable_learn/widgets/module_card.dart';
import 'package:tradeable_learn/widgets/module_card_shimmer.dart';

class TradeableLearnModuleListPage extends StatefulWidget {
  final VoidCallback onClose;
  final PageId? pageId;
  final List<ModuleLabel>? pages;

  const TradeableLearnModuleListPage(
      {super.key,
      required this.onClose,
      required this.pageId,
      required this.pages});

  @override
  State<TradeableLearnModuleListPage> createState() =>
      _TradeableLearnModuleListPageState();
}

class _TradeableLearnModuleListPageState
    extends State<TradeableLearnModuleListPage> {
  bool _showShimmer = true;
  List<TradeableLearnModuleModel> modules = [];
  List<TradeableLearnModuleModel> relatedModules = [];

  @override
  void initState() {
    super.initState();
    getRecommendations(widget.pageId);
    if ((widget.pages?.isNotEmpty ?? false)) {
      modules.addAll((widget.pages!).map((m) => m.value).toList());
      _showShimmer = false;
    }
  }

  Future<void> getRecommendations(PageId? pageId) async {
    if (pageId == null) {
      return;
    } else {
      Api().getPages(pageId).then((val) {
        setState(() {
          modules
              .addAll(val.where((module) => module.isRelated == true).toList());
          relatedModules =
              val.where((module) => module.isRelated == false).toList();
          _showShimmer = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: widget.onClose,
                child: const Icon(Icons.close_rounded),
              ),
            ),
            const Text(
              "What do you want to learn about today?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _showShimmer
                  ? ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 16.0),
                          child: ModuleCardShimmer(),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: modules.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: ModuleCard(
                            moduleModel: modules[index],
                            onClick: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LevelScreen(
                                      levelId: int.parse(modules[index].id))));
                            },
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 24),
            if (relatedModules.isNotEmpty)
              const Text(
                "Other related topics",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            const SizedBox(height: 8),
            if (relatedModules.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: relatedModules.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LevelScreen(
                                levelId: int.parse(relatedModules[index].id))));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Text(relatedModules[index].name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                            const SizedBox(width: 4),
                            const Icon(Icons.arrow_forward_ios, size: 14)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF9F9F9),
                    border: Border.all(color: const Color(0xffE2E2E2))),
                child: const Center(
                  child: Text("Go to Learn Dashboard",
                      style: TextStyle(
                          color: Color(0xff97144D),
                          fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
