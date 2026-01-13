part of 'auth_bloc.dart';

sealed class AuthState {}

// State -> kondisi saat ini
// 1. AuthStateLogin -> tidak terautentikasi
// 2. AuthStateLoading -> loading ...
// 3. AuthStateLogout -> tidak terautentikasi
// 4. AuthStateError -> gagal login -> dapat error

final class AuthStateLogin extends AuthState {}

final class AuthStateLoading extends AuthState {}

final class AuthStateLogout extends AuthState {}

final class AuthStateError extends AuthState {
  AuthStateError(this.message);

  final String message;
}
