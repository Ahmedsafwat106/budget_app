import '../../models/budget_model.dart';

abstract class BudgetState {}

class BudgetInitial extends BudgetState {}

class BudgetLoaded extends BudgetState {
  final List<BudgetModel> budgets;
  BudgetLoaded(this.budgets);
}
