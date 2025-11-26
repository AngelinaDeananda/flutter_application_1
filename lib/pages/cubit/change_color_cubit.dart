import 'package:bloc/bloc.dart';

class ChangeColorCubit extends Cubit<bool> {
  ChangeColorCubit() : super(false);
  void changeColor(){
    emit(!state);
  }
}