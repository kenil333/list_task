import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_provider.dart';
import 'list_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Provide the ListProvider to the entire app using ChangeNotifierProvider.
      // This enables us to access the ListProvider's state in any widget below this provider in the widget tree.
      create: (context) => ListProvider(),
      child: MaterialApp(
        title: 'List Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("List View"),
          ),
          body: const ListWidget(),
        ),
      ),
    );
  }
}
