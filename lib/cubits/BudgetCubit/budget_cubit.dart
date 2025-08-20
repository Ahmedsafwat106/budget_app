import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/budget_model.dart';
import 'budget_state.dart';

class BudgetCubit extends Cubit<BudgetState> {
  BudgetCubit() : super(BudgetInitial());

  final List<BudgetModel> _budgets = [];

  void addBudget(BudgetModel budget) {
    _budgets.add(budget);
    emit(BudgetLoaded(List<BudgetModel>.from(_budgets)));
  }

  void loadBudgets() {
    if (_budgets.isEmpty) {
      emit(BudgetInitial());
    } else {
      emit(BudgetLoaded(List<BudgetModel>.from(_budgets)));
    }
  }

  void removeBudget(String id) {
    _budgets.removeWhere((b) => b.id == id);
    emit(BudgetLoaded(List<BudgetModel>.from(_budgets)));
  }

  void clearBudgets() {
    _budgets.clear();
    emit(BudgetInitial());
  }
}
