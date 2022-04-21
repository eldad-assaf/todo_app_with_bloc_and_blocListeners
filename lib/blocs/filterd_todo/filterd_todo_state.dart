import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

class FilterdTodoState extends Equatable {
  final List<Todo> filterdTodoList;
  FilterdTodoState({
    required this.filterdTodoList,
  });

  @override
  List<Object> get props => [filterdTodoList];

  @override
  String toString() => 'FilterdTodoState(filterdTodoList: $filterdTodoList)';

  FilterdTodoState copyWith({
    List<Todo>? filterdTodoList,
  }) {
    return FilterdTodoState(
      filterdTodoList: filterdTodoList ?? this.filterdTodoList,
    );
  }
}
