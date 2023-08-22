import 'package:flutter_sqlite_app/database/db_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {

  String name = 'DiaryApp';
  int version = 1;

  Future<Database> open() async {
    String path = join(await getDatabasesPath(), name);
    return openDatabase(
      path,
      version: version,
      readOnly: false,
      onConfigure: onConfigure,
      onCreate: onCreate,
    );
  }

}

onConfigure(Database db) {
  db.execute('PRAGMA foreign_keys = ON');
}

onCreate(Database db, int version) async {
  //DBTable.TABLES.forEach((script) async => await db.execute(script));
  for(String script in DBTable.TABLES) {
    await db.execute(script);
  }
}