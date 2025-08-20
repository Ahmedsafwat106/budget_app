import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../cubits/expenses_cubit/expenses_cubit.dart';
import '../../cubits/expenses_cubit/expenses_state.dart';
import '../cubits/BudgetCubit/budget_cubit.dart';


class OverviewCalculation extends StatelessWidget {
  const OverviewCalculation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesCubit, ExpensesState>(
      builder: (context, state) {
        double totalExpenses = 0;
        if (state is ExpensesLoaded) {
          totalExpenses =
              state.expenses.fold<double>(0.0, (sum, e) => sum + e.amount);
        }

        double budget = 5000;
        double percent = totalExpenses > 0 ? (totalExpenses / budget) : 0;

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text("Calculation"),
            backgroundColor: Colors.black,
            elevation: 0,
            centerTitle: true,
          ),
          body: Center(
            child: Card(
              color: Colors.grey[900],
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularPercentIndicator(
                      radius: 90.0,
                      lineWidth: 14.0,
                      percent: percent.clamp(0.0, 1.0),
                      center: Text(
                        "${(percent * 100).toStringAsFixed(0)}%",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      progressColor: percent < 0.7
                          ? Colors.green
                          : (percent < 1 ? Colors.orange : Colors.red),
                      backgroundColor: Colors.grey[800]!,
                      circularStrokeCap: CircularStrokeCap.round,
                      animation: true,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "إجمالي المصروفات: $totalExpenses ج.م",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "الميزانية: $budget ج.م",
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.yellow[700],
            onPressed: () async {
              final added = await Navigator.pushNamed(context, '/add_expense');
              if (added == true) {
                context.read<ExpensesCubit>().loadExpenses();
                context.read<BudgetCubit>().loadBudgets();
              }
            },
            child: const Icon(Icons.add, color: Colors.black),
          ),
        );
      },
    );
  }
}
