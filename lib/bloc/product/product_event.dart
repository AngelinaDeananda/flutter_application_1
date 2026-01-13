part of 'product_bloc.dart';

abstract class ProductEvent {}

class ProductEventAddProduct extends ProductEvent {
  final String name;
  final String code;
  final int qty;

  ProductEventAddProduct({
    required this.name,
    required this.code,
    required this.qty,
  });
}

class ProductEventEditProduct extends ProductEvent {
  final String productId;
  final String name;
  final int qty;

  ProductEventEditProduct({
    required this.productId,
    required this.name,
    required this.qty,
  });
}

class ProductEventDeleteProduct extends ProductEvent {
  final String id;

  ProductEventDeleteProduct(this.id);
}

class ProductEventExportToPdf extends ProductEvent {}
