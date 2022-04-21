import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc_listener/blocs/todo_list/todo_list_state.dart';

import '../../models/todo_model.dart';

part 'todo_list_event.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState.initial()) {
    on<AddTodoEvent>(_addTodo);
    on<EditTodoEvent>(_editTodoEvent);
    on<ToggleTodoEvent>(_toggleTodo);
    on<RemoveTodoEvent>(_removeTodo);
  }

  _addTodo(AddTodoEvent event, Emitter<TodoListState> emit) {
    Todo newTodo = Todo(desc: event.newTodoDesc);
    final List<Todo> newTodos = [...state.todos, newTodo];
    emit(state.copyWith(todos: newTodos));
  }

  _editTodoEvent(EditTodoEvent event, Emitter<TodoListState> emit) {
    List<Todo> newTodos = state.todos.map((Todo todo) {
      if (todo.id == event.todoId) {
        return Todo(
            id: event.todoId, desc: event.newDesc, completed: todo.completed);
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodos));
  }

  _toggleTodo(ToggleTodoEvent event, Emitter<TodoListState> emit) {
    List<Todo> newTodos = state.todos.map((Todo todo) {
      if (todo.id == event.todoId) {
        return Todo(
            id: event.todoId, desc: todo.desc, completed: !todo.completed);
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodos));
  }

  _removeTodo(RemoveTodoEvent event, Emitter<TodoListState> emit) {
    state.todos.removeWhere((Todo todo) => todo.id == todo.id);
    emit(state.copyWith(todos: state.todos));
  }
}
