import 'package:equatable/equatable.dart';

class ActiveTodoEvent extends Equatable {
  const ActiveTodoEvent();

  @override
  List<Object> get props => [];
}

class UpdateActiveTodoCountEvent extends ActiveTodoEvent {
  final int newActiveTodoCount;
  UpdateActiveTodoCountEvent({
    required this.newActiveTodoCount,
  });

  @override
  List<Object> get props => [newActiveTodoCount];

  @override
  String toString() =>
      'UpdateActiveTodoCountEvent(newActiveTodoCount: $newActiveTodoCount)';
}
