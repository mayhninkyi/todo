import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/screens/task_item.dart';
import 'package:todo/widgets/empty_task.dart';

import '../bloc/task_cubit.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskDataState>(builder: (context, state) {
      if (state is TaskDataInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is TaskDataSuccess) {
        return state.completedData.isEmpty
            ? const EmptyTask()
            : ListView.builder(
                shrinkWrap: true,
                itemCount: state.completedData.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskItem(
                    model: state.completedData[index],
                    isComplete: true,
                    index: index,
                  );
                });
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}
