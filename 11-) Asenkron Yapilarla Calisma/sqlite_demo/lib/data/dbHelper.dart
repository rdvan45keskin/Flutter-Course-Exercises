import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper {
  late Database _db;

  //ileride çalışmasını sağlıyoz programdan bağımsız bir şekilde
  Future<Database> get db async {
    //database yoksa yeni database oluşturmasını sağlıyoz
    if (_db == null) {
      _db = await initializeDb();
    }
    // varsa db döndürüyoz
    return _db;
  }

  //db oluşturma fonksiyonu
  Future<Database> initializeDb() async {
    //database yolunu aldık ve ismini "etrade.db koyduk"
    String dbPath = join(await getDatabasesPath(), "etrade.db");
    //database yolunu alarak db açtık eğer db yoksa oluşturduk
    var eTradeDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return eTradeDb;
  }

  //tabloyu oluşturma
  Future<void> createDb(Database db, int version) async {
    await db.execute(
        "Create table product(id integer primary key, name text, description text, unitPrice integer)");
  }
}
