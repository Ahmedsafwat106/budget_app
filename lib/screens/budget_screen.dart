import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/BudgetCubit/budget_cubit.dart';
import '../cubits/BudgetCubit/budget_state.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("📊 الميزانيات")),
      body: BlocBuilder<BudgetCubit, BudgetState>(
        builder: (context, state) {
          if (state is BudgetLoaded) {
            final budgets = state.budgets;
            if (budgets.isEmpty) {
              return const Center(
                child: Text("لا توجد ميزانيات بعد 🙁",
                    style: TextStyle(fontSize: 16)),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: budgets.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final b = budgets[index];
                double progress = (b.spent / b.limit).clamp(0, 1);

                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: ListTile(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    title: Text(
                      b.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        Text("المصروف: ${b.spent} / ${b.limit} ج.م"),
                        const SizedBox(height: 6),
                        LinearProgressIndicator(
                          value: progress,
                          color: progress > 0.8 ? Colors.red : Colors.green,
                          backgroundColor: Colors.grey[300],
                          minHeight: 6,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/budget_details',
                      arguments: b,
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final added = await Navigator.pushNamed(context, '/add_budget');
          if (added == true) {
            context.read<BudgetCubit>().loadBudgets();
          }
        },
        label: const Text("إضافة"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
