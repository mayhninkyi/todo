import 'package:hive/hive.dart';

part 'model_todo.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  bool? completed;
  @HiveField(3)
  int? key;

  TaskModel({this.title, this.description, this.completed, this.key});
}
