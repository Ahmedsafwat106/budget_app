import 'package:flutter/material.dart';
import '../../models/budget_model.dart';

class BudgetDetailsScreen extends StatelessWidget {
  final BudgetModel budget;
  const BudgetDetailsScreen({super.key, required this.budget});

  @override
  Widget build(BuildContext context) {
    double progress = (budget.spent / budget.limit).clamp(0, 1);

    return Scaffold(
      appBar: AppBar(title: Text(budget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("الحد الأقصى: ${budget.limit} ج.م",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Text("المصروف: ${budget.spent} ج.م",
                        style: TextStyle(
                          fontSize: 16,
                          color: budget.spent > budget.limit
                              ? Colors.red
                              : Colors.green,
                        )),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: progress,
                      color: progress > 0.8 ? Colors.red : Colors.green,
                      backgroundColor: Colors.grey[300],
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "الفترة: ${budget.startDate.toString().substring(0, 10)} → ${budget.endDate.toString().substring(0, 10)}",
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // تعديل الميزانية ممكن يتضاف هنا
                },
                icon: const Icon(Icons.edit),
                label: const Text("تعديل"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
