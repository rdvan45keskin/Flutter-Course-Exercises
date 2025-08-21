import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_demo/models/product.dart';

class Dbhelper {
  Database? _db;
  String tableName = "products";

  //ileride çalışmasını sağlıyoz programdan bağımsız bir şekilde
  Future<Database> get DB async {
    //database yoksa yeni database oluşturmasını sağlıyoz
    if (_db == null) {
      _db = await initializeDb();
    }
    // varsa db döndürüyoz
    return _db!;
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
        "Create table $tableName(id integer primary key, name text, description text, unitPrice integer)");
  }

  //tablodaki tüm verileri getirme
  //product türünde bir liste döndürecek
  Future<List<Product>> getProducts() async {
    Database db = await DB;
    var result = await db.query(tableName);
    //result listesi uzunluğunda her değeri listeye atayan bir komut satırı
    return List.generate(result.length, (i) {
      //sonucun i. elemanını product listesine dönüştür
      return Product.fromObject(result[i]);
    });
  }

  //product değerinde bir veri yollayıp tabloya veri ekleme
  Future<int> insert(Product product) async {
    Database db = await DB;
    var result = await db.insert(tableName, product.toMap());
    return result;
  }

  //product değerinde bir veri yollayıp tablodaki veriyi güncelleme
  Future<int> update(Product product) async {
    Database db = await DB;
    //1. yol
    var result = await db.update(tableName, product.toMap(),
        where: "id = ?", whereArgs: [product.id]);
    return result;
  }

  //int id değerinde bir veri yollayıp tablodan veri silme
  Future<int> delete(int id) async {
    Database db = await DB;
    //2. yol
    var result = await db.rawDelete("delete from $tableName where id = $id");
    return result;
  }
}
