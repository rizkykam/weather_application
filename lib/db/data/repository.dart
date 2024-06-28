import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_application/db/domain/weather_entity.dart';

final dbRepositoryProvider = Provider((ref) => DbRepository());

class DbRepository {

  static Database? _database;
  final _tableName = "weather";
  final _log = Logger('DB-Repository');

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      '$path/$_tableName',
      version: 1,
      onCreate: (db, version) => db.execute(
        'CREATE TABLE $_tableName (cityId INTEGER PRIMARY KEY, name TEXT, icon TEXT, date DATETIME, temp REAL)'
      ),
    );
  }

  Future<List<WeatherEntity>> getList() async {
    final db = await database;
    final List<Map<String, dynamic>> items = await db.query(_tableName);
    _log.info('get: ${items.length}');
    return List.generate(items.length, (i) => WeatherEntity.fromJson(items[i]));
  }
  
  Future<void> delete(num id) async {
    final db = await database;
    _log.info('deleting $id...');
    db.delete(_tableName, where: 'cityId = ?', whereArgs: [id]);
    _log.info('$id deleted');
  }
  
  Future<int> insert(WeatherEntity item) async {
    final db = await database;
    _log.info('inserting...');
    return await db.insert(_tableName, item.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<bool> hasSaved(num id) async {
    final db = await database;
    final weatherDb = await db.query(_tableName, where: 'cityId = ?', whereArgs: [id]);
    return weatherDb.length == 1;
  }

  // Future<void> bulkUpdate(List<WeatherEntity> weatherEntity) async {
  //   final db = await database;
  //   final batch = db.batch();
  //   for (var entity in weatherEntity) {
  //     batch.insert(_tableName, entity.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  //   }
  //   batch.commit(noResult: true);
  // }

  // Future<WeatherData> getByName(String name) async {
  //   final db = await database;
  //   _logs.d('do get weather by name to db...');
  //   final result = await db.query(_tableName, where: 'name = ?', whereArgs: [name]);
  //   return WeatherData.fromDb(WeatherEntity.fromJson(result.first));
  // }
}