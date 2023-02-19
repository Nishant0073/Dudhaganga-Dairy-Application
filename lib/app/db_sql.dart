import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/rate.dart';

class DbManager {
  Database? _database;

  Future openDb() async {
    _database = await openDatabase(join(await getDatabasesPath(), "ss.db"),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE model(id INTEGER PRIMARY KEY autoincrement, fruitName TEXT, quantity TEXT)",
      );
    });
    return _database;
  }

  // Future insertModel(Model model) async {
  //   await openDb();
  //   return await _database.insert('model', model.toJson());
  // }

  Future<List<Rate>>? getModelList() async {
    await openDb();
    final List<Map<String, Object?>>? maps = await _database?.query('rate');

    return List.generate(
      maps?.length ?? 0,
      (i) {
        return Rate(
          snf: double.parse(maps![i]['snf'].toString()),
          fat: double.parse(maps[i]['snf'].toString()),
          value: double.parse(maps[i]['snf'].toString()),
        );
      },
    ).toList();
    // return maps
    //     .map((e) => Model(
    //         id: e["id"], fruitName: e["fruitName"], quantity: e["quantity"]))
    //     .toList();
  }

  // Future<int> updateModel(Model model) async {
  //   await openDb();
  //   return await _database.update('model', model.toJson(),
  //       where: "id = ?", whereArgs: [model.id]);
  // }

  // Future<void> deleteModel(Model model) async {
  //   await openDb();
  //   await _database.delete('model', where: "id = ?", whereArgs: [model.id]);
  // }
}
