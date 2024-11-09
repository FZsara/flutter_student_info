import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('students.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE students (
        id TEXT PRIMARY KEY,
        name TEXT,
        email TEXT,
        location TEXT,
        institute TEXT,
        department TEXT,
        cgpa TEXT
      )
    ''');
  }

  Future<void> addOrUpdateStudent(String name, String id, String email, String location, String institute, String department, String cgpa) async {
    final db = await instance.database;
    await db.insert(
      'students',
      {'id': id, 'name': name, 'email': email, 'location': location, 'institute': institute, 'department': department, 'cgpa': cgpa},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    final db = await instance.database;
    return await db.query('students');
  }

  Future<void> deleteStudent(String id) async {
    final db = await instance.database;
    await db.delete('students', where: 'id = ?', whereArgs: [id]);
  }
}
