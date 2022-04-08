import 'dart:ui';

import 'package:first_flutter_app/models/transaction.dart';
import 'package:first_flutter_app/widget/user_transaction.dart';
import 'package:flutter/material.dart';
import 'widget/input_field.dart';
import 'models/transaction.dart';
import './widget/transactions_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spend Tracker',
      home: MyHomePage(),
      theme: ThemeData(
          fontFamily: 'Roboto',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                  fontSize: 18)),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.normal)),
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Colors.black,
              onPrimary: Colors.white,
              secondary: Colors.purple,
              onSecondary: Colors.yellow,
              error: Colors.red,
              onError: Colors.amber,
              background: Colors.green,
              onBackground: Colors.amberAccent,
              surface: Color.fromARGB(255, 78, 92, 104),
              onSurface: Colors.blueGrey)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 0,
      title: 'Food',
      amount: 10.0,
      date: DateTime(2022, 4, 4, 17),
    ),
    Transaction(
      id: 1,
      title: 'Restaurant',
      amount: 20.0,
      date: DateTime(2022, 3, 25, 17),
    ),
    Transaction(
      id: 2,
      title: 'Georgian Restaurant',
      amount: 40.0,
      date: DateTime(2022, 3, 2, 17),
    ),
    Transaction(
      id: 2,
      title: 'Bla bla',
      amount: 10.0,
      date: DateTime(2022, 3, 1, 17),
    ),
    Transaction(
      id: 2,
      title: 'Lol kekw',
      amount: 10.0,
      date: DateTime(2022, 3, 1, 17),
    ),
    Transaction(
      id: 2,
      title: 'Lelw Kok',
      amount: 10.0,
      date: DateTime(2022, 3, 1, 17),
    )
  ];

  void _addNewTransactionElement({
    required String title,
    required double amount,
  }) {
    setState(() {
      _userTransactions.add(Transaction(
          id: _userTransactions.length,
          title: title,
          amount: amount,
          date: DateTime.now()));
    });
  }

  void _triggerAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return InputField(
              addNewTransactionElement: _addNewTransactionElement);
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Spend Tracker',
            style: TextStyle(fontFamily: 'RubikMicrobe', fontSize: 30),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () => {_triggerAddNewTransaction(context)},
                icon: Icon(Icons.add))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {_triggerAddNewTransaction(context)},
        ),
        body: SizedBox(
            child: TransactionsList(
          userTransactions: _userTransactions,
        )));
  }
}
