import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthService
{
//SIGNUP
  Future signUp(String email, String password, String confirmPassword)async
  {
      UserModel user =UserModel( email: email);
      String jsonUser=jsonEncode(user.toJson());
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonUser);
      return true;
  }
  //LOGIN
  Future logIn( String email, String password)async
  {
    UserModel user =UserModel( email: email);
    String jsonUser=jsonEncode(user.toJson());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonUser);
    return true;
  }
//LOGOUT
  Future logOut()async
  {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('user');
      return true;
  }

}