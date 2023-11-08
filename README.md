Sure, here is a GitHub README file for your Flutter todo app:

# Flutter Todo App

A simple and basic Flutter todo app showcasing the use of BLoC pattern.

## Features

* Add, edit, and remove todo items
* Filter todo items by completed status
* Search for todo items by description
* Display the number of active todo items

## Getting Started

1. Clone or download the repository.
2. Install the dependencies using `flutter pub get`.
3. Run the app using `flutter run`.

## Usage

* Add a todo item by tapping the "Add Todo" button.
* Edit a todo item by tapping on its description.
* Remove a todo item by tapping the "Delete" button.
* Toggle the completion status of a todo item by tapping the checkbox.
* Filter todo items by completed status using the toggle buttons.
* Search for todo items by typing in the search bar.
* Monitor the number of active todo items in the bottom right corner.

## Blocs

The app uses several BLoCs to manage the state and logic of the todo list.
* `FilterdTodosBloc`: Calculates the filtered list of todo items based on the current filter and search term.
* `ActiveTodoCountBloc`: Tracks the number of active (uncompleted) todo items.
* `TodoFilterBloc`: Handles changes to the filter selection.
* `TodoListBloc`: Handles CRUD operations on the todo list.
* `TodoSearchBloc`: Handles search operations on the todo list.

## Testing

The app includes unit tests for the BLoCs using the BlocTest library. To run the tests, run the following command in the project directory:

```bash
flutter test
```

## Contributing

Contributions are welcome! Please feel free to submit pull requests for bug fixes, new features, or improvements.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
