import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_listener/blocs/todo_filter/filter_bloc_bloc.dart';
import 'package:todo_bloc_listener/blocs/todo_search/todo_search_bloc.dart';
import 'package:todo_bloc_listener/models/todo_model.dart';

class SearchAndFilterTodo extends StatelessWidget {
  // final Debounce debounce = Debounce();
  SearchAndFilterTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Search Todos...',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String? searchTerm) {
            if (searchTerm != null) {
              context
                  .read<TodoSearchBloc>()
                  .add(SetSearchTermEvent(newSearchTerm: searchTerm));
            }
          }, //setSearchTerm
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(filter: Filter.all, context: context),
            filterButton(filter: Filter.active, context: context),
            filterButton(filter: Filter.completed, context: context),
          ],
        )
      ],
    );
  }

  Widget filterButton({required Filter filter, required BuildContext context}) {
    return TextButton(
      onPressed: () {
        context
            .read<TodoFilterBloc>()
            .add(ChangeFilterEvent(newFilter: filter));
      },
      child: Text(
        filter == Filter.all
            ? 'All'
            : filter == Filter.active
                ? 'Active'
                : filter == Filter.completed
                    ? 'completed'
                    : '',
        style: TextStyle(fontSize: 18.0, color: setColor(context, filter)),
      ),
    );
  }

  Color setColor(BuildContext context, Filter filter) {
    final Filter selectedFilter = context.watch<TodoFilterBloc>().state.filter;
    return selectedFilter == filter ? Colors.blue : Colors.grey;
  }
}
