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
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [];

  // void triggerAddNewTransaction(BuildContext ctx){
  //   showModalBottomSheet(context: ctx, builder: (_){
  //     return InputField(addNewTransactionElement: )
  //   })
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Flutter App'),
          actions: <Widget>[
            IconButton(onPressed: () => {}, icon: Icon(Icons.add))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {},
        ),
        body: const UserTransactions());
  }
}
