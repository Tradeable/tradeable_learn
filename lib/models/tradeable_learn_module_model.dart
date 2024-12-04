class TradeableLearnModuleModel {
  final String id;
  final String name;
  final String description;
  final String? note;
  final String? bgColor;
  final String? iconUrl;

  TradeableLearnModuleModel(
      {required this.id,
      required this.name,
      required this.description,
      this.note,
      this.bgColor,
      this.iconUrl});
}
