import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../Model/quotes_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'quotes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE likedQuotes (
            category TEXT,
            quote TEXT,
            author TEXT,
            isLiked TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> insertLikedQuote(Quote quote) async {
    final db = await database;
    await db.insert(
      'likedQuotes',
      quote.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteLikedQuote(String quote) async {
    final db = await database;
    await db.delete(
      'likedQuotes',
      where: 'quote = ?',
      whereArgs: [quote],
    );
  }

  Future<List<Quote>> getLikedQuotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('likedQuotes');

    return List.generate(maps.length, (i) {
      return Quote.fromJson(maps[i]);
    });
  }
}
