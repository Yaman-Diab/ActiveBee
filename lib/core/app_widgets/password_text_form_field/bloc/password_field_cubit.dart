import 'package:active_bee/core/app_widgets/password_text_form_field/bloc/password_field_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PasswordFieldCubit extends Cubit<PasswordFieldState>{
  PasswordFieldCubit() : super(InitialPasswordFieldState());
  bool hiddenPassword = true;
  void changeHiddenStatue()
  {
    hiddenPassword = !hiddenPassword;
    emit(PasswordVisibilityState());
  }

}