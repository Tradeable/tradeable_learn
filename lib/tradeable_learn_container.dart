import 'package:flutter/material.dart';
import 'package:tradeable_learn/tradeable_learn_module_list_page.dart';
import 'package:tradeable_learn/tradeable_learn_sheet.dart';
import 'package:tradeable_learn/utils/tradeable_learn_info.dart';

const sidePanelLeftPadding = 40;

class TradeableLearnContainer extends StatefulWidget {
  final Widget child;
  final double learnBtnTopPos;
  final PageId? pageId;
  final List<ModuleLabel>? modules;

  const TradeableLearnContainer(
      {super.key,
      required this.child,
      this.learnBtnTopPos = 80,
      this.pageId,
      this.modules});

  @override
  State<TradeableLearnContainer> createState() =>
      _TradeableLearnContainerState();
}

class _TradeableLearnContainerState extends State<TradeableLearnContainer>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
      children: [
        widget.child,
        Positioned(
          right: 0,
          top: widget.learnBtnTopPos,
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffed1164), Color(0xff97144d)],
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8))),
            child: MaterialButton(
              padding: const EdgeInsets.all(0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  topRight: Radius.zero,
                  bottomRight: Radius.zero,
                ),
              ),
              onPressed: () {
                TradeableLearnSheet.open(
                    context: context,
                    sheetBorderRadius: 12,
                    body: TradeableLearnModuleListPage(
                      pageId: widget.pageId,
                      pages: widget.modules,
                      onClose: () {
                        Navigator.of(context).pop();
                      },
                    ));
              },
              child: Center(
                child: Image.asset(
                  "assets/axis_learn_logo.png",
                  package: 'tradeable_learn/lib',
                  height: 30,
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
