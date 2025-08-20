import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/goal_model.dart';
import '../../services/api_service.dart';
import 'goals_state.dart';

class GoalsCubit extends Cubit<GoalsState> {
  GoalsCubit() : super(GoalsInitial());

  final List<GoalModel> _goals = [];

  Future<void> loadGoals() async {
    emit(GoalsLoading());
    try {
      final goals = await ApiService.getGoals();
      _goals
        ..clear()
        ..addAll(goals);
      emit(GoalsSuccess(List<GoalModel>.from(_goals)));
    } catch (e) {
      emit(GoalsError("فشل تحميل الأهداف"));
    }
  }

  Future<void> addGoal(GoalModel goal) async {
    emit(GoalsLoading());
    try {
      final ok = await ApiService.addGoal(goal);
      if (ok) {
        // ✅ هنا بدل ما ننده API مرتين نضيف الهدف لليستة الداخلية مباشرة
        _goals.add(goal);
        emit(GoalsSuccess(List<GoalModel>.from(_goals)));
      } else {
        emit(GoalsError("فشل إضافة الهدف"));
      }
    } catch (e) {
      emit(GoalsError("خطأ في الاتصال بالسيرفر"));
    }
  }
}
