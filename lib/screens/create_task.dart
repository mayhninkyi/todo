import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/model/model_todo.dart';
import 'package:todo/utils/constant.dart';
import 'package:todo/utils/util.dart';
import 'package:todo/widgets/custom_button.dart';
import 'package:todo/widgets/custom_textfield.dart';

import '../bloc/task_cubit.dart';

class CreateTask extends StatelessWidget {
  final bool isEdit;
  final TaskModel? model;
  final int? index;
  CreateTask({super.key, required this.isEdit, this.model, this.index});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (isEdit) {
      titleController.text = model?.title ?? "";
      descController.text = model?.description ?? "";
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30.0,
              color: secondaryColor,
            ),
            onPressed: () => context.back(),
          )),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              kVerticalSpace(20),
              Text(
                isEdit ? "Edit Task" : "New Task",
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: secondaryColor,
                ),
              ),
              kVerticalSpace(10),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomTextField(
                      label: 'Title',
                      controller: titleController,
                    ),
                    const SizedBox(height: 20.0),
                    CustomTextField(
                      label: 'Description',
                      controller: descController,
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                        child: CustomButton(
                            title: 'Save',
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (titleController.text.isEmpty ||
                                  descController.text.isEmpty) {
                                Fluttertoast.showToast(
                                  msg: "Please fill all the fields!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  backgroundColor: primaryColor,
                                  textColor: secondaryColor,
                                  fontSize: 16.0,
                                );
                                return;
                              }
                              TaskModel taskModel = TaskModel(
                                  title: titleController.text,
                                  description: descController.text,
                                  completed: false);

                              if (isEdit) {
                                context
                                    .read<TaskBloc>()
                                    .editTask(taskModel, index ?? 0);
                              } else {
                                context.read<TaskBloc>().addTasks(taskModel);
                              }
                              context.back();
                            }))
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}
