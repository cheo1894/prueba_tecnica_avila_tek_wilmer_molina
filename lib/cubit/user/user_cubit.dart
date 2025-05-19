import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_avila_tek/cubit/user/user_state.dart';
import 'package:prueba_tecnica_avila_tek/data/datasource/user_sources.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> getUserData(BuildContext context) async {
    emit(UserLoading());

    var userData = await UserSources().getCurrentUser();

    print(userData);

    if (userData != null && userData.toString() != '{}') {
      emit(UserLoaded(userData));
    } else {
      emit(UserError('No user data found'));
    }
  }

  Future<void> updateUserData(Map newUserData) async {
    emit(UserLoading());

    emit(UserLoaded({...newUserData}));
  }
}
