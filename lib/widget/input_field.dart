import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final Function addNewTransactionElement;
  InputField({required this.addNewTransactionElement});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final titleController = TextEditingController();
  final amountInput = TextEditingController();
  Widget build(BuildContext context) {
    void submitTransaction() {
      if (titleController.text == '' || double.parse(amountInput.text) <= 0) {
        FocusManager.instance.primaryFocus?.unfocus();
        return;
      }
      widget.addNewTransactionElement(
          title: titleController.text, amount: double.parse(amountInput.text));
      titleController.clear();
      amountInput.clear();
      FocusManager.instance.primaryFocus?.unfocus();
      Navigator.of(context).pop();
    }

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Card(
          child: Column(
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Name of transaction',
                ),
                autocorrect: false,
              ),
              TextField(
                controller: amountInput,
                decoration: const InputDecoration(
                  hintText: 'Amount',
                ),
                autocorrect: false,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              TextButton(
                  onPressed: () => submitTransaction(),
                  child: const Text('Add transaction'))
            ],
          ),
        ));
  }
}
