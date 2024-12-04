import 'package:flutter/material.dart';
import 'package:tradeable_learn/models/tradeable_learn_module_model.dart';
import 'package:tradeable_learn/utils/color_utils.dart';

class ModuleCard extends StatelessWidget {
  final TradeableLearnModuleModel moduleModel;
  const ModuleCard({super.key, required this.moduleModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: getColorFromHex(moduleModel.bgColor ?? "FF81C1BD"),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(moduleModel.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      )),
                  Text(moduleModel.description,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                  Text(moduleModel.note ?? "",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              )),
          Flexible(
            flex: 3,
            child: moduleModel.iconUrl != null
                ? Image.network(
                    moduleModel.iconUrl!,
                    fit: BoxFit.cover,
                    width: 64,
                    height: 64,
                  )
                : Image.asset(
                    "assets/default_module_icon.png",
                    package: 'tradeable_learn/lib',
                    height: 64,
                    width: 64,
                  ),
          ),
        ],
      ),
    );
  }
}
