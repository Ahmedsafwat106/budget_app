import 'package:budget_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'budget_screen.dart';
import 'expenses_screen.dart';
import 'goals_screen.dart';
import 'overview_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selected = 0;

  final pages = const [
    OverviewScreen(),
    ExpensesScreen(),
    BudgetScreen(),
    GoalsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(
          "Monthly Budget",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.yellow[700],
          ),
        ),
        centerTitle: true,
      ),

      body: pages[_selected],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: theme.appBarTheme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            currentIndex: _selected,
            onTap: (i) => setState(() => _selected = i),
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.yellow[700],
            unselectedItemColor: Colors.white70,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Overview"),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: "Expenses"),
              BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "Budgets"),
              BottomNavigationBarItem(icon: Icon(Icons.flag), label: "Goals"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[700],
        elevation: 6,
        child: const Icon(Icons.add, color: Colors.black),
        onPressed: () {
          if (_selected == 1) {
            Navigator.pushNamed(context, '/add_expense');
          } else if (_selected == 2) {
            Navigator.pushNamed(context, '/add_budget');
          } else if (_selected == 3) {
            Navigator.pushNamed(context, '/add_goal');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
