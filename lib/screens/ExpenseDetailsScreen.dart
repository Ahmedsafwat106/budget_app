import 'package:flutter/material.dart';
import '../../models/expenseModel.dart';

class ExpenseDetailsScreen extends StatelessWidget {
  final ExpenseModel expense;
  const ExpenseDetailsScreen({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(expense.title),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetail("الوصف", expense.description.isNotEmpty ? expense.description : "لا يوجد وصف"),
                  _buildDetail("المبلغ", "${expense.amount} ج.م"),
                  _buildDetail("الفئة", expense.category),
                  _buildDetail("التاريخ", expense.date.toString().substring(0, 10)),
                ]),
          ),
        ),
      ),
    );
  }

  Widget _buildDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
