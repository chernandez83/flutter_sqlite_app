import 'package:flutter_sqlite_app/database/db_table.dart';

class DBMigrator {
  static const MIGRATION_SCRIPTS = [
    //'ALTER TABLE ${DBTable.DIARY} ADD COLUMN color TEXT;',
    'ALTER TABLE ${DBTable.DIARY} ADD COLUMN observaciones TEXT;',
  ];
}