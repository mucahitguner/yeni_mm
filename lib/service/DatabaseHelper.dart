import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'mm.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE musteriler(id INTEGER PRIMARY KEY, telefon TEXT UNIQUE)",
        );
      },
    );
  }

  Future<void> insertData(String telefon) async {
    final db = await DatabaseHelper().database;

    try {
      await db.insert(
        'musteriler',
        {'telefon': telefon},
        conflictAlgorithm:
            ConflictAlgorithm.fail, // Kısıtlama ihlali durumunda başarısız olur
      );
      //print('Veri başarıyla eklendi!');
    } catch (e) {
      //print('Aynı kayıt zaten mevcut');
    }
  }

  void addData(String telefon) async {
    await insertData(telefon);
    //print('Veri başarıyla eklendi!');
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    final db = await database;
    return await db.query('musteriler');
  }
}
