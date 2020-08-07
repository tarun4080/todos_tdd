import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'features/todos/data/datasources/service.dart';
import 'features/todos/data/repositories/todo_repository_impl.dart';
import 'features/todos/domain/repository/todo_repository.dart';
import 'features/todos/domain/usecases/get_todo_list.dart';


final sl = GetIt.instance;

Future<void> init() async {
 

  // Use cases
  sl.registerLazySingleton(() => GetToDosList(repository: sl()));

  // Repository
  sl.registerLazySingleton<ToDoRepository>(
    () => TodoRepositoryImpl(
      dataSource: sl(),
     ),
  );
// Data sources
  sl.registerLazySingleton<Services>(
    () => ServicesImpl(client: sl()),
  );
  sl.registerLazySingleton(() => http.Client());
}
