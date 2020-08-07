import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todostdd/core/usecases/usecases.dart';
import 'package:todostdd/features/todos/domain/entities/todo_entity.dart';
import 'package:todostdd/features/todos/domain/repository/todo_repository.dart';
import 'package:todostdd/features/todos/domain/usecases/get_todo_list.dart';

class MockToDoRepository extends Mock implements ToDoRepository {}

final tTodosList = [
  Todo(userId: 1, id: 1, title: "This is the first todo.", completed: false),
  Todo(userId: 1, id: 1, title: "This is the second todo.", completed: false),
  Todo(userId: 1, id: 1, title: "This is the third todo.", completed: false),
  Todo(userId: 1, id: 1, title: "This is the fourth todo.", completed: false),
  Todo(userId: 1, id: 1, title: "This is the fiveth todo.", completed: false),
];

void main() {
  GetToDosList usecase;
  MockToDoRepository mockToDoRepository;

  setUp(() {
    mockToDoRepository = MockToDoRepository();
    usecase = GetToDosList(repository: mockToDoRepository);
  });

  test("should get the list of todos from the repository", () async {
    when(mockToDoRepository.getToDosList())
        .thenAnswer((realInvocation) async => Right(tTodosList));

    final result = await usecase(NoParams());

    expect(result, Right(tTodosList));
    verify(mockToDoRepository.getToDosList());
    verifyNoMoreInteractions(mockToDoRepository);
  });
}
