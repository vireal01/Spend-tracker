import 'dart:io';

import 'package:first_flutter_app/models/transaction.dart';
import 'package:first_flutter_app/widget/chart.dart';
import 'package:first_flutter_app/widget/settings.dart';
import 'package:first_flutter_app/widget/user_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widget/input_field.dart';
import 'models/transaction.dart';
import './widget/transactions_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spend Tracker',
      home: MyHomePage(),
      theme: ThemeData(
          fontFamily: 'Roboto',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                  fontSize: 18)),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.normal)),
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color.fromARGB(255, 51, 72, 56),
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
  List<Transaction> _userTransactions = [
    Transaction(
      id: 0,
      title: 'Food',
      amount: 10.0,
      date: DateTime(2022, 4, 10, 17),
    ),
    Transaction(
      id: 1,
      title: 'Restaurant',
      amount: 20.0,
      date: DateTime(2022, 4, 10, 17),
    ),
    Transaction(
      id: 2,
      title: 'Georgian Restaurant',
      amount: 40.0,
      date: DateTime(2022, 4, 11, 17),
    ),
    Transaction(
      id: 3,
      title: 'Bla bla',
      amount: 10.0,
      date: DateTime(2022, 4, 12, 17),
    ),
    Transaction(
      id: 4,
      title: 'Lol kekw',
      amount: 10.0,
      date: DateTime(2022, 4, 13, 17),
    ),
    Transaction(
      id: 5,
      title: 'Lelw Kok',
      amount: 10.0,
      date: DateTime(2022, 4, 15, 17),
    )
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where(
      (element) {
        return element.date.isAfter(DateTime.now().subtract(
          const Duration(days: 7),
        ));
      },
    ).toList();
  }

  var cardTheme = {'default': true, 'modern': false};

  void _addNewTransactionElement({
    required String title,
    required double amount,
    required DateTime date,
  }) {
    setState(() {
      _userTransactions.add(Transaction(
          id: _userTransactions.length,
          title: title,
          amount: amount,
          date: date));
    });
  }

  void changeTheme({
    required bool isDefault,
  }) {
    setState(() {
      if (isDefault) {
        cardTheme = {'default': true, 'modern': false};
      } else {
        cardTheme = {'default': false, 'modern': true};
      }
    });
  }

  bool _isChartDisplayed = false;

  void _triggerAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return InputField(
              addNewTransactionElement: _addNewTransactionElement);
        });
  }

  void _triggerSettings(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Settings(setTheme: changeTheme);
        });
  }

  void _deleteTransaction(transactionId) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == transactionId);
    });
  }

  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: const Text('Datasda'),
            trailing: Row(
              children: <Widget>[
                GestureDetector(
                  child: const Icon(CupertinoIcons.add),
                  onTap: () => _triggerAddNewTransaction(context),
                )
              ],
            ),
          )
        : AppBar(
            title: const Text(
              'Spend Tracker',
              style: TextStyle(fontFamily: 'RubikMicrobe', fontSize: 30),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () => {_triggerAddNewTransaction(context)},
                  icon: const Icon(Icons.add)),
              IconButton(
                  onPressed: () => {_triggerSettings(context)},
                  icon: const Icon(Icons.settings))
            ],
          ) as PreferredSizeWidget;
    Widget chartWidget(double heightMultiplier) {
      return SizedBox(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.vertical) *
            heightMultiplier,
        child: Chart(_recentTransactions),
      );
    }

    Widget transactionsListWidget(double heightMultiplier) {
      return SizedBox(
          height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.vertical) *
              heightMultiplier,
          child: TransactionsList(
              userTransactions: _userTransactions,
              listTheme: cardTheme,
              deleteTransaction: _deleteTransaction));
    }

    final pageBody = MediaQuery.of(context).orientation == Orientation.landscape
        ? Column(
            children: [
              Switch(
                  value: _isChartDisplayed,
                  onChanged: (val) => {
                        setState(() {
                          _isChartDisplayed = val;
                        })
                      }),
              _isChartDisplayed
                  ? chartWidget(0.8)
                  : transactionsListWidget(0.8),
            ],
          )
        : Column(
            children: [
              chartWidget(0.2),
              transactionsListWidget(0.8),
            ],
          );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar as ObstructingPreferredSizeWidget,
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: appBar,
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => {_triggerAddNewTransaction(context)},
            ),
            body: pageBody);
  }
}
