part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoListEvent {
  final String newTodoDesc;
  AddTodoEvent({
    required this.newTodoDesc,
  });
  @override
  List<Object> get props => [newTodoDesc];

  @override
  String toString() => 'AddTodoEvent(newTodoDesc: $newTodoDesc)';
}

class EditTodoEvent extends TodoListEvent {
  final String todoId;
  final String newDesc;
  EditTodoEvent({required this.todoId, required this.newDesc});
  @override
  List<Object> get props => [todoId, newDesc];

  @override
  String toString() => 'EditTodoEvent(todoId: $todoId, newDesc: $newDesc)';
}

class ToggleTodoEvent extends TodoListEvent {
  final String todoId;
  ToggleTodoEvent({
    required this.todoId,
  });

  @override
  List<Object> get props => [todoId];

  @override
  String toString() => 'ToggleTodoEvent(todoId: $todoId)';
}

class RemoveTodoEvent extends TodoListEvent {
  final Todo todo;
  RemoveTodoEvent({
    required this.todo,
  });
  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'RemoveTodo(todo: $todo)';
}
