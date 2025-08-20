import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/expenses_cubit/expenses_cubit.dart';
import '../../cubits/expenses_cubit/expenses_state.dart';
import '../../models/expenseModel.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("كل المصروفات"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: BlocBuilder<ExpensesCubit, ExpensesState>(
        builder: (context, state) {
          if (state is ExpensesLoaded) {
            final expenses = state.expenses;
            if (expenses.isEmpty) {
              return const Center(
                child: Text("لا توجد مصروفات بعد",
                    style: TextStyle(color: Colors.white70, fontSize: 16)),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final exp = expenses[index];
                return Card(
                  color: Colors.grey[900],
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(exp.title,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    subtitle: Text("الفئة: ${exp.category}",
                        style: const TextStyle(color: Colors.white70)),
                    trailing: Text("${exp.amount} ج.م",
                        style: const TextStyle(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold)),
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/expense_details',
                      arguments: exp,
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
              child: CircularProgressIndicator(color: Colors.greenAccent));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () async {
          final added = await Navigator.pushNamed(context, '/add_expense');
          if (added == true) {
            context.read<ExpensesCubit>().loadExpenses();
          }
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
