import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: deprecated_member_use
  List todos = List();
  var input = "";

  @override
  void initState() {
    super.initState();
    todos.add("Item 1");
    todos.add("Item 2");
    todos.add("Item 3");
    todos.add("Item 4");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TO-DO List"
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text("Add Todo List"),
              content: TextField(
                onChanged: (value){
                  input = value;
                },
              ),
              actions: [
                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: (){
                      setState(() {
                        todos.add(input);
                      });
                      Navigator.of(context).pop(context);
                    },
                    child: Text(
                      "Add"
                    )),
                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Close"
                    ))
              ],
            );
          });
        },
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, int index){
            return Dismissible(
              key: Key(todos[index]),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ListTile(
                  title: Text(
                    todos[index]
                  ),
                  trailing: IconButton(
                    icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                    ),
                    onPressed: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Apakah Anda Yakin Ingin Menghapus Data Ini"),
                          actions: [
                            FlatButton(
                                onPressed: (){
                                  setState(() {
                                    todos.removeAt(index);
                                  });
                                  Navigator.of(context).pop(context);
                                },
                                child: Text(
                                  "YA"
                                )
                            ),
                            FlatButton(
                                onPressed: (){
                                  Navigator.of(context).pop(context);
                                },
                                child: Text(
                                  "TIDAK"
                                )
                            )
                          ],
                        );
                      });
                    },
                  ),
                ),
              ),
            );
          })
    );
  }
}
