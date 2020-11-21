import 'package:flutter/material.dart';
import 'package:jovenes_creativos_final/Widgets/todo_widgets.dart';
import 'package:jovenes_creativos_final/models/todo.dart';
import 'models/todo.dart';

class Iniciopage extends StatefulWidget {
  @override
  _IniciopageState createState() => _IniciopageState();
}

class _IniciopageState extends State<Iniciopage> {
  Widget _buildEmailLTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
          style: TextStyle(),
        ),
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(color: Colors.black),
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: "OpenSans"),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.email, color: Colors.white),
              hintText: "Entra tu email",
              hintStyle: TextStyle(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordLTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Contraseña",
          style: TextStyle(),
        ),
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(color: Colors.black),
          height: 60.0,
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: "OpenSans"),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.vpn_key_rounded, color: Colors.white),
              hintText: "Entra tu contraseña",
              hintStyle: TextStyle(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBTN() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.black,
        child: Text(
          "Entrar",
          style: TextStyle(
            color: Colors.orange,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: "OpenSans",
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.orange,
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Inicia sesion",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "OpenSans",
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  _buildEmailLTF(),
                  SizedBox(height: 30.0),
                  _buildPasswordLTF(),
                  _buildLoginBTN(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Aplicacion creada por Luisa Maria Ospina",
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Todo> _listTodo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Notas"),
      ),
      body: ListView.builder(
          itemCount: _listTodo.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoItems(
              todoItems: _listTodo[index],
              onDelete: () {
                _confirmDelete(index);
              },
              onEdit: () {
                _edittodo(index, _listTodo[index]);
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AddTodoPage()))
              .then((todoItems) {
            if (todoItems != null) {
              setState(() {
                _listTodo.add(todoItems);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _confirmDelete(int index) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Borrar",
                style: TextStyle(color: Colors.black),
              ),
              content: Text(
                "¿Estas seguro de eliminar esto?",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white70,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _deleteTodo(index);
                  },
                  child: Text(
                    "Aceptar",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ));
  }

  void _deleteTodo(int index) {
    setState(() {
      _listTodo.removeAt(index);
    });
  }

  void _edittodo(int index, Todo todo) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => AddTodoPage(
                  todo: todo,
                ))).then((todoItems) {
      if (todoItems != null) {
        setState(() {
          _listTodo[index] = todoItems;
        });
      }
    });
  }
}

class AddTodoPage extends StatefulWidget {
  final Todo todo;

  const AddTodoPage({Key key, this.todo}) : super(key: key);

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _subtitleController = TextEditingController();
  String _titleerror;
  String _subtitleerror;

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _titleController.text = widget.todo.title;
      _subtitleController.text = widget.todo.subtitle;
    }
  }

  @override
  void dispose() {
    _titleController.clear();
    _subtitleController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nueva nota"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                errorText: _titleerror,
                labelText: "Titulo",
                hintStyle: TextStyle(
                  fontSize: 40.0,
                  color: Colors.orange,
                ),
              ),
              controller: _titleController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  errorText: _subtitleerror,
                  labelText: "Nota",
                  hintStyle: TextStyle(
                    fontSize: 40.0,
                    color: Colors.orange,
                  ),
                ),
                controller: _subtitleController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: RaisedButton(
                color: Colors.orange,
                onPressed: () {
                  _addTododos();
                },
                child: Text(
                  "Guardar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void _addTododos() {
    var todo =
        Todo(title: _titleController.text, subtitle: _subtitleController.text);
    Navigator.of(context).pop(todo);
  }
}


