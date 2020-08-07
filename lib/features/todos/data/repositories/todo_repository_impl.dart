import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/repository/todo_repository.dart';
import '../datasources/service.dart';

class TodoRepositoryImpl extends ToDoRepository {
  final Services dataSource;

  TodoRepositoryImpl({this.dataSource});

  @override
  Future<Either<Failure, List<Todo>>> getToDosList() async {
  print("Todo Repository implementation : $dataSource");

    try {
      final ddata = await dataSource.getTodosList();
      print("Todo Repository implementation : $ddata");
      return Right(ddata);
    } catch (e) {
      return Left(e);
    }
  }
}
