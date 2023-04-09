
part of 'task_cubit.dart';

@immutable
abstract class TaskDataState{}

class TaskDataInitial extends TaskDataState{}

class TaskDataSuccess extends TaskDataState{
  final List<TaskModel> data;
  final List<TaskModel> completedData;
  TaskDataSuccess(this.data,this.completedData);
}

class TaskDataFail extends TaskDataState{}