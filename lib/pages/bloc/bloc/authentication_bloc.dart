import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEventLogin>((event, emit) async {
      emit(AuthenticationLoading());

      await Future.delayed(Duration(seconds: 5), () {
        print('a'); // cek data ke database
      });
      emit(AuthenticationLoaded());

      emit(AuthenticationStateError(massage: "ini error"));
    });
  }
}