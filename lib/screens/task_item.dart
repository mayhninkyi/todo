import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/model/model_todo.dart';
import 'package:todo/utils/constant.dart';
import 'package:todo/utils/util.dart';

import '../bloc/task_cubit.dart';
import 'create_task.dart';

class TaskItem extends StatelessWidget {
  final TaskModel model;
  final bool isComplete;
  final int index;
  const TaskItem(
      {super.key,
      required this.model,
      required this.isComplete,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
        decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), bottomLeft: Radius.circular(25))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title ?? "",
                    style: kTextStyle(22),
                  ),
                  Text(
                    model.description ?? "",
                    style: kTextStyle(16),
                  ),
                ],
              ),
            ),
            kHorizontalSpace(8),
            (model.completed ?? false)
                ? Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: secondaryColor.withOpacity(0.5)),
                    child: Text(
                      "Completed",
                      style: kTextStyleWhite(12),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                context.next(CreateTask(
                                  isEdit: true,
                                  model: model,
                                  index: model.key,
                                ));
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: secondaryColor,
                              )),
                          IconButton(
                              onPressed: () {
                                context
                                    .read<TaskBloc>()
                                    .deleteTask(model.key ?? 0);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red[300],
                              ))
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          model.completed = true;
                          context
                              .read<TaskBloc>()
                              .editTask(model, model.key ?? 0);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              color: secondaryColor),
                          child: Text(
                            "Done",
                            style: kTextStyleWhite(12),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ));
  }
}
