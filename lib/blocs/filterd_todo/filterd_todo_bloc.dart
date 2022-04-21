import 'package:todo_bloc_listener/blocs/filterd_todo/filterd_todo_state.dart';
import '../../models/todo_model.dart';
import 'filterd_todo_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterdTodosBloc extends Bloc<FilterdTodoEvent, FilterdTodoState> {
  final List<Todo> initialTodos;

  FilterdTodosBloc({required this.initialTodos})
      : super(FilterdTodoState(filterdTodoList: initialTodos)) {
    on<CalculateFilteredTodosEvent>(((event, emit) {
      emit(state.copyWith(filterdTodoList: event.filterdTodos));
    }));
  }
}
