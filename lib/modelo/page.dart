import 'package:flutter_sqlite_app/database/crud.dart';
import 'package:flutter_sqlite_app/database/db_table.dart';
import 'package:flutter_sqlite_app/modelo/diary.dart';

class DiaryPage extends CRUD {
  int? id;
  String date;
  String title;
  String content;
  int? diaryId;

  DiaryPage({this.id, this.date='', this.title='', this.content='', this.diaryId}):super(DBTable.PAGE);

  factory DiaryPage.toObject(Map<dynamic, dynamic> data) {
    return (data != null) ? DiaryPage(
      id: data['id'],
      date: data['date'],
      title: data['title'],
      content: data['content'],
      diaryId: data['diaryId']
    ) : DiaryPage();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'title': title,
      'content': content,
      'diaryId': diaryId
    };
  }

  getList(parsed) {
    return (parsed as List).map((map) => DiaryPage.toObject(map)).toList();
  }

  Future<List<DiaryPage>> getPages(diaryId) async {
    var pages = await query('SELECT * FROM ${DBTable.PAGE} WHERE diaryId=?', args: [diaryId]);
    return getList(pages);
  }

  saveOrUpdate() async {
    id = (id != null) ? await update(toMap()) : await insert(toMap());
    return (id! > 0) ? this : null;
  }
}