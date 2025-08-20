class BudgetModel {
  final String id;
  final String title;
  final double limit;
  final double spent;
  final DateTime startDate;
  final DateTime endDate;

  BudgetModel({
    required this.id,
    required this.title,
    required this.limit,
    required this.spent,
    required this.startDate,
    required this.endDate,
  });

  factory BudgetModel.fromJson(Map<String, dynamic> json) {
    return BudgetModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      limit: (json['limit'] is int)
          ? (json['limit'] as int).toDouble()
          : (json['limit'] ?? 0.0) as double,
      spent: (json['spent'] is int)
          ? (json['spent'] as int).toDouble()
          : (json['spent'] ?? 0.0) as double,
      startDate: DateTime.tryParse(json['startDate'] ?? '') ?? DateTime.now(),
      endDate: DateTime.tryParse(json['endDate'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "limit": limit,
    "spent": spent,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
  };
}
