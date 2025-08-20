import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // نخزن المستخدم الحالي هنا مؤقت
  String? _registeredEmail;
  String? _registeredPassword;

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 1));

    // لو فيه يوزر متسجل قبل كده
    if (_registeredEmail != null &&
        _registeredPassword != null &&
        email == _registeredEmail &&
        password == _registeredPassword) {
      emit(AuthSuccess());
    }
    // fallback على اليوزر الثابت القديم
    else if (email == "test@test.com" && password == "1234") {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("خطأ في تسجيل الدخول"));
    }
  }

  Future<void> register(String name, String email, String password) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 1));

    if (email.contains("@")) {
      // خزّن بيانات التسجيل
      _registeredEmail = email;
      _registeredPassword = password;
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("فشل التسجيل"));
    }
  }

  Future<void> tryAutoLogin() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(AuthFailure("مفيش جلسة مستخدم محفوظة"));
  }
}
