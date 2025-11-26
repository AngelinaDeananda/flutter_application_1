part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}
final class AuthenticationInitial extends AuthenticationState{}
 class AuthenticationLoading extends AuthenticationState{}
 class AuthenticationLoaded extends AuthenticationState{}
 class AuthenticationStateError extends AuthenticationState{
  final String massage;
  AuthenticationStateError({required this.massage});
 }