import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
class RenterDetail{
  String name;
  String father_name;
  String aadhar;
  String email;
  String mobile;
  String mobile2;
  String room_no;
  String rent;
  String date;

  RenterDetail({
    this.name,
    this.father_name,
    this.aadhar,
  this.email,
    this.mobile,
    this.mobile2,
    this.room_no,
    this.rent,
    this.date,
});
  Map<String,dynamic>toMap(){
    return{
      'name':name,
      'father_name':father_name,
      'aadhar':aadhar,
      'email':email,
      'mobile':mobile,
      'mobile2':mobile2,
      'room_no':room_no,
      'rent':rent,
      'date':date
    };
  }
}
class DatabaseHelperRenter{
  static final _databaseName="renter.db";
  static final _databaseVersion=1;
  static final table="renter_detail";
  static final nameColumn='name';
  static final father_nameColumn='father_name';
  static final aadharColumn="aadhar";
  static final emailColumn="email";
  static final mobileColumn="mobile";
  static final mobil2eColumn="mobile2";
  static final room_noColumn="room_no";
  static final rentColumn="rent";
  static final dateColumn="date";
  DatabaseHelperRenter._privateConstructor();
  static final DatabaseHelperRenter instance=DatabaseHelperRenter._privateConstructor();
  static Database _database;
  Future <Database> get database async{
    if(_database!=null)
      return _database;
    //if not found first time then
    _database=await _initDatabase();
    return _database;
  }
  _initDatabase()async{
    Directory documentDirectory=await getApplicationDocumentsDirectory();
    String path=join(documentDirectory.path,_databaseName);
    return await openDatabase(path,
    version: _databaseVersion,
      onCreate: _onCreate
    );
  }
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $nameColumn TEXT NOT NULL,
            $father_nameColumn TEXT NOT NULL,
            $aadharColumn TEXT PRIMARY KEY,
            $emailColumn TEXT NOT NULL,
    $mobileColumn TEXT NOT NULL,
    $mobil2eColumn TEXT NOT NULL,
    $room_noColumn TEXT NOT NULL,
    $rentColumn TEXT NOT NULL,
    $dateColumn TEXT NOT NULL)''');

  }
 Future  <int> insertRenter(RenterDetail obj)async{
    final db=await database;
    return await db.insert(
      table,
      obj.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List <RenterDetail>>viewAllRenter()async{
    final db=await database;
    final List<Map<String,dynamic>>maps=await db.query(table);
    return List.generate(maps.length, (index){
      return RenterDetail(
        name:maps[index][nameColumn],
        father_name: maps[index][father_nameColumn],
        aadhar: maps[index][aadharColumn],
        email: maps[index][emailColumn],
        mobile: maps[index][mobileColumn],
        mobile2: maps[index][mobil2eColumn],
        room_no: maps[index][room_noColumn],
        rent: maps[index][rentColumn],
        date: maps[index][dateColumn],
      );
    });
  }
  Future<int> deleteRenter(String aadhar) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$aadharColumn = ?', whereArgs: [aadhar]);
  }

}