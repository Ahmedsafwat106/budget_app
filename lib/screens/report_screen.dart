import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reports = [
      {"title": "إجمالي المصروفات", "value": "2500 ج.م", "icon": Icons.money_off},
      {"title": "إجمالي الميزانية", "value": "5000 ج.م", "icon": Icons.account_balance_wallet},
      {"title": "المتبقي", "value": "2500 ج.م", "icon": Icons.savings},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("التقارير")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                child: Icon(report["icon"] as IconData,
                    color: Theme.of(context).colorScheme.primary),
              ),
              title: Text(report["title"].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text(
                report["value"].toString(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}