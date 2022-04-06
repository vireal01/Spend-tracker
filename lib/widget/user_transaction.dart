import 'package:first_flutter_app/widget/input_field.dart';
import 'package:first_flutter_app/widget/transactions_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Card(
            color: Colors.amber,
            child: Text('Chart'),
            elevation: 10,
          ),
        ),
        // InputField(
        //   addNewTransactionElement: _addNewTransactionElement,
        // ),
      ],
    );
  }
}
