import '../../models/expenseModel.dart';

abstract class ExpensesState {}

class ExpensesInitial extends ExpensesState {}

class ExpensesLoaded extends ExpensesState {
  final List<ExpenseModel> expenses;
  ExpensesLoaded(this.expenses);
}
