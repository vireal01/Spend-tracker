import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final Function addNewTransactionElement;
  InputField({required this.addNewTransactionElement});

  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountInput = TextEditingController();

    void submitTransaction() {
      if (titleController.text == '' || double.parse(amountInput.text) <= 0) {
        FocusManager.instance.primaryFocus?.unfocus();
        return;
      }
      addNewTransactionElement(
          title: titleController.text, amount: double.parse(amountInput.text));
      titleController.clear();
      amountInput.clear();
      FocusManager.instance.primaryFocus?.unfocus();
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
