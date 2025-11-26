part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}
class AuthenticationEventLogin extends AuthenticationEvent{
  final String username;
  final String Password;

  AuthenticationEventLogin({required this.username, required this.Password});
}