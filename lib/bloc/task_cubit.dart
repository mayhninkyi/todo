import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/model_todo.dart';
import 'package:todo/db/database.dart';

part 'task_state.dart';

class TaskBloc extends Cubit<TaskDataState> {
  TaskBloc() : super(TaskDataInitial());

  final taskBox = database.getTask();
  List<TaskModel> activeTasks = [];
  List<TaskModel> completeTasks = [];

  fetchTasks() async {
    final allTasks = taskBox.keys.map((key) {
      TaskModel? taskModel = taskBox.get(key);
      taskModel?.key = key;
      return taskModel;
    }).toList();
    activeTasks = [];
    completeTasks = [];
    for (var val in allTasks) {
      if (val?.completed ?? false) {
        completeTasks.add(val ?? TaskModel());
      } else {
        activeTasks.add(val ?? TaskModel());
      }
    }

    emit(TaskDataSuccess(activeTasks, completeTasks));
  }

  editTask(TaskModel model, int key) async {
    taskBox.put(key, model);
    fetchTasks();
  }

  deleteTask(int key) async {
    taskBox.deleteAt(key);
    fetchTasks();
  }

  addTasks(TaskModel model) async {
    taskBox.add(model);
    fetchTasks();
  }

}
