import 'package:path/path.dart';
import 'package:shop_house/model/category.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  //database name
  static final String _dbName = 'shophouse';
  //database version
  static int _dbversion = 1;

  //table name
  static final String _tableCategory = "category";

  //column names
  static final String _id = 'id';
  static final String _title = 'title';
  static final String _desc = 'description';
  static final String _image = 'imagePath';
  static final String _date = 'date';

  static Database? _database;

  Future<Database?> getDatabase() async {
    if (_database == null) {
      _database = await createDatabase();
    }
    return _database;
  }

  Future<Database> createDatabase() async {
    // var path = await getDatabasesPath();

    var path = join(await getDatabasesPath(), _dbName);

    print('database path:$path');

    return await openDatabase(
      path,
      version: _dbversion,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE $_tableCategory('
            '$_id INTEGER PRIMARY KEY AUTOINCREMENT,'
            '$_title TEXT,'
            '$_desc TEXT,'
            '$_image TEXT,'
            '$_date INTEGER'
            ')');
      },
    );
  }

  Future<int?> insert(Category category) async {
    final db = await getDatabase();

    return await db!.insert(_tableCategory, category.toMap());
  }

  void update() {}
  void delete() {}

  Future<List<Category>> read() async {
    var categoryList = <Category>[];
    final db = await getDatabase();
    // final List<Map<String, dynamic>> maps = await db!.query(_tableCategory);

    final List<Map<String, dynamic>> maps =
        await db!.rawQuery("select * from $_tableCategory");

    //Convert the List<Map<String, dynamic> into a List<Category>.
    categoryList =
        List.generate(maps.length, (index) => Category.fromMap(maps[index]));

    return categoryList;
    // print(maps);
  }
}
