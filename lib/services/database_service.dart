import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:espaco_cultural_2/components/evento.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'espaco_cultural.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onOpen: _onOpen,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE eventos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        date TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE devices(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT,
        isOn INTEGER
      )
    ''');
  }

  Future<void> _onOpen(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS devices(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT,
        isOn INTEGER
      )
    ''');
  }

  Future<void> insertEvento(Evento evento) async {
    final db = await database;
    await db.insert('eventos', evento.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Evento>> getEventos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('eventos');
    return List.generate(maps.length, (i) {
      return Evento(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        date: DateTime.parse(maps[i]['date']),
      );
    });
  }

  Future<void> deleteEvento(int id) async {
    final db = await database;
    await db.delete(
      'eventos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Dispositivos
  Future<void> insertDevice(Map<String, dynamic> device) async {
    final db = await database;
    await db.insert('devices', device, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getDevices() async {
    final db = await database;
    return await db.query('devices');
  }

  Future<void> updateDevice(int id, Map<String, dynamic> device) async {
    final db = await database;
    await db.update(
      'devices',
      device,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteDevice(int id) async {
    final db = await database;
    await db.delete(
      'devices',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
