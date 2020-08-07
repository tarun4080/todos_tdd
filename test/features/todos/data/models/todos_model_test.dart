import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:todostdd/features/todos/data/models/todos_model.dart';
import 'package:todostdd/features/todos/domain/entities/todo_entity.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTodosModel = Todos(
      userId: 2, id: 2, title: "This is the test for model", completed: false);

  test("should be a subclass of Todo entity", () async {
    expect(tTodosModel, isA<Todo>());
  });


group('fromJson', () {
    test('should return a valid model', () async {
      
      final Map<String, dynamic> jsonMap = json.decode(fixture('todos.json'));
      
      final result = Todos.fromJson(jsonMap);
      
      expect(result, tTodosModel);
    });
  });

   group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        
        final result = tTodosModel.toJson();
      
        final expectedMap = {
         "userId": 2, 
         "id": 2, 
         "title": "This is the test for model", 
         "completed": false
        };
        
        expect(result, expectedMap);
      },
    );
  });

  
}
