import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/todo_entity.dart';

abstract class ToDoRepository {
 Future<Either<Failure,List<Todo>>> getToDosList();
}
