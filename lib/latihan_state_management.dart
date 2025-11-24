import 'package:flutter/material.dart';

class LatihanStateManagement extends StatefulWidget {
  const LatihanStateManagement({super.key});

  @override
  State<LatihanStateManagement> createState() => _LatihanStateManagementState();
}

class _LatihanStateManagementState extends State<LatihanStateManagement> {
  List<int> tempList = [];

  // Tambah angka mulai dari 1
  void addList() {
    setState(() {
      tempList.add(tempList.length + 1); // SELALU MULAI DARI 1
    });
  }

  // Hapus item
  void deleteList(int index) {
    setState(() {
      tempList.removeAt(index);

      // Setelah hapus, reset urutan lagi agar tetap 1,2,3...
      for (int i = 0; i < tempList.length; i++) {
        tempList[i] = i + 1;
      }
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
                int nomor = index + 1; // urutan list

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(nomor.toString()),
                    ),
                    title: Text(tempList[index].toString()), // <-- perbaikan
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteList(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
