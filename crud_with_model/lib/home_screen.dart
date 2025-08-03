import 'package:crud_with_model/add_screen.dart';
import 'package:crud_with_model/home_provider.dart';
import 'package:crud_with_model/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD Model Screen"),
        backgroundColor: Colors.pink,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          return value.userData.isEmpty
              ? Center(child: Text("Please add task"))
              : ListView.builder(
                itemCount: value.userData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(value.userData[index].name),
                    subtitle: Text(value.userData[index].phone),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => UpdateScreen(
                                      index: index,
                                      name: value.userData[index].name,
                                      phone: value.userData[index].phone,
                                    ),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            value.deleteData(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
