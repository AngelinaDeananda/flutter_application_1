import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../bloc/bloc.dart';
import '../routes/router.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductBloc productB = context.read<ProductBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("ALL PRODUCTS"),
      ),
      body: StreamBuilder<QuerySnapshot<Product>>(
        stream: productB.StreamProducts(), 
        builder: (context, snapshot) {

          if (snapshot.hasError) {
            return const Center(
              child: Text("Tidak dapat mengambil data."),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("Tidak ada data."),
            );
          }

          final List<Product> allProducts =
              snapshot.data!.docs.map((e) => e.data()).toList();

          return ListView.builder(
            itemCount: allProducts.length,
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              final product = allProducts[index];

              return Card(
                elevation: 5,
                margin: const EdgeInsets.only(bottom: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(9),
                  onTap: () {
                    context.goNamed(
                      Routes.detailProducts,
                      pathParameters: {
                        "productId": product.productId!,
                      },
                      extra: product,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.code ?? "-",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(product.name ?? "-"),
                              Text("Jumlah : ${product.qty ?? 0}"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: QrImageView(
                            data: product.code ?? "",
                            version: QrVersions.auto,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
