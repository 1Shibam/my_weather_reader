import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_weather_reader/database/weather_database.dart';
import 'package:my_weather_reader/models/weather%20model/weather_data.dart';
import 'package:sqflite/sqflite.dart';

class WeatherDatabaseService {
  final Database database;
  WeatherDatabaseService(this.database);

  //! add search to database
  Future<int> addSearchToDB(WeatherDataModel weatherData) async {
    return await database.insert('weatherTable', weatherData.toMap());
  }

  //! get list of searched location
  Future<List<WeatherDataModel>> getSearchedList() async {
    final maps = await database.query('weatherTable');
    return maps.map((data) => WeatherDataModel.fromJson(data)).toList();
  }

  //! delete from search list
  Future<int> deletedSearchedLocation(int id) async {
    return await database
        .delete('weatherTable', where: 'weatherID = ?', whereArgs: [id]);
  }
}

final weatherDatabaseServiceProvider = Provider<WeatherDatabaseService>((ref) {
  final databaseAsync = ref.watch(weatherDataBaseProvider);

  return databaseAsync.when(
      data: (data) {
        return WeatherDatabaseService(data);
      },
      error: (error, stackTrace) {
        return throw Exception('Error loading database: $error');
      },
      loading: () => throw Exception('Still Loading'));
});

/*
// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/database/database_provider.dart';
import 'package:todo_app/model/todos_model.dart';

//! This the the Data source!!
class TodoDataSource {
  // Instance of database
  final Database database;

  TodoDataSource(this.database);

  //! Add Todo
  Future<int> createTodo(TodosModel todo) async {
    return await database.insert('todoTable', todo.toMap());
  }

  //! Get Todos List
  Future<List<TodosModel>> getTodosList() async {
    // print('getting the todo list!');
    final maps = await database
        .query('todoTable', where: 'todoDeleted = ?', whereArgs: [0]);
    return maps.map((data) => TodosModel.fromMap(data)).toList();
  }

  //! Get Completed Todos List
  Future<List<TodosModel>> getCompletedTodosList() async {
    final maps = await database.query(
      'todoTable',
      where: 'todoCompleted = ?',
      whereArgs: [1], // 1 is for true as sqlite doesnt support boolean values!
    );
    return maps.map((data) => TodosModel.fromMap(data)).toList();
  }

//! Get Soft Deleted Todos List
  Future<List<TodosModel>> getSoftDeletedTodosList() async {
    // print('this is running burh!!');
    final maps = await database.query(
      'todoTable',
      where: 'todoDeleted = ?',
      whereArgs: [1], 
    );
    return maps.map((data) => TodosModel.fromMap(data)).toList();
  }

  //! Update Todo Details
  Future<int> updateTheTodo(TodosModel todo) async {
    return await database.update(
      'todoTable',
      {
        'todoTitle': todo.todoTitle,
        'todoDesc': todo.todoDesc,
        'todoStartDate': todo.todoStartDate,
        'todoEndDate': todo.todoEndDate,
      },
      where: 'todoID = ?',
      whereArgs: [todo.todoID],
    );
  }

  //! Toggle Completion Status
  Future<int> updateCompletionStatus(int id, bool isCompleted) async {
    return await database.update(
      'todoTable',
      {'todoCompleted': isCompleted ? 1 : 0},
      where: 'todoID = ?',
      whereArgs: [id],
    );
  }

  //! Soft Delete Todo (Restorable)
  Future<int> softDeleteTheTodo(int id) async {
    print('i tried deleting');
    return await database.update(
        'todoTable',
        {
          'todoDeleted': 1,
          'todoCompleted': 0,
        },
        where: 'todoID = ?',
        whereArgs: [id]);
  }

  //! Restore Soft-Deleted Todo
  Future<int> restoreTodo(int id) async {
    return await database.update('todoTable', {'todoDeleted': 0},
        where: 'todoID = ?', whereArgs: [id]);
  }

  //! Permanent Delete Todo
  Future<int> deleteTheTodo(int id) async {
    return await database
        .delete('todoTable', where: 'todoID = ?', whereArgs: [id]);
  }

  //! Permanent delete all todos
  Future<int> permanentDeleteAllTodo() async {
    return await database
        .delete('todoTable', where: 'todoDeleted = ?', whereArgs: [1]);
  }
}

final todoDataSourceProvider = Provider<TodoDataSource>((ref) {
  final databaseAsync = ref.watch(databaseProvider);

  return databaseAsync.when(
    data: (data) {
      //? print('everything is right here!!');
      return TodoDataSource(data);
    },
    error: (err, stackTrace) => throw Exception('Error loading database: $err'),
    loading: () => throw Exception('Database still loading!'),
  );
});
*/
