import 'package:flutter/material.dart';
import 'package:flutter_sqlite_app/modelo/diary.dart';
import 'package:flutter_sqlite_app/widget/lockscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List<Diary> diaries = [];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: FutureBuilder<List<Diary>>(
              future: Diary().getDiaries(),
              initialData: const [],
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return (snapshot.connectionState == ConnectionState.done) ?
                LockScreen(diaries: snapshot.data) :
                const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}