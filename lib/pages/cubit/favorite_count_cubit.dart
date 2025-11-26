import 'package:bloc/bloc.dart';

class FavoriteCountCubit extends Cubit<int> {
  FavoriteCountCubit() : super(0);

  void updateCount(List<Map<String, dynamic>> items) {
    final count = items.where((e) => e["favorite"] == true).length;
    emit(count);
  }
}