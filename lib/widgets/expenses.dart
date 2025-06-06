import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
      title: 'Flutter course',
      amount: 3889,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Movie date',
      amount: 5018,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _addExpenses(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expense Deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            _addExpenses(expense);
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(addExpense: _addExpenses),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Widget mainContent = Center(
      child: Text(
        'No Expenses Found!!',
        style: TextStyle(
          fontSize: 28,
          color: Colors.indigo[100],
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expense Tracker'),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [
                    colorScheme.surfaceContainer,
                    colorScheme.primary.withAlpha((0.4 * 255).round()),
                    colorScheme.secondary.withAlpha((0.3 * 255).round()),
                  ]
                : [
                    colorScheme.surface,
                    colorScheme.secondary.withAlpha((0.3 * 255).round()),
                    colorScheme.primary.withAlpha((0.2 * 255).round()),
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: width < 600
            ? Column(
                children: [
                  Chart(expenses: _registerExpenses),
                  Expanded(
                    child: _registerExpenses.isNotEmpty
                        ? ExpensesList(
                            expenses: _registerExpenses,
                            removeExpense: _removeExpense,
                          )
                        : mainContent,
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _registerExpenses)),

                  Expanded(
                    child: _registerExpenses.isNotEmpty
                        ? ExpensesList(
                            expenses: _registerExpenses,
                            removeExpense: _removeExpense,
                          )
                        : mainContent,
                  ),
                ],
              ),
      ),
    );
  }
}
