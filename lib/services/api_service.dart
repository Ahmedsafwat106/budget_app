import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/expenseModel.dart';
import '../models/user_model.dart';
import '../models/budget_model.dart';
import '../models/category_model.dart';
import '../models/goal_model.dart';

class ApiService {
  static const String baseUrl = "https://api.example.com"; // حط لينك سيرفرك الحقيقي هنا

  // --------- كاش محلي بسيط للأوفلاين / وقت التطوير ---------
  static final List<GoalModel> _cacheGoals = [];
  static final List<ExpenseModel> _cacheExpenses = [];
  static final List<BudgetModel> _cacheBudgets = [];

  // Helper: يعتبر أي من الأكواد دي نجاح
  static bool _isOk(int code) => code == 200 || code == 201 || code == 204;

  // ---------- AUTH ----------
  static Future<UserModel?> login(String email, String password) async {
    try {
      final res = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {"Content-Type": "application/json", "Accept": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );
      if (_isOk(res.statusCode)) {
        return UserModel.fromJson(jsonDecode(res.body));
      }
    } catch (_) {}
    return null;
  }

  static Future<UserModel?> register(String name, String email, String password) async {
    try {
      final res = await http.post(
        Uri.parse("$baseUrl/register"),
        headers: {"Content-Type": "application/json", "Accept": "application/json"},
        body: jsonEncode({"name": name, "email": email, "password": password}),
      );
      if (_isOk(res.statusCode)) {
        return UserModel.fromJson(jsonDecode(res.body));
      }
    } catch (_) {}
    return null;
  }

  // ---------- BUDGET ----------
  static Future<List<BudgetModel>> getBudgets() async {
    try {
      final res = await http.get(Uri.parse("$baseUrl/budgets"), headers: {"Accept": "application/json"});
      if (_isOk(res.statusCode)) {
        final List data = jsonDecode(res.body);
        final list = data.map((e) => BudgetModel.fromJson(e)).toList();
        _cacheBudgets
          ..clear()
          ..addAll(list);
        return list;
      }
    } catch (_) {}
    return List<BudgetModel>.from(_cacheBudgets);
  }

  static Future<bool> addBudget(BudgetModel budget) async {
    try {
      final res = await http.post(
        Uri.parse("$baseUrl/budgets"),
        headers: {"Content-Type": "application/json", "Accept": "application/json"},
        body: jsonEncode(budget.toJson()),
      );
      if (_isOk(res.statusCode)) return true;
    } catch (_) {}
    // أوفلاين
    _cacheBudgets.add(budget);
    return true;
  }

  // ---------- CATEGORY ----------
  static Future<List<CategoryModel>> getCategories() async {
    try {
      final res = await http.get(Uri.parse("$baseUrl/categories"), headers: {"Accept": "application/json"});
      if (_isOk(res.statusCode)) {
        final List data = jsonDecode(res.body);
        return data.map((e) => CategoryModel.fromJson(e)).toList();
      }
    } catch (_) {}
    return [];
  }

  static Future<bool> addCategory(CategoryModel category) async {
    try {
      final res = await http.post(
        Uri.parse("$baseUrl/categories"),
        headers: {"Content-Type": "application/json", "Accept": "application/json"},
        body: jsonEncode(category.toJson()),
      );
      return _isOk(res.statusCode);
    } catch (_) {}
    return true; // سماح وقت التطوير
  }

  // ---------- EXPENSE ----------
  static Future<List<ExpenseModel>> getExpenses() async {
    try {
      final res = await http.get(Uri.parse("$baseUrl/expenses"), headers: {"Accept": "application/json"});
      if (_isOk(res.statusCode)) {
        final List data = jsonDecode(res.body);
        final list = data.map((e) => ExpenseModel.fromJson(e)).toList();
        _cacheExpenses
          ..clear()
          ..addAll(list);
        return list;
      }
    } catch (_) {}
    return List<ExpenseModel>.from(_cacheExpenses);
  }

  static Future<bool> addExpense(ExpenseModel expense) async {
    try {
      final res = await http.post(
        Uri.parse("$baseUrl/expenses"),
        headers: {"Content-Type": "application/json", "Accept": "application/json"},
        body: jsonEncode(expense.toJson()),
      );
      if (_isOk(res.statusCode)) return true;
    } catch (_) {}
    _cacheExpenses.add(expense);
    return true;
  }

  // ---------- GOALS ----------
  static Future<List<GoalModel>> getGoals() async {
    try {
      final res = await http.get(Uri.parse("$baseUrl/goals"), headers: {"Accept": "application/json"});
      if (_isOk(res.statusCode)) {
        final List data = jsonDecode(res.body);
        final list = data.map((e) => GoalModel.fromJson(e)).toList();
        _cacheGoals
          ..clear()
          ..addAll(list);
        return list;
      }
    } catch (_) {}
    // أوفلاين / فشل الشبكة
    return List<GoalModel>.from(_cacheGoals);
  }

  static Future<bool> addGoal(GoalModel goal) async {
    try {
      final res = await http.post(
        Uri.parse("$baseUrl/goals"),
        headers: {"Content-Type": "application/json", "Accept": "application/json"},
        body: jsonEncode(goal.toJson()),
      );
      if (_isOk(res.statusCode)) return true;
    } catch (_) {}
    // fallback أوفلاين: خزّن محليًا وارجع نجاح
    _cacheGoals.add(goal);
    return true;
  }
}
