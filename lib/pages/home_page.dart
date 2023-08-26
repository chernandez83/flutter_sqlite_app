import 'package:flutter/material.dart';
import 'package:flutter_sqlite_app/modelo/diary.dart';
import 'package:flutter_sqlite_app/modelo/page.dart';
import 'package:flutter_sqlite_app/pages/form_page.dart';
import 'package:flutter_sqlite_app/widget/Cards/page_card.dart';

class MyHomePage extends StatefulWidget {
  final Diary diary;

  const MyHomePage({required this.diary, super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DiaryPage> pages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Bienvenid@ a tu diarrio ${widget.diary.type}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Center(
        child: FutureBuilder<List<DiaryPage>> (
          future: DiaryPage().getPages(widget.diary.id),
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //pages = snapshot.data;
            return (snapshot.connectionState == ConnectionState.done) ?
              getListView(snapshot.data) :
              const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goForm,
        tooltip: 'Agregar',
        child: const Icon(Icons.add),
      ),
    );
  }

  getListView(List<DiaryPage> pages) {
    this.pages = pages;
    return ListView.builder(
      itemCount: pages.length,
      itemBuilder: (BuildContext context, int index) {
        return PageCard(addPage, page: pages[index]);
      }
    );
  }

  void goForm() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => FormPage(addPage, diary: widget.diary),
    ));
  }

  addPage(DiaryPage? page) {
    if(page != null) {
      setState(() {
        pages.add(page);
      });
    }
  }
}
