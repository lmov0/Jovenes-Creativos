import 'package:flutter/material.dart';
import 'package:jovenes_creativos_final/models/todo.dart';

class TodoItems extends StatelessWidget {
  final Todo todoItems;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  TodoItems({
    @required this.todoItems,
    @required this.onDelete,
    @required this.onEdit,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onEdit,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Card(
          color: Colors.white70,
          shadowColor: Colors.black,
          elevation: 5.0,
          child: ListTile(
            leading: CircleAvatar(
              child: Text(
                _getprimerasletrasdeltitulo(),
                style: TextStyle(
                  color: Colors.orange,
                  fontFamily: "OpenSans",
                  fontSize: 15.0,
                ),
              ),
              backgroundColor: Colors.white,
            ),
            trailing: IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete),
            ),
            title: Text(todoItems.title),
            subtitle: Text(todoItems.subtitle),
          ),
        ),
      ),
    );
  }

  String _getprimerasletrasdeltitulo() {
    return todoItems.title.substring(0, 2).toUpperCase();
  }
}
