import 'package:flutter/material.dart';

import 'package:exptrack/models/expense.dart';
import 'package:exptrack/widgets/expenses.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  String _presentPickedDate(DateTime dt) {
    String now = formatter2.format(DateTime.now());
    String date = formatter2.format(dt);
    String day = formatter3.format(dt);
    final difference = int.parse(now) - int.parse(date);

    if (difference <= 7) {
      if (difference < 2) {
        return difference == 1 ? 'yesterday' : 'today';
      } else {
        return day;
      }
    }
    return formatter.format(dt);
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountInvalid = enteredAmount == null || enteredAmount < 0;
    if (_titleController.text.trim().isEmpty ||
        amountInvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('invalid input'),
                content: const Text(
                    'Please make sure a valid title, amount, date and category was entered.'),
                actions: [
                  TextButton(
                    child: const Text('Okay'),
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                  )
                ],
              ));
      return;
    }
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        day: _presentPickedDate(_selectedDate!),
        category: _selectedCategory));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
        builder: (context, constraints) => SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                    padding:
                        EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
                    child: constraints.maxWidth >= 600
                        ? Column(children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _titleController,
                                    maxLength: 50,
                                    decoration: const InputDecoration(
                                        label: Text('title')),
                                  ),
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _amountController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        label: Text('amount')),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton(
                                    value: _selectedCategory,
                                    items: Category.values
                                        .map((category) => DropdownMenuItem(
                                            value: category,
                                            child: Text(
                                                category.name.toUpperCase())))
                                        .toList(),
                                    onChanged: (value) {
                                      if (value == null) {
                                        return;
                                      }

                                      setState(() {
                                        _selectedCategory = value;
                                      });
                                    }),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(_selectedDate == null
                                          ? 'no date selected'
                                          : _presentPickedDate(_selectedDate!)),
                                      IconButton(
                                        onPressed: _presentDatePicker,
                                        icon: const Icon(Icons.calendar_month),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 24,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: _submitExpenseData,
                                  child: const Text('Save Expense'),
                                ),
                              ],
                            )
                          ])
                        : Column(children: [
                            TextField(
                              controller: _titleController,
                              maxLength: 50,
                              decoration:
                                  const InputDecoration(label: Text('title')),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _amountController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        label: Text('amount')),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(_selectedDate == null
                                            ? 'no date selected'
                                            : _presentPickedDate(
                                                _selectedDate!)),
                                      ),
                                      IconButton(
                                        onPressed: _presentDatePicker,
                                        icon: const Icon(Icons.calendar_month),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton(
                                    value: _selectedCategory,
                                    items: Category.values
                                        .map((category) => DropdownMenuItem(
                                            value: category,
                                            child: Text(
                                                category.name.toUpperCase())))
                                        .toList(),
                                    onChanged: (value) {
                                      if (value == null) {
                                        return;
                                      }

                                      setState(() {
                                        _selectedCategory = value;
                                      });
                                    }),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: _submitExpenseData,
                                  child: const Text('Save Expense'),
                                ),
                              ],
                            )
                          ])),
              ),
            ));
  }
}
