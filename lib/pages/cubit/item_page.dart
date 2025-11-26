import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/cubit/item_page_cubit.dart';
import 'package:flutter_application_1/pages/cubit/items_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Page"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ItemsCubit>().tambah();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),

      body: BlocBuilder<ItemsCubit, List<Map<String, dynamic>>>(
        builder: (context, items) {
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, index) {
              final item = items[index];

              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item["image"],
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        item["title"],
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        context.read<ItemsCubit>().toggleFavorite(index);
                      },
                      icon: Icon(
                        item["favorite"]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: item["favorite"] ? Colors.red : Colors.black,
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        context.read<ItemsCubit>().hapus(index);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}