//import 'dart:indexed_db';
import 'dart:io';

import 'package:path/path.dart';
import 'package:pr2/common/data_base_request.dart';
import 'package:pr2/data/model/role.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../data/model/product_category.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();
  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;

  late final String _pathDB;
  late final Database database;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    _pathDB = join(_appDocumentDirectory!.path, 'furniture_store.db');
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      sqfliteFfiInit();
      var databaseFactory = databaseFactoryFfi;
      database = await databaseFactory.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
              version: 1,
              onCreate: (db, version) {
                onCreateTable(db);
              },
              onUpgrade: ((db, oldVersion, newVersion) async {
                await onUpdateTable(db);
              })));
    } else {
      database =
          await openDatabase(_pathDB, version: 1, onCreate: (db, version) {
        onCreateTable(db);
      }, onUpgrade: ((db, oldVersion, newVersion) async {
        await onUpdateTable(db);
      }));
    }
    ;
  }

  Future<void> onUpdateTable(Database db) async {
    var table = await db.rawQuery('SELECT name FROM sqlite_master');
    for (var i = 0; i < DataBaseRequest.tableList.reversed.length; i++) {
      if (table
          .where((element) => element['name'] == DataBaseRequest.tableList[i])
          .isNotEmpty) {
        await db
            .execute(DataBaseRequest.deleteTable(DataBaseRequest.tableList[i]));
      }
    }
    for (var element in DataBaseRequest.createTableList) {
      await db.execute(element);
    }
    await onInitTable(db);
  }

  Future<void> onCreateTable(Database db) async {
    for (var i = 0; i < DataBaseRequest.tableList.length; i++)
      db.execute(DataBaseRequest.createTableList[i]);
  }

  Future<void> onInitTable(Database db) async {
    try {
      await db.insert(DataBaseRequest.tableCategory,
          Category(1,'Шкаф',).toMap());

      var res = await db
          .query(DataBaseRequest.tableCategory, where: "id = ?", whereArgs: [1]);

      await db.update(DataBaseRequest.tableCategory,
          Category(1, 'Тумба').toMap(),
          where: "id = ?", whereArgs: [1]);

      await db.delete(DataBaseRequest.tableCategory, where: "id = ?", whereArgs: [1]);
    } on DatabaseException catch (e) {
      print(e.getResultCode());
    }
  }

  Future<void> onDropDataBase() async {
    database.close();
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      databaseFactory = databaseFactoryFfi;
      databaseFactory.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
