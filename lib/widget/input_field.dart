import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputField extends StatefulWidget {
  final Function addNewTransactionElement;
  InputField({required this.addNewTransactionElement});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final titleController = TextEditingController();
  final amountInput = TextEditingController();
  DateTime enteredDate = DateTime.now();
  DateTime _selectedText = DateTime.now();

  Widget build(BuildContext context) {
    void submitTransaction() {
      if (titleController.text == '' || double.parse(amountInput.text) <= 0) {
        FocusManager.instance.primaryFocus?.unfocus();
        return;
      }
      widget.addNewTransactionElement(
          title: titleController.text,
          amount: double.parse(amountInput.text),
          date: enteredDate);
      titleController.clear();
      amountInput.clear();
      FocusManager.instance.primaryFocus?.unfocus();
      Navigator.of(context).pop();
    }

    void _precentDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2027),
      ).then((value) => {
            enteredDate = value as DateTime,
            setState(() {
              _selectedText = enteredDate;
            })
          });
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
              Row(
                children: [
                  Expanded(
                    child: Text(
                      DateFormat.yMMMMd().format(_selectedText),
                    ),
                  ),
                  TextButton(
                    onPressed: (() => {_precentDatePicker()}),
                    child: const Text(
                      'Choose date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () => {
                        submitTransaction(),
                      },
                  child: const Text('Add transaction'))
            ],
          ),
        ));
  }
}
