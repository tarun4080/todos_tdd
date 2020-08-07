import 'package:flutter/material.dart';
import 'features/todos/presentation/pages/home_screen.dart';
import 'injection_container.dart' as di;


void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
    
  }
}

