import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_listener/models/todo_model.dart';

import 'blocs/filterd_todo/filterd_todo_bloc.dart';
import 'blocs/todo_active/active_todo_bloc.dart';
import 'blocs/todo_filter/filter_bloc_bloc.dart';
import 'blocs/todo_list/todo_list_bloc.dart';
import 'blocs/todo_search/todo_search_bloc.dart';
import 'pages/todos_pages/todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TodoFilterBloc>(
              create: (BuildContext context) => TodoFilterBloc()),
          BlocProvider<TodoSearchBloc>(
              create: (BuildContext context) => TodoSearchBloc()),
          BlocProvider<TodoListBloc>(
              create: (BuildContext context) => TodoListBloc()),
          BlocProvider<ActiveTodoCountBloc>(
              create: (BuildContext context) => ActiveTodoCountBloc(
                    initialActiveTodoCount: context
                        .read<TodoListBloc>()
                        .state
                        .todos
                        .where((Todo todo) => !todo.completed)
                        .toList()
                        .length,
                  )),
          BlocProvider<FilterdTodosBloc>(
              create: (BuildContext context) => FilterdTodosBloc(
                  initialTodos: context.read<TodoListBloc>().state.todos)),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const TodosPage(),
        ));
  }
}
