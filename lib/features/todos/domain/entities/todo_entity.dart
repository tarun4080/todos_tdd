import 'package:equatable/equatable.dart';

class Todo extends Equatable{
 final  int userId;
 final int id;
 final String title;
 final bool completed;
  Todo({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

 

  @override
  List<Object> get props => [userId,id,title,completed];

}