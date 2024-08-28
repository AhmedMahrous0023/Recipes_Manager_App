
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDataBase {

  static Database? _db ;

  Future<Database?>get db async {
    if(_db==null){
      _db=await initialSql ();
      return _db ;
    }
    return _db ;
  }

  Future<Database>initialSql()async{
    String databasePath =await getDatabasesPath();
    String path =join(databasePath,'recipemanagerapp.db');
    Database mydb= await openDatabase(path,version: 1,onCreate: _onCreate,onUpgrade: _onUbgrade);
    return mydb ;
  }

 Future<void> _onCreate(Database db,int version)async{
  Batch batch=db.batch() ;

   batch.execute(''' 
  CREATE TABLE "Categories" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" TEXT NOT NULL
  )
  ''');

  batch.execute('''
CREATE TABLE "Recipes" (
"id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
"name" TEXT NOT NULL,
"instructions" TEXT NOT NULL,
"category_id" INTEGER,
"is_favorite" BOOLEAN DEFAULT 0,
FOREGIN KEY (category_id) REFERENCES Categories(id)
)
''');
  
  batch.execute('''
CREATE TABLE "Ingredients" (
"id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
"name" TEXT NOT NULL,
"recipe_id" INTEGER,
"quantity" TEXT NOT NULL,
FOREIGN KEY (recipe_id) REFERENCES Recipes(id)
)
''');
  await batch.commit();
   print('CREATE successfuly database*************************');
  }

  _onUbgrade(Database db ,int oldVersion, int newVersion)async{
     print('SUCCESFULY UPGRADE555555555555555555555555555555555');
  }

  //select mean read data 
  
  Future<List>readData(String sql)async{
    Database?mydb =await db ;
    List<Map> response =await mydb!.rawQuery(sql);
    return response ;
  }

  //insert data

 Future<int> insertData(String sql)async{
    Database? mydb=await db ;
    int response =await mydb!.rawInsert(sql);
    return response ;
  }

  //update data

  Future<int> updateData(String sql)async{
    Database? mydb=await db ;
    int response =await mydb!.rawUpdate(sql);
    return response ;
  }

  //delete data

  Future<int> deleteData(String sql)async{
    Database? mydb= await db ;
    int response =await mydb!.rawDelete(sql);
    return response ;
  }

  // delete all database

  removeAllDataBase()async{
    String databasePath =await getDatabasesPath();
    String path =join(databasePath,'recipemanagerapp.db');
    await deleteDatabase(path);
  }

}
