import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_button.dart';
import '../../cubits/goals_cubit/goals_cubit.dart';
import '../../cubits/goals_cubit/goals_state.dart';
import '../../models/goal_model.dart';

class AddGoalScreen extends StatefulWidget {
  const AddGoalScreen({super.key});

  @override
  State<AddGoalScreen> createState() => _AddGoalScreenState();
}

class _AddGoalScreenState extends State<AddGoalScreen> {
  final titleController = TextEditingController();
  final targetAmountController = TextEditingController();
  final savedAmountController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    targetAmountController.dispose();
    savedAmountController.dispose();
    super.dispose();
  }

  void _addGoal(BuildContext context) {
    final title = titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("من فضلك أدخل عنوان الهدف")),
      );
      return;
    }

    final target = double.tryParse(targetAmountController.text.trim()) ?? 0;
    final saved = double.tryParse(savedAmountController.text.trim()) ?? 0;

    final goal = GoalModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      targetAmount: target,
      savedAmount: saved,
      progress: (target > 0) ? (saved / target) : 0,
    );

    context.read<GoalsCubit>().addGoal(goal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إضافة هدف")),
      body: BlocConsumer<GoalsCubit, GoalsState>(
        listener: (context, state) {
          if (state is GoalsSuccess) {
            Navigator.pop(context, true);
          } else if (state is GoalsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Icon(Icons.flag,
                    color: Theme.of(context).colorScheme.primary, size: 80),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: titleController,
                  hintText: "عنوان الهدف",
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: targetAmountController,
                  hintText: "المبلغ المستهدف",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: savedAmountController,
                  hintText: "المبلغ المُدَّخر",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 30),
                state is GoalsLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                  text: "إضافة",
                  onPressed: () => _addGoal(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}