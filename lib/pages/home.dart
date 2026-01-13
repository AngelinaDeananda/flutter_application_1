import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/bloc.dart';
import 'package:flutter_application_1/routes/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HOME"), centerTitle: true),
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          late String title;
          late IconData icon;
          late VoidCallback onTap;

          switch (index) {
            case 0:
              title = "Add Product";
              icon = Icons.post_add_rounded;
              onTap = () => context.goNamed(Routes.addProduct);
              break;
            case 1:
              title = "Products";
              icon = Icons.list_alt_outlined;
              onTap = () => context.goNamed(Routes.products);
              break;
            case 2:
              title = "QR Code";
              icon = Icons.qr_code;
              onTap = () {};
              break;
            case 3:
              title = "Catalog";
              icon = Icons.document_scanner_outlined;
              onTap = () {
                context.read<ProductBloc>().add(ProductEventExportToPdf());
              };
              break;
          }

          return Material(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(9),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (index == 3)
                      ? BlocConsumer<ProductBloc, ProductState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            if (state is ProductStateLoadingExport) {
                              return const CircularProgressIndicator();
                            }
                            return SizedBox(
                              height: 50,
                              width: 50,
                              child: Icon(icon, size: 50),
                            );
                          },
                        )
                      : SizedBox(
                          height: 50,
                          width: 50,
                          child: Icon(icon, size: 50),
                        ),
                  const SizedBox(height: 10),
                  Text(title),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Proses Logout
          context.read<AuthBloc>().add(AuthEventLogout());
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
