import 'package:flutter/material.dart';
import 'overview_calculation.dart';
import 'overview_goals..dart';
import 'overview_options..dart';


class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    OverviewCalculation(),
    OverviewOptions(),
    OverviewGoals(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
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
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() => _currentIndex = index);
            },
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.yellow[700],
            unselectedItemColor: Colors.white54,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.pie_chart), label: "Calculation"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.subscriptions), label: "Options"),
              BottomNavigationBarItem(icon: Icon(Icons.flag), label: "Goals"),
            ],
          ),
        ),
      ),
    );
  }
}
