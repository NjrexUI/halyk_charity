import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, "ankets.db"),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE user_ankets(id TEXT PRIMARY KEY, image TEXT, fio TEXT, phone TEXT, address TEXT, age TEXT, familyCondition TEXT, littleChN TEXT, who TEXT, livingCondition TEXT, job TEXT, help TEXT, why TEXT, need TEXT, yesNo OBJECT, fioVolunteer TEXT, numberVolunteer TEXT)");
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}
