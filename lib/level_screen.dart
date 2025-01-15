import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tradeable_learn/api.dart';
import 'package:tradeable_learn/models/level_model.dart';
import 'package:tradeable_learn_widget/atm_itm_dropdown_widget/atm_itm_dropdown_data_model.dart';
import 'package:tradeable_learn_widget/atm_itm_dropdown_widget/atm_itm_dropdown_widget_main.dart';
import 'package:tradeable_learn_widget/bucket_widgetv1/bucket_container.dart';
import 'package:tradeable_learn_widget/bucket_widgetv1/models/bucket_model.dart';
import 'package:tradeable_learn_widget/calender_widget/calender_model.dart';
import 'package:tradeable_learn_widget/calender_widget/calender_question.dart';
import 'package:tradeable_learn_widget/candle_body_select/candle_body_select.dart';
import 'package:tradeable_learn_widget/candle_body_select/candle_body_select_model.dart';
import 'package:tradeable_learn_widget/candle_formation_v2/candle_formation_v2_main.dart';
import 'package:tradeable_learn_widget/candle_formation_v2/candle_formation_v2_model.dart';
import 'package:tradeable_learn_widget/candle_match_the_pair/candle_part_match.dart';
import 'package:tradeable_learn_widget/candle_match_the_pair/match_the_pair_model.dart';
import 'package:tradeable_learn_widget/candle_select_question/candle_select_model.dart';
import 'package:tradeable_learn_widget/candle_select_question/candle_select_question.dart';
import 'package:tradeable_learn_widget/drag_and_drop_match_widget/drag_and_drop_match.dart';
import 'package:tradeable_learn_widget/edu_cornerv1/edu_corner_model.dart';
import 'package:tradeable_learn_widget/edu_cornerv1/edu_corner_v1.dart';
import 'package:tradeable_learn_widget/en1_matchthepair/en1_model.dart';
import 'package:tradeable_learn_widget/en1_matchthepair/en1_widget.dart';
import 'package:tradeable_learn_widget/expandable_edutile_widget/expandable_edutile_main.dart';
import 'package:tradeable_learn_widget/expandable_edutile_widget/expandable_edutile_model.dart';
import 'package:tradeable_learn_widget/formula_placeholder_widget/formula_placeholder_model.dart';
import 'package:tradeable_learn_widget/formula_placeholder_widget/formula_placeholder_widget.dart';
import 'package:tradeable_learn_widget/horizontal_line_question/horizontal_line_model.dart';
import 'package:tradeable_learn_widget/horizontal_line_question/horizontal_line_question.dart';
import 'package:tradeable_learn_widget/ladder_widget/ladder_data_model.dart';
import 'package:tradeable_learn_widget/ladder_widget/ladder_widget_main.dart';
import 'package:tradeable_learn_widget/markdown_preview_widget/markdown_preview_model.dart';
import 'package:tradeable_learn_widget/markdown_preview_widget/markdown_preview_widget.dart';
import 'package:tradeable_learn_widget/mcq_candle_question/mcq_candle_model.dart';
import 'package:tradeable_learn_widget/mcq_candle_question/mcq_candle_question.dart';
import 'package:tradeable_learn_widget/mcq_question/mcq_model.dart';
import 'package:tradeable_learn_widget/mcq_question/mcq_question.dart';
import 'package:tradeable_learn_widget/multiple_mcq_select/multiple_mcq_model.dart';
import 'package:tradeable_learn_widget/multiple_mcq_select/multiple_mcq_question.dart';
import 'package:tradeable_learn_widget/tradeable_learn_widget.dart';
import 'package:tradeable_learn_widget/user_story_widget/user_story_model.dart';
import 'package:tradeable_learn_widget/video_educorner/video_educorner.dart';
import 'package:tradeable_learn_widget/video_educorner/video_educorner_model.dart';

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
  Recommendations? recommendations;

  @override
  void initState() {
    super.initState();
    Api().fetchLevelById(widget.levelId).then((val) {
      setState(() {
        isLoading = false;
        level = val;
        recommendations = level.recommendations;
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
        return LevelCompleteScreen(recommendations: recommendations);
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
      case "supply_demand_educorner":
        return DemandSuplyEduCornerMain(
            model: DemandSupplyEduCornerModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "user_story":
        return UserStoryUIMain(
            model: UserStoryModel.fromJson(data),
            onNextClick: () => onNextClick());
      case "horizontal_line_v1":
        return HorizontalLineQuestionV1(
            model: HorizontalLineModelV1.fromJson(data),
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
