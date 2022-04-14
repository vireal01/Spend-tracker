import 'package:first_flutter_app/models/transaction.dart';
import 'package:first_flutter_app/widget/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Settings extends StatefulWidget {
  final Function setTheme;
  Settings({required this.setTheme});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Card theme:'),
          ListTile(
            leading: OutlinedButton(
              onPressed: () => {widget.setTheme(isDefault: true)},
              child: Text('Default'),
            ),
          ),
          ListTile(
            leading: OutlinedButton(
              onPressed: () => {widget.setTheme(isDefault: false)},
              child: Text('Modern'),
            ),
          ),
        ],
      ),
    );
  }
}
