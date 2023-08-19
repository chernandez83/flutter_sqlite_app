import 'package:flutter_sqlite_app/database/crud.dart';
import 'package:flutter_sqlite_app/database/db_table.dart';

class Page extends CRUD {
  int? id;
  String date;
  String title;
  String content;
  String diaryId;

  Page({this.id, this.date='', this.title='', this.content='', this.diaryId=''}):super(DBTable.PAGE);

  factory Page.toObject(Map<dynamic, dynamic> data) {
    return (data != null) ? Page(
      id: data['id'],
      date: data['date'],
      title: data['title'],
      content: data['content'],
      diaryId: data['diaryId']
    ) : Page();
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
    return (parsed as List).map((map) => Page.toObject(map)).toList();
  }
}