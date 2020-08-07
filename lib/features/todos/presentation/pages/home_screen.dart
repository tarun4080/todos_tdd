import 'package:flutter/material.dart';
import '../../../../core/usecases/usecases.dart';
import '../../data/datasources/service.dart';
import '../../data/models/todos_model.dart';
import '../../domain/usecases/get_todo_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todos> _todos;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    ServicesImpl().getTodosList().then((users) {
      setState(() {
        _todos = users;
        _loading = false;
      });
    });

    GetToDosList().call(NoParams()).then((value) {
      print("value of getting data $value");
    }).catchError((e) {
      print("got a error $e");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: _loading ? Center(child:CircularProgressIndicator()):Container(
        child: ListView.builder(
            itemCount: null == _todos ? 0 : _todos.length,
            itemBuilder: (context, index) {
              Todos todos = _todos[index];
              return ListTile(
                title: Text(todos.title),
                subtitle: Text("${todos.completed}"),
              );
            }),
      ),
    );
  }
}
