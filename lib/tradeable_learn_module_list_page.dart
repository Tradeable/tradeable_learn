import 'package:flutter/material.dart';
import 'package:tradeable_learn/models/tradeable_learn_module_model.dart';
import 'package:tradeable_learn/widgets/module_card.dart';

class TradeableLearnModuleListPage extends StatefulWidget {
  final VoidCallback onClose;
  const TradeableLearnModuleListPage({super.key, required this.onClose});

  @override
  State<TradeableLearnModuleListPage> createState() =>
      _TradeableLearnModuleListPageState();
}

class _TradeableLearnModuleListPageState
    extends State<TradeableLearnModuleListPage> {
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
              )),
          const Text("What do you want to learn about today?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              )),
          const SizedBox(
            height: 24,
          ),
          ModuleCard(
              moduleModel: TradeableLearnModuleModel(
                  id: "1",
                  name: "Market Depth",
                  description: "Order book for buy/sell prices.",
                  note: "Completed 2 weeks ago",
                  bgColor: "#FFFFF888")),
        ],
      ),
    ));
  }
}
