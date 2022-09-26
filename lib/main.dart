import 'package:flutter/material.dart';
import 'package:untitled/screens/note_details.dart';
import 'package:untitled/screens/note_list.dart';

void main()
{
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NoteKeeper",
      debugShowCheckedModeBanner: false,
      home: NoteList(),

    );
  }
}
