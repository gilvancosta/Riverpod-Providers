import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/helpers/random_generator.dart';

import 'package:uuid/uuid.dart';
import '../../../../domain/entities/todo.dart';

part 'todos_providers.g.dart';

const uuid = Uuid();

enum FilterType { all, completed, pending }

@Riverpod(keepAlive: true)
class TodoCurrentFilter extends _$TodoCurrentFilter {
  @override
  FilterType build() => FilterType.all;

  void updateFilter(FilterType filter) {
    state = filter;
  }

  void setCurrentFilter(FilterType filter) {
    state = filter;
  }
}

@Riverpod(keepAlive: true)
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    List<Todo> todosList = [];

    for (int i = 0; i < 10; i++) {
      final todo = Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: i % 2 == 0 ? DateTime.now() : null,
      );
      todosList.add(todo);
    }
    return todosList;
  }

  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        todo = todo.copyWith(completedAt: todo.done ? null : DateTime.now());
      }
      return todo;
    }).toList();
  }

  void createTodo(String description) {
    state = [
      ...state,
      Todo(id: uuid.v4(), description: description, completedAt: null)
    ];
  }
}

///  filteredTodos // SOLO LECTURA
@riverpod
List<Todo> filteredTodos(FilteredTodosRef ref) {
  final currentFilter = ref.watch(todoCurrentFilterProvider);
  final todos = ref.watch(todosProvider);

  switch (currentFilter) {
    case FilterType.all:
      return todos;

    case FilterType.completed:
      return todos.where((todo) => todo.done).toList();

    case FilterType.pending:
      return todos.where((todo) => !todo.done).toList();
  
  }
}
