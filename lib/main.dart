import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/stopwatch_viewmodel.dart';
import 'views/stopwatch_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StopwatchViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: StopwatchScreen(),
      ),
    );
  }
}
