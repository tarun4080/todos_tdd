import 'package:http/http.dart' as http;
import '../models/todos_model.dart';

abstract class Services {
  Future<List<Todos>> getTodosList();
}

class ServicesImpl implements Services {
  final http.Client client;

  ServicesImpl({this.client});

  // static const String url = 'http://jsonplaceholder.typicode.com/todos';

  @override
  Future<List<Todos>> getTodosList() =>
   _data('http://jsonplaceholder.typicode.com/todos');
  

  Future<List<Todos>> _data(String url)async{
   print("Service datasource called");
     try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<Todos> users = todosFromJson(response.body);
       return users;
      } else {
        return List<Todos>();
      }
    } catch (e) {
      return List<Todos>();
    }
  }

  
}
