
import 'package:finalproject_nti/feature/auth/cubit/cubit/auth_state.dart';
import 'package:finalproject_nti/feature/auth/model/auth_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthData authData=AuthData();

  registerCubit({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
  }) async{
    emit(AuthLoading());
    var model=await authData.register(name:name , email: email,password: password,phone: phone,nationalId: nationalId,gender: gender);
    emit(AuthAddSuccess(model));
  }
}
