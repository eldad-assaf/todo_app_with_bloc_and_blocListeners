import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_bloc_listener/blocs/todo_search/todo_search_state.dart';
part 'todo_search_event.dart';

class TodoSearchBloc extends Bloc<TodoSearchEvent, TodoSearchState> {
  EventTransformer<T> debounce<T>(Duration duration) {
    return ((events, mapper) => events.debounceTime(duration).flatMap(mapper));
  }

  TodoSearchBloc() : super(TodoSearchState.initial()) {
    on<SetSearchTermEvent>(
      (event, emit) {
        emit(TodoSearchState(searchTerm: event.newSearchTerm));
      },
      transformer: debounce(Duration(milliseconds: 2000)),
    );
  }
}
