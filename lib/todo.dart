import 'package:flutter/material.dart';

class todoPage extends StatefulWidget {
  const todoPage({super.key});

  @override
  State<todoPage> createState() => _todoPageState();
}

List<String> todolist = ["cook"];

class _todoPageState extends State<todoPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController add = TextEditingController();

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "To Do",
                style: TextStyle(fontSize: 80),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: todolist.length,
                itemBuilder: (context, index) {
                  final task = todolist[index];
                  return Container(
                    padding: const EdgeInsets.all(20),
                    height: 80,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent.shade100,
                      borderRadius: BorderRadius.circular(35.0), // Adjust the radius as needed
                    ),
                    //color: Colors.amberAccent.shade100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          task,
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(onPressed: () {
                          setState(() {
                            todolist.removeAt(index);
                          });
                        }, icon: Icon(Icons.done))
                      ],
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 40,
                    width: 280,
                    child: TextField(
                      controller: add,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (add.text.isNotEmpty) {
                        setState(() {
                          todolist.add(add.text);
                          add.text = '';
                          //print(todolist);
                        });
                      }
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
