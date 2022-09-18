import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_riverpod/notifier/todo_notifier.dart';

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final todolist = ref.watch(todoListProvider) as List;
    print(todolist);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add TODO'),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              ref.read(todoListProvider.notifier).addTodo(controller.text);
            },
            label: const Text('Add')),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: controller,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0),
                    itemCount: todolist.length,
                    itemBuilder: (BuildContext context, int item) {
                      final todoItem = todolist[item];
                      return Card(
                        elevation: 4,
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        ref.read(todoListProvider.notifier).removeTodo(todoItem.id);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Text('${todoItem.description}')
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
