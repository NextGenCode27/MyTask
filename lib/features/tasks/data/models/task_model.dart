import 'package:my_task/features/tasks/domain/enitity/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.userId,
    required super.username,
    required super.location,
    required super.department,
    required super.problemReported,
    required super.assignTo,
    required super.isCompleted,
    required super.updatedAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      username: map['username'] as String,
      location: map['location'] as String,
      department: map['department'] as String,
      problemReported: map['problem_reported'] as String,
      assignTo: map['assign_to'] as String,
      isCompleted: map['is_complete'] as bool,
      updatedAt: map['updated_at'] == null
          ? DateTime.now()
          : DateTime.parse(map['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'username': username,
      'location': location,
      'department': department,
      'problem_reported': problemReported,
      'assign_to': assignTo,
      'is_complete': isCompleted,
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  TaskModel copyWith({
    required String? id,
    required String? userId,
    required String? username,
    required String? location,
    required String? department,
    required String? problemReported,
    required String? assignTo,
    required bool? isCompleted,
    required DateTime? updatedAt,
  }) {
    return TaskModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      location: location ?? this.location,
      department: department ?? this.department,
      problemReported: problemReported ?? this.problemReported,
      assignTo: assignTo ?? this.assignTo,
      isCompleted: isCompleted ?? this.isCompleted,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
