import 'package:demo_app/data.dart';
import 'package:demo_app/hire_provider.dart';
import 'package:demo_app/hire_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> users = MyData.data;
  HireProvider hireProvider;

  @override
  Widget build(BuildContext context) {
    hireProvider = Provider.of<HireProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          Map user = users[index];
          return ListTile(
            onTap: () {
              togglePeople(user);
            },
            leading: CircleAvatar(
              child: Text('${user['name'][0]}'),
            ),
            title: Text('${user['name']}'),
            subtitle: Text('${user['email']}'),
          );
        },
        itemCount: users.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigate,
        child: Icon(Icons.people),
      ),
    );
  }

  void _navigate() {
    final builder = (_) => HirePeopleScreen();
    final route = MaterialPageRoute(builder: builder);
    Navigator.push(context, route);
  }

  void togglePeople(Map user) {
    hireProvider.addPeople(user);
    print("hireProvider.users");
    print(hireProvider.users);
  }
}
