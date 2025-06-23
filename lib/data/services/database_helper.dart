import 'package:eleven_sync/domain/entities/tactic.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TacticaDatabase {
  static Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'tacticas.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE tacticas(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT,
            descripcion TEXT,
            formacion TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  static Future<void> insertTactica(Tactica tactica) async {
    final db = await _getDatabase();
    await db.insert(
      'tacticas',
      tactica.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Tactica>> getTacticas() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('tacticas');
    return List.generate(maps.length, (i) => Tactica.fromMap(maps[i]));
  }

  static Future<void> deleteTactica(int id) async {
    final db = await _getDatabase();
    await db.delete('tacticas', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> updateTactica(Tactica tactica) async {
    final db = await _getDatabase();
    await db.update(
      'tacticas',
      tactica.toMap(),
      where: 'id = ?',
      whereArgs: [tactica.id],
    );
  }
}
