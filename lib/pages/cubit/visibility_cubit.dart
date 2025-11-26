import 'package:bloc/bloc.dart';

class VisibilityCubit extends Cubit<bool> {
  VisibilityCubit() : super(false);
  void visibiliti(){
    emit(!state);
  }
}