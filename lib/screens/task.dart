import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/task_cubit.dart';
import 'package:todo/screens/task_item.dart';
import 'package:todo/widgets/empty_task.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskDataState>(
        builder: (context, state) {
      if (state is TaskDataInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is TaskDataSuccess) {
        return state.data.isEmpty
            ? const EmptyTask()
            : ListView.builder(
                shrinkWrap: true,
                itemCount: state.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskItem(model:state.data[index],isComplete: false,index: index,);
                });
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}
