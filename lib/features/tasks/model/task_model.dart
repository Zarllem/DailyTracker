class TaskModel {
  String task;
  DateTime startDate;
  DateTime? endDate;
  Duration? povtor;
  int priority;
  List<String>? tags;
  bool? isDone;

  TaskModel({
    required this.task,
    required this.startDate,
    required this.povtor,
    required this.endDate,
    required this.priority,
    required this.tags,
    required this.isDone,
  });

  TaskModel copyWith({String? task, DateTime? startDate, DateTime? endDate, Duration? povtor, int? priority, List<String>? tags, bool? isDone}) {
    return TaskModel(
      task: task ?? this.task,
      startDate: startDate ?? this.startDate,
      povtor: povtor ?? this.povtor,
      endDate: endDate ?? this.endDate,
      priority: priority ?? this.priority,
      tags: tags ?? this.tags,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task': task,
      'startDate': startDate,
      'endDate': povtor == null ? startDate : endDate,
      'povtor': povtor ?? 0,
      'priority': priority,
      'tags': tags,
      'isDone': isDone,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    task: json['task'],
    startDate: json['startDate'],
    povtor: json['povtor'],
    endDate: json['endDate'],
    priority: json['priority'],
    tags: json['tags'],
    isDone: json['isDone'],
  );
}
