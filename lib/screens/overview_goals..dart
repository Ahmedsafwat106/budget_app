import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/goals_cubit/goals_cubit.dart';
import '../../cubits/goals_cubit/goals_state.dart';
import '../../models/goal_model.dart';

class OverviewGoals extends StatelessWidget {
  const OverviewGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Goals"),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<GoalsCubit, GoalsState>(
        builder: (context, state) {
          if (state is GoalsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GoalsError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          }

          if (state is GoalsSuccess) {
            if (state.goals.isEmpty) {
              return const Center(
                child: Text(
                  "لا يوجد أهداف بعد",
                  style: TextStyle(color: Colors.white70),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.goals.length,
              itemBuilder: (context, index) {
                GoalModel goal = state.goals[index];
                double percent =
                (goal.savedAmount / goal.targetAmount).clamp(0.0, 1.0);

                return Card(
                  color: Colors.grey[900],
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: CircularProgressIndicator(
                      value: percent,
                      color: Colors.yellow[700],
                      backgroundColor: Colors.grey[800],
                    ),
                    title: Text(
                      goal.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "${goal.savedAmount} / ${goal.targetAmount} ج.م",
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: Text(
              "اضغط على زر الإضافة لإضافة هدف جديد",
              style: TextStyle(color: Colors.white70),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[700],
        onPressed: () async {
          final added = await Navigator.pushNamed(context, '/add_goal');
          if (added == true) {
            context.read<GoalsCubit>().loadGoals();
          }
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
