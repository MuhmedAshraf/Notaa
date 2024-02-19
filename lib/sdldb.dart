import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqldb {
  static Database? _db;

  initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'notaa.db');
    Database myDb = await openDatabase(path, onCreate: _onCreate, version: 1);
    return myDb;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE notes (id INTEGER PRIMARY KEY, tittle TEXT, note TEXT, color TEXT)');
    print('created');
  }

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  onUpgrade(Database db, int oldVersion, int newVersion) {
    print('Upgraded====================');
  }

  //-----------------------------------------------------------------------------------------

  //selectData from data base
  readData(String sql) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.rawQuery(sql);
    return response;
  }

  //insert
  insertData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  //update
  updateData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  //delete
  deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql);
    return response;
  }

  // delete all database
  deleteAll() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'notaa.db');
    await deleteDatabase(path);
  }
// ممكن ابقا استخدمها ف زرار هيمسح الداتا بيز كلها بملفاتها من الذاكرة بتاعة الجهاز وبالتالي لما اعمل هوت ريستارد هينفذ دالة onCreate من اول تاني فيمكن استخدمها لو عاوز اعدل ف الدالة دي مثلا والافضل استخدم دالة onUpgrade
}
