import 'package:flutter/material.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_button.dart';

class EditExpenseScreen extends StatefulWidget {
  final String id;
  final String title;
  final double amount;
  final String category;
  const EditExpenseScreen({
    super.key,
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
  });

  @override
  State<EditExpenseScreen> createState() => _EditExpenseScreenState();
}

class _EditExpenseScreenState extends State<EditExpenseScreen> {
  late TextEditingController titleController;
  late TextEditingController amountController;
  late TextEditingController categoryController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title);
    amountController =
        TextEditingController(text: widget.amount.toStringAsFixed(2));
    categoryController = TextEditingController(text: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("تعديل المصروف"), backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          CustomTextField(controller: titleController, hintText: "العنوان"),
          const SizedBox(height: 10),
          CustomTextField(controller: amountController, hintText: "المبلغ"),
          const SizedBox(height: 10),
          CustomTextField(controller: categoryController, hintText: "الفئة"),
          const SizedBox(height: 20),
          CustomButton(
            text: "حفظ التغييرات",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]),
      ),
    );
  }
}
