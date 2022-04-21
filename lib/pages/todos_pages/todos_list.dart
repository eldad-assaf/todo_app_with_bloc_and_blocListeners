import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_listener/blocs/blocs.dart';
import 'package:todo_bloc_listener/blocs/todo_filter/filter_bloc_state.dart';
import 'package:todo_bloc_listener/blocs/todo_list/todo_list_state.dart';
import '../../blocs/filterd_todo/filterd_todo_bloc.dart';
import '../../blocs/filterd_todo/filterd_todo_event.dart';
import '../../blocs/todo_search/todo_search_state.dart';
import '../../models/todo_model.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilterdTodosBloc>().state.filterdTodoList;

    return MultiBlocListener(
        listeners: [
          BlocListener<TodoListBloc, TodoListState>(listener: (context, state) {
//when the list of todos changes //add//remove//edit
            final List<Todo> filterdTodoList = setFilteredTodos(
                todos: state.todos,
                filter: context.read<TodoFilterBloc>().state.filter,
                searchTerm: context.read<TodoSearchBloc>().state.searchTerm);
            context.read<FilterdTodosBloc>().add(
                CalculateFilteredTodosEvent(filterdTodos: filterdTodoList));
          }),
          BlocListener<TodoSearchBloc, TodoSearchState>(
              listener: (context, state) {
//when the list of todos changes //add//remove//edit
            final List<Todo> filterdTodoList = setFilteredTodos(
                todos: context.read<TodoListBloc>().state.todos,
                filter: context.read<TodoFilterBloc>().state.filter,
                searchTerm: state.searchTerm);
            context.read<FilterdTodosBloc>().add(
                CalculateFilteredTodosEvent(filterdTodos: filterdTodoList));
          }),
          BlocListener<TodoFilterBloc, TodoFilterState>(
              listener: (context, state) {
//when the list of todos changes //add//remove//edit
            final List<Todo> filterdTodoList = setFilteredTodos(
                todos: context.read<TodoListBloc>().state.todos,
                filter: state.filter,
                searchTerm: context.read<TodoSearchBloc>().state.searchTerm);
            context.read<FilterdTodosBloc>().add(
                CalculateFilteredTodosEvent(filterdTodos: filterdTodoList));
          }),
        ],
        child: ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: todos.length,
          separatorBuilder: (context, index) => Divider(color: Colors.grey),
          itemBuilder: (context, index) {
            final currentTodo = todos[index];
            return Dismissible(
              key: ValueKey(currentTodo.id),
              background: showBackground(0),
              secondaryBackground: showBackground(1),
              onDismissed: (_) {
                context
                    .read<TodoListBloc>()
                    .add(RemoveTodoEvent(todo: currentTodo));
              },
              confirmDismiss: (_) {
                return showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text('delete?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: Text('YES'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text('NO'),
                            )
                          ],
                        ));
              },
              child: TodoItem(todo: currentTodo),
            );
          },
        ));
  }

  Container showBackground(final int direction) {
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  List<Todo> setFilteredTodos(
      {required List<Todo> todos,
      required Filter filter,
      required String searchTerm}) {
    // needs : current list of todos , filter type , searchterm
    List<Todo> _filterdTodoList = [];
    //final Filter currentFilter = filterBloc.state.filter;
    switch (filter) {
      case Filter.active:
        _filterdTodoList = todos.where((Todo todo) => !todo.completed).toList();

        break;
      case Filter.completed:
        _filterdTodoList = todos.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        _filterdTodoList = todos;
        break;
    }

    if (searchTerm.isNotEmpty) {
      _filterdTodoList = todos
          .where((Todo todo) => todo.desc.toLowerCase().contains(searchTerm))
          .toList();
    }

    //at the end needs to emit a state with a list of todos
    //add(CalculateFilteredTodosEvent(filterdTodos: _filterdTodoList));
    return _filterdTodoList;
  }
}

class TodoItem extends StatefulWidget {
  final Todo todo;
  const TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            bool _error = false;
            textController.text = widget.todo.desc;

            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  title: Text('Edit Todo'),
                  content: TextField(
                    controller: textController,
                    autofocus: true,
                    decoration: InputDecoration(
                      errorText: _error ? "Value cannot be empty" : null,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('CANCEL'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _error = textController.text.isEmpty ? true : false;
                          if (!_error) {
                            context.read<TodoListBloc>().add(EditTodoEvent(
                                todoId: widget.todo.id,
                                newDesc: textController.text.trim()));
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: Text('EDIT'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      leading: Checkbox(
        value: widget.todo.completed,
        onChanged: (bool? checked) {
          context
              .read<TodoListBloc>()
              .add(ToggleTodoEvent(todoId: widget.todo.id));
        },
      ),
      title: Text(widget.todo.desc),
    );
  }
}
