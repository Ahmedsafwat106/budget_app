import 'package:flutter/material.dart';
import '../../models/expenseModel.dart';

class CategoryExpensesScreen extends StatelessWidget {
  final String categoryName;
  final List<ExpenseModel> expenses;
  const CategoryExpensesScreen(
      {super.key, required this.categoryName, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("مصروفات $categoryName")),
      body: expenses.isEmpty
          ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.receipt_long,
                size: 80,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.4)),
            const SizedBox(height: 12),
            const Text("لا توجد مصروفات مسجلة",
                style: TextStyle(color: Colors.grey, fontSize: 16)),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final exp = expenses[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .primary
                    .withOpacity(0.1),
                child: const Icon(Icons.attach_money, color: Colors.green),
              ),
              title: Text(exp.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              subtitle: Text(exp.description,
                  style: const TextStyle(color: Colors.grey)),
              trailing: Text(
                "${exp.amount} ج.م",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
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