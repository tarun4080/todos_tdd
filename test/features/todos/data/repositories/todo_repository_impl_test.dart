import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todostdd/features/todos/data/datasources/service.dart';
import 'package:todostdd/features/todos/data/models/todos_model.dart';
import 'package:todostdd/features/todos/data/repositories/todo_repository_impl.dart';
import 'package:todostdd/features/todos/domain/entities/todo_entity.dart';

class MockServiceDataSource extends Mock implements Services {}

void main() {
  TodoRepositoryImpl todoRepositoryImpl;
  MockServiceDataSource mockServiceDataSource;

  setUp(() {
    mockServiceDataSource = MockServiceDataSource();
    todoRepositoryImpl = TodoRepositoryImpl(dataSource: mockServiceDataSource);
  });

  group("Get the data from the data source", () {
    final tTodosModel =[ Todos(
        userId: 2,
        id: 2,
        title: "This is the test for model",
        completed: false)];
    final List<Todo> todo = tTodosModel;

    test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockServiceDataSource.getTodosList()).thenAnswer((_) async => tTodosModel);
          // act
          final result = await todoRepositoryImpl.getToDosList();
          // assert
          verify(mockServiceDataSource.getTodosList());
          expect(result, equals(Right(todo)));
        },
      );
  });
}
