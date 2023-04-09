import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/screens/completed_tasks.dart';
import 'package:todo/screens/create_task.dart';
import 'package:todo/screens/task.dart';
import 'package:todo/utils/constant.dart';
import 'package:todo/utils/util.dart';

import '../bloc/task_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          bottom: const TabBar(
            indicatorColor: backgroundColor,
            labelColor: secondaryColor,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'Tasks'),
              Tab(text: 'Completed Task'),
            ],
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello!',
                style: kTextStyleWhite(22),
              ),
              Text(
                'This is your ToDo List.',
                style: kTextStyleWhite(12),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Task(),
            CompletedTask(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: secondaryColor,
          onPressed: () {
            context.next(CreateTask(isEdit: false,));
          },
          child: const Icon(
            Icons.add,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
