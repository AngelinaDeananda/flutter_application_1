part of 'auth_bloc.dart';

sealed class AuthEvent {}

// Event -> action / aksi / tindakan / kegiatan
// 1. AuthEventLogin -> melakukan tindakan login
// 2. AuthEventLogout -> melakukan tindakan logout

final class AuthEventLogin extends AuthEvent {
  AuthEventLogin(this.email, this.pass);
  final String email;
  final String pass;
}

final class AuthEventLogout extends AuthEvent {}
