
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sqflite/sqflite.dart';

final weatherDataBaseProvider = FutureProvider<Database>((ref) async {
  final dbPath = await getApplicationDocumentsDirectory();
  String pathDirectory = join(dbPath.path, 'weather.db');
  return openDatabase(
    pathDirectory,
    version: 1,
    onCreate: (db, version) {
      db.execute('''
  

''');
    },
  );
});
