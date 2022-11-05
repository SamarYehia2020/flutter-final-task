import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'new3.db');
    Database mydb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onUpgrade: _onUpgrade,
    );
    return mydb;
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
          CREATE TABLE  orders  (
            id  INTEGER PRIMARY KEY NOT NULL  ,
            product_id  INTEGER  NOT NULL  ,
            title TEXT NOT NULL , 
            quantity  INTEGER NOT NULL,
            shipping  TEXT NOT NULL,
            image  TEXT NOT NULL,
            price  INTEGER NOT NULL,
            special  INTEGER NOT NULL
          )
        ''');
    batch.execute('''
          CREATE TABLE  favouret  (
            id  INTEGER PRIMARY KEY NOT NULL  ,
            product_id  INTEGER  NOT NULL  , 
          )
        ''');
    print("====== Create database and tables ====== ");
    await batch.commit();
  }

  _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    print("====== on Upgrade ====== ");
    await db.execute("ALTER TABLE notes ADD COLUMN color TEXT ");
  }

  //====> SELECT
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    print("===>$response");
    return response;
  }

  //====> INSERT
  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    print("===>$response");
    return response;
  }

  //====> UPDATE
  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    print("===>$response");
    return response;
  }

  //====> DELETE
  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    print("===>$response");
    return response;
  }
}
