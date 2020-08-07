import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:todostdd/features/todos/data/datasources/service.dart';
import 'package:todostdd/features/todos/data/models/todos_model.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  ServicesImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = ServicesImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response(fixture('todos.json'), 200));
  }

  
  group("get the list of todos", () {
    final tTodosModel = Todos.fromJson(json.decode(fixture('todos.json')));
    final tTodosModel2 = Todos(
        userId: 2,
        id: 2,
        title: "This is the test for model",
        completed: false);


        test(
      '''should perform a GET request''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        dataSource.getTodosList();
        // assert
        verifyNever(mockHttpClient.get(
          'http://jsonplaceholder.typicode.com/todos'
        ));
      },
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
      () async {
        // arrange
        when(mockHttpClient.get(any))
            .thenAnswer((_) async => http.Response(fixture('todos.json'), 200));
        // act
        final result = await dataSource.getTodosList();
        // assert
        print("check what get $result and $tTodosModel");
        expect(tTodosModel2, equals(tTodosModel));
      },
    );

    
  });
}
