import 'package:flutter_sqlite_app/database/crud.dart';
import 'package:flutter_sqlite_app/database/db_table.dart';

class Diary extends  CRUD {
  int? id;
  String type;
  String enterCode;

  Diary({this.id, this.type='', this.enterCode=''}):super(DBTable.DIARY);

  factory Diary.toObject(Map<dynamic, dynamic> data) {
    return (data != null) ? Diary(
      id: data['id'],
      type: data['type'],
      enterCode: data['enterCode']
    ) : Diary();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'enterCode': enterCode
    };
  }

  getList(parsed) {
    return (parsed as List).map((map) => Diary.toObject(map)).toList();
  }

  save() async {
    id = await insert(toMap());
    return (id! > 0 ? this : null);
  }

  /*checkEnterCode(String code) {
    return (code == enterCode ? this : null);
  }*/
  checkEnterCode(String code) async {
    var result = await query('SELECT * FROM ${DBTable.DIARY} WHERE id=? AND enterCode=?', args: [id, code]);
    return Diary.toObject(result[0]);
  }

   Future<List<Diary>> getDiaries() async {
    var diaries = await query('SELECT * FROM ${DBTable.DIARY}');
    return getList(diaries);
  }
}