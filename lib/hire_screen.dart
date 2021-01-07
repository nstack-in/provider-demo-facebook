import 'package:demo_app/hire_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HirePeopleScreen extends StatefulWidget {
  @override
  _HirePeopleScreenState createState() => _HirePeopleScreenState();
}

class _HirePeopleScreenState extends State<HirePeopleScreen> {
  HireProvider hireProvider;

  @override
  Widget build(BuildContext context) {
    hireProvider = Provider.of<HireProvider>(context);
    List<Map> users = hireProvider.users;
    return Scaffold(
      appBar: AppBar(
        title: Text('Selcted People'),
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
    );
  }

  void togglePeople(Map user) {
    hireProvider.removePeople(user);
    print("hireProvider.users");
    print(hireProvider.users);
  }
}
