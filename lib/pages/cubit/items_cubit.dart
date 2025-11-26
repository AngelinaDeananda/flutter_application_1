import 'package:bloc/bloc.dart'; 

class ItemsCubit extends Cubit<List<Map<String, dynamic>>> {
  ItemsCubit() : super([]);

  void tambah() {
    final newList = List<Map<String, dynamic>>.from(state);
    newList.add({
      "title": "New Item",
      "favorite": false,
      "image": "assets/images/gmbr.jpg",
    });
    emit(newList);
  }

  void hapus(int index) {
    final newList = List<Map<String, dynamic>>.from(state);
    newList.removeAt(index);
    emit(newList);
  }

  void toggleFavorite(int index) {
    final newList = List<Map<String, dynamic>>.from(state);
    newList[index]["favorite"] = !newList[index]["favorite"];
    emit(newList);
  }
}