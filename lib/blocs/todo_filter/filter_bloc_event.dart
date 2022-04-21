part of 'filter_bloc_bloc.dart';

abstract class FilterBlocEvent extends Equatable {
  const FilterBlocEvent();

  @override
  List<Object> get props => [];
}

class ChangeFilterEvent extends FilterBlocEvent {
  final Filter newFilter;
  ChangeFilterEvent({
    required this.newFilter,
  });

  @override
  String toString() => 'ChangeFilterEvent(newFilter: $newFilter)';

  @override
  List<Object> get props => [newFilter];
}
