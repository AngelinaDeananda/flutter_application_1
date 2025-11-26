import 'package:flutter/material.dart';

class LatihanStateManagement extends StatefulWidget {
  const LatihanStateManagement({super.key});

  @override
  State<LatihanStateManagement> createState() => _LatihanStateManagementState();
}

class _LatihanStateManagementState extends State<LatihanStateManagement> {
  List<Map<String, dynamic>> tempList = [];

  // Tambah item (kalimat)
  void addList() {
    setState(() {
      tempList.add({
        "text": "Item baru ke-${tempList.length + 1}", // kalimat
        "favorite": false, // default bukan favorite
      });
    });
  }

  // Hapus item
  void deleteList(int index) {
    setState(() {
      tempList.removeAt(index);

      // perbaiki urutan kalimat
      for (int i = 0; i < tempList.length; i++) {
        tempList[i]["text"] = "Item baru ke-${i + 1}";
      }
    });
  }

  // Toggle favorite
  void toggleFavorite(int index) {
    setState(() {
      tempList[index]["favorite"] = !tempList[index]["favorite"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan State"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: addList,
          ),
        ],
      ),

      body: tempList.isEmpty
          ? const Center(child: Text("Belum ada data"))
          : ListView.builder(
              itemCount: tempList.length,
              itemBuilder: (context, index) {
                int nomor = index + 1;

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(nomor.toString()),
                    ),

                    title: Text(tempList[index]["text"]),

                    // ⭐ Favorite
                    subtitle: Row(
                      children: [
                        Icon(
                          tempList[index]["favorite"]
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 6),
                        Text(tempList[index]["favorite"]
                            ? "Favorite"
                            : "Tidak favorite"),
                      ],
                    ),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Toggle Favorite
                        IconButton(
                          icon: Icon(
                            tempList[index]["favorite"]
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.pink,
                          ),
                          onPressed: () => toggleFavorite(index),
                        ),

                        // Delete
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteList(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
