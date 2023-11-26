import 'package:hive/hive.dart';

class TodaDatabase {
  final _db = Hive.box('mydb');
  List todosList = [];
  //Initial use of the app
  void createInitialData() {
    todosList = [
      [true, "First Task"],
      [false, "Last Task"],
    ];
  }

  //read data
  void readData() {
    todosList = _db.get("TODOLIST");
  }

  //update data
  void updateBox() {
    _db.put("TODOLIST", todosList);
  }
}
