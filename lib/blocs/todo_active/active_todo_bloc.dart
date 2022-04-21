import 'package:flutter_bloc/flutter_bloc.dart';
import 'active_todo_event.dart';
import 'active_todo_state.dart';

class ActiveTodoCountBloc extends Bloc<ActiveTodoEvent, ActiveTodoCountState> {
  final int initialActiveTodoCount;

  ActiveTodoCountBloc({
    required this.initialActiveTodoCount,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    on<UpdateActiveTodoCountEvent>((event, emit) {
      emit(ActiveTodoCountState(activeTodoCount: event.newActiveTodoCount));
    });
  }
}
