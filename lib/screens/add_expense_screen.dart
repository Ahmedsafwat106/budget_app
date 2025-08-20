import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/expenseModel.dart';
import '../../widgets/custom_textfield.dart';
import '../../cubits/expenses_cubit/expenses_cubit.dart';

class AddExpenseScreen extends StatefulWidget {
  final String budgetId;
  const AddExpenseScreen({super.key, this.budgetId = ''});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final amountController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("إضافة مصروف"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomTextField(controller: titleController, hintText: "عنوان المصروف"),
            const SizedBox(height: 12),
            CustomTextField(controller: descController, hintText: "الوصف"),
            const SizedBox(height: 12),
            CustomTextField(
              controller: amountController,
              hintText: "المبلغ",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            CustomTextField(controller: categoryController, hintText: "الفئة"),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                if (titleController.text.trim().isEmpty ||
                    amountController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("من فضلك ادخل البيانات كاملة")),
                  );
                  return;
                }

                final expense = ExpenseModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: titleController.text.trim(),
                  description: descController.text.trim(),
                  amount: double.tryParse(amountController.text.trim()) ?? 0,
                  category: categoryController.text.trim(),
                  date: DateTime.now(),
                );

                context.read<ExpensesCubit>().addExpense(expense);
                Navigator.pop(context, true);
              },
              child: const Text("إضافة", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
