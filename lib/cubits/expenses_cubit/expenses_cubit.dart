import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/expenseModel.dart';
import 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial());

  final List<ExpenseModel> _expenses = [];

  void addExpense(ExpenseModel expense) {
    _expenses.add(expense);
    emit(ExpensesLoaded(List<ExpenseModel>.from(_expenses))); // نسخة جديدة
  }

  void loadExpenses() {
    if (_expenses.isEmpty) {
      emit(ExpensesInitial()); // لو مفيش بيانات نرجع initial
    } else {
      emit(ExpensesLoaded(List<ExpenseModel>.from(_expenses)));
    }
  }

  void removeExpense(String id) {
    _expenses.removeWhere((e) => e.id == id);
    emit(ExpensesLoaded(List<ExpenseModel>.from(_expenses)));
  }

  void clearExpenses() {
    _expenses.clear();
    emit(ExpensesInitial());
  }
}
