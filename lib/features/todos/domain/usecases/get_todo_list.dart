import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/todo_entity.dart';
import '../repository/todo_repository.dart';

class GetToDosList implements UseCase<List<Todo>, NoParams> {
  final ToDoRepository repository;
  GetToDosList({this.repository});

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) async {
    print("call the usecase : $repository");
    return await repository.getToDosList();
  }
}
