import 'package:flutter_sqlite_app/database/crud.dart';
import 'package:flutter_sqlite_app/database/db_table.dart';

class DiaryPage extends CRUD {
  int? id;
  String date;
  String title;
  String content;
  String diaryId;

  DiaryPage({this.id, this.date='', this.title='', this.content='', this.diaryId=''}):super(DBTable.PAGE);

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
}