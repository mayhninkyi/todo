import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/task_cubit.dart';
import 'package:todo/db/database.dart';
import 'package:todo/screens/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await database.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> TaskBloc(),
      child: MaterialApp(
        title: 'TODO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const Home(),
      ),
    );
  }
}
