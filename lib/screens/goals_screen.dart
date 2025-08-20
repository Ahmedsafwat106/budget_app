import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/goals_cubit/goals_cubit.dart';
import '../../cubits/goals_cubit/goals_state.dart';
import 'add_goal_screen..dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الأهداف")),
      body: BlocBuilder<GoalsCubit, GoalsState>(
        builder: (context, state) {
          if (state is GoalsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GoalsSuccess) {
            if (state.goals.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.flag_outlined,
                      size: 90,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.3)),
                  const SizedBox(height: 12),
                  const Text("لا توجد أهداف بعد",
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.goals.length,
              itemBuilder: (context, index) {
                final goal = state.goals[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                      child: Icon(Icons.flag,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    title: Text(goal.title,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "ادخرت ${goal.savedAmount} من ${goal.targetAmount}"),
                        const SizedBox(height: 6),
                        LinearProgressIndicator(
                          value: goal.progress,
                          backgroundColor: Colors.grey[200],
                          color: Theme.of(context).colorScheme.primary,
                          minHeight: 6,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ],
                    ),
                    trailing: Text(
                      "${(goal.progress * 100).toStringAsFixed(1)}%",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                );
              },
            );
          } else if (state is GoalsError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () async {
          final added = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddGoalScreen()),
          );
          if (added == true) {
            context.read<GoalsCubit>().loadGoals();
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}