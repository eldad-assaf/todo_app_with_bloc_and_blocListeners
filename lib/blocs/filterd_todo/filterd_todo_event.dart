import 'package:equatable/equatable.dart';
import 'package:todo_bloc_listener/models/todo_model.dart';

class FilterdTodoEvent extends Equatable {
  const FilterdTodoEvent();

  @override
  List<Object> get props => [];
}

class CalculateFilteredTodosEvent extends FilterdTodoEvent {
  final List<Todo> filterdTodos;
  CalculateFilteredTodosEvent({
    required this.filterdTodos,
  });
  @override
  List<Object> get props => [filterdTodos];

  @override
  String toString() => 'FilterTodoList(newFilter: $filterdTodos)';
}
