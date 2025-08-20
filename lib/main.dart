import 'package:budget_app/screens/AddBudgetScreen.dart';
import 'package:budget_app/screens/add_expense_screen.dart';
import 'package:budget_app/screens/add_goal_screen..dart';
import 'package:budget_app/screens/overview_calculation.dart';
import 'package:budget_app/screens/overview_goals..dart';
import 'package:budget_app/screens/overview_options..dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budget_app/screens/ExpenseDetailsScreen.dart';
import 'package:budget_app/screens/budget_details_screen.dart';
import 'package:budget_app/screens/budget_screen.dart';
import 'package:budget_app/screens/dashboard_screen.dart';
import 'package:budget_app/screens/expenses_screen.dart';
import 'package:budget_app/screens/goals_screen.dart';
import 'package:budget_app/screens/login_screen.dart';
import 'package:budget_app/screens/overview_screen.dart';
import 'package:budget_app/screens/profile_screen.dart';
import 'package:budget_app/screens/register_screen.dart';
import 'package:budget_app/screens/report_screen.dart';
import 'package:budget_app/screens/settings_screen.dart';
import 'package:budget_app/screens/splash_screen.dart';
import 'package:budget_app/screens/welcome_screen.dart';
import 'core/theme.dart';
import 'cubits/BudgetCubit/budget_cubit.dart';
import 'cubits/auth_cubit/auth_cubit.dart';
import 'cubits/category_cubit/category_cubit.dart';
import 'cubits/expenses_cubit/expenses_cubit.dart';
import 'cubits/goals_cubit/goals_cubit.dart';
import 'models/budget_model.dart';
import 'models/expenseModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => BudgetCubit()),
        BlocProvider(create: (_) => CategoryCubit()),
        BlocProvider(create: (_) => ExpensesCubit()),
        BlocProvider(create: (_) => GoalsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'إدارة المصروفات',
        theme: AppTheme.darkTheme,
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashScreen(),
          '/welcome': (_) => const WelcomeScreen(),
          '/login': (_) => const LoginScreen(),
          '/register': (_) => const RegisterScreen(),
          '/dashboard': (_) => const DashboardScreen(),
          '/expenses': (_) => const ExpensesScreen(),
          '/budget': (_) => const BudgetScreen(),
          '/goals': (_) => const GoalsScreen(),
          '/report': (_) => const ReportScreen(),
          '/profile': (_) => const ProfileScreen(),
          '/overview': (_) => const OverviewScreen(),
          '/overview': (_) => const OverviewCalculation(),
          '/overview': (_) => const OverviewOptions(),
          '/overview': (_) => const OverviewGoals(),
          '/settings': (_) => const SettingsScreen(),
          '/add_expense': (_) => const AddExpenseScreen(), // ✅ مضاف
          '/add_budget': (_) => const AddBudgetScreen(), // ✅ مضاف
          '/add_goal': (_) => const AddGoalScreen(),
        },

        onGenerateRoute: (settings) {
          if (settings.name == '/expense_details') {
            final exp = settings.arguments as ExpenseModel;
            return MaterialPageRoute(builder: (_) => ExpenseDetailsScreen(expense: exp));
          }
          if (settings.name == '/budget_details') {
            final budget = settings.arguments as BudgetModel;
            return MaterialPageRoute(builder: (_) => BudgetDetailsScreen(budget: budget));
          }
          return null;
        },
      ),
    );
  }
}
