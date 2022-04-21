import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_listener/blocs/blocs.dart';
import 'package:todo_bloc_listener/blocs/todo_active/active_todo_bloc.dart';
import 'package:todo_bloc_listener/blocs/todo_active/active_todo_event.dart';
import 'package:todo_bloc_listener/blocs/todo_list/todo_list_state.dart';
import 'package:todo_bloc_listener/models/todo_model.dart';

import '../../blocs/todo_active/active_todo_state.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'TODO',
          style: TextStyle(fontSize: 40),
        ),
        BlocListener<TodoListBloc, TodoListState>(
          listener: (context, state) {
//invokes each time the todo list chnage
            final int activeTodoCount = state.todos
                .where((Todo todo) => !todo.completed)
                .toList()
                .length;
            context.read<ActiveTodoCountBloc>().add(UpdateActiveTodoCountEvent(
                newActiveTodoCount: activeTodoCount));
          },
          child: BlocBuilder<ActiveTodoCountBloc, ActiveTodoCountState>(
            builder: (context, state) {
              if (state.activeTodoCount == 0) {
                return Text(
                  '${state.activeTodoCount} items left',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                );
              } else {
                return Text(
                  '${state.activeTodoCount} items left',
                  style: TextStyle(fontSize: 20, color: Colors.redAccent),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
