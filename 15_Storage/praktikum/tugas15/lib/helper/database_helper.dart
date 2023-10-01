import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tugas15/model/contact.dart';

class DatabaseHelper {
  // static final _databaseName = "crud.db";

  // static final table = 'contacts';

  // static final columnName = 'name';
  // static final columnNumber = 'number';

  // DatabaseHelper._privateConstructor();
  // static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static late Database? _database;
  static DatabaseHelper? _databaseHelper;
  final String _tableName = 'contact';

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDB();
    return _database!;
  }

  Future<Database> _initializeDB() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'contact_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        number TEXT NOT NULL
      )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> addContact(Contacts contacts) async {
    final Database db = await database;
    await db.insert(_tableName, contacts.toMap());
  }

  Future<List<Contacts>> getContacts() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((e) => Contacts.fromMap(e)).toList();
  }

  Future<Contacts> getContactById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((e) => Contacts.fromMap(e)).first;
  }

  Future<void> updateContact(Contacts contacts) async {
    final Database db = await database;
    await db.update(
      _tableName,
      contacts.toMap(),
      where: 'id = ?',
      whereArgs: [contacts.id],
    );
  }

  Future<void> deleteContact(int id) async {
    final Database db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
