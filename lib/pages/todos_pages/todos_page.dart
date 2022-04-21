import 'package:flutter/material.dart';
import 'package:todo_bloc_listener/pages/todos_pages/create_todo.dart';
import 'package:todo_bloc_listener/pages/todos_pages/search_and_filter_todo.dart';
import 'package:todo_bloc_listener/pages/todos_pages/todo_header.dart';
import 'package:todo_bloc_listener/pages/todos_pages/todos_list.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //SAFE AREA IS FOR PAGES WITHOUT APPBAR
      child: Scaffold(
        body: SingleChildScrollView(
          // SINGLESCHILDSCROLLVIEW IS FOR NOT OVERFLOWING WHEN THE SCREEN IS SMALLER THEN WIDGETS
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                TodoHeader(),
                CreateTodo(),
                SizedBox(
                  height: 20,
                ),
                SearchAndFilterTodo(),
                ShowTodos(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
