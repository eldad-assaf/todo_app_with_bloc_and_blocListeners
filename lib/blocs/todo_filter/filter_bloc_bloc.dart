import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc_listener/blocs/todo_filter/filter_bloc_state.dart';
import 'package:todo_bloc_listener/models/todo_model.dart';

part 'filter_bloc_event.dart';

class TodoFilterBloc extends Bloc<FilterBlocEvent, TodoFilterState> {
  TodoFilterBloc() : super(TodoFilterState.initial()) {
    on<ChangeFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
  }
}
