import 'package:bloc_pattern/bloc/list_post_cubit.dart';
import 'package:bloc_pattern/pages/create_page.dart';
import 'package:bloc_pattern/pages/home_page.dart';
import 'package:bloc_pattern/pages/update_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => ListPostCubit(),
        child: const HomePage(),
      ),
      routes: {
        '/createPage': (context) => const CreatePage(),
        '/updatePage': (context) => UpdatePage(),
      },
    );
  }
}
