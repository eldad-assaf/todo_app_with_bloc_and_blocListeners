import 'package:equatable/equatable.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;
  TodoSearchState({
    required this.searchTerm,
  });

  factory TodoSearchState.initial() {
    return TodoSearchState(searchTerm: '');
  }

  @override
  List<Object> get props => [searchTerm];

  @override
  String toString() => 'TodoSearchState(searchTerm: $searchTerm)';

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
