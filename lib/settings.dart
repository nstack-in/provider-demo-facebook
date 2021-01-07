import 'package:demo_app/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Toggle'),
          onPressed: () {
            ThemeProvider themeProvider = Provider.of<ThemeProvider>(
              context,
              listen: false,
            );
            themeProvider.toggleTheme();
          },
        ),
      ),
    );
  }
}
