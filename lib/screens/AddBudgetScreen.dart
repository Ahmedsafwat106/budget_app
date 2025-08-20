import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_button.dart';
import '../../models/budget_model.dart';
import '../../cubits/BudgetCubit/budget_cubit.dart';

class AddBudgetScreen extends StatefulWidget {
  const AddBudgetScreen({super.key});

  @override
  State<AddBudgetScreen> createState() => _AddBudgetScreenState();
}

class _AddBudgetScreenState extends State<AddBudgetScreen> {
  final nameController = TextEditingController();
  final limitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إضافة ميزانية")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: nameController, hintText: "اسم الميزانية"),
            const SizedBox(height: 15),
            CustomTextField(
              controller: limitController,
              hintText: "الحد الأقصى",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 25),
            CustomButton(
              text: "💾 حفظ الميزانية",
              onPressed: () {
                if (nameController.text.trim().isEmpty ||
                    limitController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("من فضلك ادخل البيانات كاملة")),
                  );
                  return;
                }

                final budget = BudgetModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: nameController.text.trim(),
                  limit: double.tryParse(limitController.text.trim()) ?? 0,
                  spent: 0,
                  startDate: DateTime.now(),
                  endDate: DateTime.now().add(const Duration(days: 30)),
                );

                context.read<BudgetCubit>().addBudget(budget);
                Navigator.pop(context, true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
