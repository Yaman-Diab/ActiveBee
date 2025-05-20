import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static const String _isLoggedKey = 'isLogged';

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogged = prefs.getBool(_isLoggedKey) ?? false;
    emit(isLogged ? AuthLoggedIn() : AuthLoggedOut());
  }

  Future<void> logIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedKey, true);
    emit(AuthLoggedIn());
  }

  Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedKey, false);
    emit(AuthLoggedOut());
  }
}


// // تسجيل دخول
// context.read<AuthCubit>().logIn();

// // تسجيل خروج
// context.read<AuthCubit>().logOut();
