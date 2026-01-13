import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Product>> StreamProducts() async* {
    yield* firestore
        .collection("products")
        .withConverter<Product>(
          fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
          toFirestore: (Product, _) => Product.toJson(),
        )
        .snapshots();
  }

  ProductBloc() : super(ProductStateInitial()) {
    on<ProductEventAddProduct>((event, emit) async {
      try {
        emit(ProductStateLoadingEdit());
        // Menambahkan product ke firebase
        var hasil = await firestore.collection("products").add({
          "name": event.name,
          "code": event.code,
          "qty": event.qty,
        });

        await firestore.collection("products").doc(hasil.id).update({
          "productId": hasil.id,
        });
        emit(ProductStateCompleteAdd());
      } on FirebaseException catch (e) {
        emit(ProductStateError(e.message ?? "Tidak Dapat Menambahkan Product"));
      } catch (e) {
        emit(ProductStateError("Tidak Dapat Menambahkan Product"));
      }
    });
    on<ProductEventEditProduct>((event, emit) async {
      try {
        emit(ProductStateLoadingAdd());
        // Mengedit product ke firebase
        await firestore.collection("products").doc(event.productId).update({
          "name": event.name,
          "qty": event.qty,
        });

        emit(ProductStateCompleteEdit());
      } on FirebaseException catch (e) {
        emit(ProductStateError(e.message ?? "Tidak Dapat Menambahkan Product"));
      } catch (e) {
        emit(ProductStateError("Tidak Dapat Menambahkan Product"));
      }
    });
    on<ProductEventDeleteProduct>((event, emit) async {
      try {
        emit(ProductStateLoadingDelete());
        // Menambahkan product ke firebase
        await firestore.collection("products").doc(event.id).delete();
        emit(ProductStateCompleteDelete());
      } on FirebaseException catch (e) {
        emit(ProductStateError(e.message ?? "Tidak Dapat Menghapus Product"));
      } catch (e) {
        emit(ProductStateError("Tidak Dapat Menghapus Product"));
      }
    });
    on<ProductEventExportToPdf>((event, emit) async {
      try {
        emit(ProductStateLoadingExport());
        // 1. Ambil semua data product dari firebase
        var QuerySnapshot = await firestore
            .collection("products")
            .withConverter<Product>(
              fromFirestore: (snapshot, _) =>
                  Product.fromJson(snapshot.data()!),
              toFirestore: (Product, _) => Product.toJson(),
            )
            .get();

        List<Product> allProducts = [];
        for (var element in QuerySnapshot.docs) {
          Product product = element.data();
          allProducts.add(product);
        }
        // allProducts -> udah ada isinya, tergantung databasenya

        // 2. Bikin pdfnya (Create PDF) -> taro di mana? -> penyimpanan local ->
        final pdf = pw.Document();

        // TODO: MASUKIN DATA PRODUCTS KE PDF
        var data = await rootBundle.load("assets/fonts/opensans/OpenSans-Medium.ttf");
        var myFont = pw.Font.ttf(data);
        var myStyle = pw.TextStyle(font: myFont);

        pdf.addPage(
          pw.MultiPage(
            pageFormat: PdfPageFormat.a4,
            build: (context) {
              return [pw.Text("Hello", style: myStyle)];
            },
          ),
        );

        // 3. Open PDF
        Uint8List bytes = await pdf.save();
        
        final dir = await getApplicationCacheDirectory();
        File file = File("${dir.path}/myproducts.pdf");

        // Masukin data bytesnya ke file pdf 
        await file.writeAsBytes(bytes);

        await OpenFile.open(file.path);

        print(file.path);

        emit(ProductStateCompleteExport());
      } on FirebaseException catch (e) {
        emit(ProductStateError(e.message ?? "Tidak Dapat Export Product"));
      } catch (e) {
        emit(ProductStateError("Tidak Dapat Export Product"));
      }
    });
  }
}
