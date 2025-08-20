import '../../models/goal_model.dart';

abstract class GoalsState {}

class GoalsInitial extends GoalsState {}

class GoalsLoading extends GoalsState {}

class GoalsSuccess extends GoalsState {
  final List<GoalModel> goals;
  GoalsSuccess(this.goals);
}

class GoalsError extends GoalsState {
  final String message;
  GoalsError(this.message);
}
