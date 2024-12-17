import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tradeable_learn/models/level_model.dart';
import 'package:tradeable_learn_widget/tradeable_learn_widget.dart';

class LevelScreen extends StatefulWidget {
  final int levelId;

  const LevelScreen({super.key, required this.levelId});

  @override
  State<StatefulWidget> createState() => _MyLevelWidget();
}

class _MyLevelWidget extends State<LevelScreen> {
  late Level level;
  bool isLoading = true;
  Node? currentNode;

  @override
  void initState() {
    super.initState();
    fetchLevelById(widget.levelId).then((val) {
      setState(() {
        isLoading = false;
        level = val;
      });
      findStartNode();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void findStartNode() {
    Node? startNode =
        level.graph!.firstWhere((node) => node.type == Type.start);
    setState(() {
      currentNode = startNode;
    });
  }

  Future<Level> fetchLevelById(int levelId) async {
    Response response = await Dio().get(
      "https://dev.api.tradeable.app/v4/learn/level/$levelId",
      options: Options(
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiWTNwMFFkWHFQYmVPR2J3MnZuNEJiOEpIOEV2MiIsImlhdCI6MTcxNDk4NTUwOCwiZXhwIjoxNzQ2NTIxNTA4fQ.81vqPGeEItEeL62HXmmBPsN532TMDlhHdKDB6mb7KQI"
        },
      ),
    );
    return Level.fromJson(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : getViewByType(currentNode?.model ?? "End",
                currentNode?.data as Map<String, dynamic>?),
      ),
    );
  }

  Widget getViewByType(String levelType, Map<String, dynamic>? data) {
    switch (levelType) {
      case "End":
        return const Center(child: Text("Completed"));
      case "Edu_Corner":
        // case "EduCornerV1":
        return EduCornerV1(
            model: EduCornerModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "CA1.1":
        return CandleBodySelect(
            model: CandlePartSelectModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "ladder_question":
        return LadderWidgetMain(
            ladderModel: LadderModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "call_put_atm":
        return ATMWidget(
            model: ATMWidgetModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "expandableEduTileModelData":
        return ExpandableEduTileMain(
            model: ExpandableEduTileModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "CA1.2":
        return CandlePartMatchLink(
            model: CandleMatchThePairModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "EN1":
        return EN1(
            model: EN1Model.fromJson(data), onNextClick: () => onNextClick());
      case "MultipleCandleSelect_STATIC":
      case "MultipleCandleSelect_DYNAMIC":
        return CandleSelectQuestion(
            model: CandleSelectModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "MCQ_STATIC":
      case "MCQ_DYNAMIC":
        return MCQQuestion(
            model: MCQModel.fromJson(data), onNextClick: () => onNextClick());
      case "HorizontalLine_STATIC":
      case "HorizontalLine_DYNAMIC":
      case "MultipleHorizontalLine_STATIC":
      case "MultipleHorizontalLine_DYNAMIC":
        return HorizontalLineQuestion(
            model: HorizontalLineModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "MCQ_CANDLE":
        return MCQCandleQuestion(
            model: MCQCandleModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "video_educorner":
        return VideoEduCorner(
            model: VideoEduCornerModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "drag_and_drop_match":
      case "fno_scenario_1":
        return DragAndDropMatch(
            model: LadderModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "Bucket_containerv1":
      case "drag_drop_logo":
        return BucketContainerV1(
            model: BucketContainerModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "content_preview":
        return MarkdownPreviewWidget(
            model: MarkdownPreviewModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "Calender_Question":
        return CalenderQuestion(
            model: CalenderQuestionModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "formula_placeholder":
        return FormulaPlaceholderWidget(
            model: FormulaPlaceHolderModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "candle_formationv2":
        return CandleFormationV2Main(
            model: CandleFormationV2Model.fromJson(data),
            onNextClick: () => onNextClick());
      case "multiple_select_mcq":
        return MultipleMCQSelect(
            model: MultipleMCQModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "trend_line":
        return TrendLineWidget(
            model: TrendLineModel.fromJson(data),
            onNextClick: () => onNextClick());
      default:
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Text("Unsupported Type: $levelType"),
        );
    }
  }

  void onNextClick() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 1)).then((v) {
      var endNodeId = currentNode!.edges?[0].endNodeId;

      for (Node node in level.graph ?? []) {
        if (node.nodeId == endNodeId) {
          setState(() {
            currentNode = node;
            isLoading = false;
          });
          break;
        }
      }
    });
  }
}
