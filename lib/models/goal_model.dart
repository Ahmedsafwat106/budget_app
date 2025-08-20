class GoalModel {
  final String id;
  final String title;
  final double progress;
  final double targetAmount;
  final double savedAmount;

  GoalModel({
    required this.id,
    required this.title,
    required this.progress,
    required this.targetAmount,
    required this.savedAmount,
  });

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      progress: (json['progress'] is int)
          ? (json['progress'] as int).toDouble()
          : (json['progress'] ?? 0.0) as double,
      targetAmount: (json['targetAmount'] is int)
          ? (json['targetAmount'] as int).toDouble()
          : (json['targetAmount'] ?? 0.0) as double,
      savedAmount: (json['savedAmount'] is int)
          ? (json['savedAmount'] as int).toDouble()
          : (json['savedAmount'] ?? 0.0) as double,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "progress": progress,
    "targetAmount": targetAmount,
    "savedAmount": savedAmount,
  };
}
