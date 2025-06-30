import 'package:finalproject_nti/feature/auth/model/response_model.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthAddSuccess extends AuthState {
  final ResponseModel model;
  AuthAddSuccess(this.model);
}
