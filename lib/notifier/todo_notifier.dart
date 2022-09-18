import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/todo.dart';



final todoListProvider = StateNotifierProvider((ref) => TodoListNotifier([]));

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier([List<Todo>? initialState]) : super(initialState ?? []);

  void addTodo(String description) {
    print(description);
    state = [...state, Todo(description: description)];
  }

  void editTodo(String id, String description) {
    state = [
      for (final todo in state)
        if (todo.id == id) Todo(id: id, description: description) else todo
    ];
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}
