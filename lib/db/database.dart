import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/model/model_todo.dart';

class Database {
  Database._();

  init() async {
    await registerBoxes();
  }

  Box<TaskModel> getTask() => Hive.box<TaskModel>('tasks');

  Future<void> registerBoxes() async {
    await Hive.initFlutter();

    Hive.registerAdapter(TaskModelAdapter());
    await Hive.openBox<TaskModel>('tasks');
  }
}

Database database = Database._();
