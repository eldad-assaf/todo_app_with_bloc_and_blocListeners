import 'package:equatable/equatable.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;
  //final int initialActiveTodoCount
  ActiveTodoCountState({
    required this.activeTodoCount,
  });

  // factory ActiveTodoCountState.initial() {
  //   return ActiveTodoCountState(activeTodoCount: 0);
  // }

  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }

  @override
  List<Object> get props => [activeTodoCount];

  @override
  String toString() => 'ActiveTodoState(activeTodoCount: $activeTodoCount)';
}
