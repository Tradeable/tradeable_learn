class TradeableLearnModuleModel {
  final String id;
  final String name;
  final String description;
  final String? note;
  final String? bgColor;
  final String? iconUrl;
  final bool? isRelated;

  TradeableLearnModuleModel(
      {required this.id,
      required this.name,
      required this.description,
      this.note,
      this.bgColor,
      this.iconUrl,
      this.isRelated});

  factory TradeableLearnModuleModel.fromJson(Map<String, dynamic> json) {
    return TradeableLearnModuleModel(
        id: json['level_id'].toString(),
        name: json['title'] ?? '',
        description: json['description'] ?? '',
        note: json['status'],
        bgColor: json['color'],
        iconUrl: json['image_url'],
        isRelated: json['is_related']);
  }
}
