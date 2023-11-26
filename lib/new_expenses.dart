import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _textConroller = TextEditingController();
  final _amoundConroller = TextEditingController();
  DateTime? _picketDate;
  Gategory _pickerGatogory = Gategory.leisur;

  void datePicker() async {
    final initel = DateTime.now();
    final firtDate = DateTime(initel.year - 1, initel.month, initel.day);
    final awaitpicket = await showDatePicker(
        context: context,
        initialDate: initel,
        firstDate: firtDate,
        lastDate: initel);

    setState(() {
      _picketDate = awaitpicket;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textConroller.dispose();
    _amoundConroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: _textConroller,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amoundConroller,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amound'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_picketDate == null
                        ? 'No Date Selected'
                        : format.format(_picketDate!)),
                    IconButton(
                      onPressed: datePicker,
                      icon: const Icon(Icons.calendar_month_sharp),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                value: _pickerGatogory,
                items: Gategory.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _pickerGatogory = value;
                  });
                  print(value);
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cansel'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_textConroller.text);
                  print(_amoundConroller.text);
                },
                child: const Text('Save Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
