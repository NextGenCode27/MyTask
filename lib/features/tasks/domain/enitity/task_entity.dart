abstract class TaskEntity {
  final String id;
  final String userId;
  final String username;
  final String location;
  final String department;
  final String problemReported;
  final String assignTo;
  final bool isCompleted;
  final DateTime updatedAt;

  TaskEntity({
    required this.id,
    required this.userId,
    required this.username,
    required this.location,
    required this.department,
    required this.problemReported,
    required this.assignTo,
    required this.isCompleted,
    required this.updatedAt,
  });
}
