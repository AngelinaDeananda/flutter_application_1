import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/pages/detail_product.dart';
import 'package:flutter_application_1/pages/products.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../pages/home.dart';
import '../pages/products.dart';
import '../pages/detail_product.dart';
import '../pages/add_product.dart';
import '../pages/error.dart';
import '../pages/login.dart';

export 'package:go_router/go_router.dart';

part 'route_name.dart';

// GoRouter configuration
final router = GoRouter(
  redirect: (context, state) {
    FirebaseAuth auth = FirebaseAuth.instance;
    // Cek kondisi saat ini -> sedang terautentikasi
    if (auth.currentUser == null) {
      // tidak sedang login / tidak ada user yang aktif saat ini
      return "/login";
    } else {
      return null;
    }
  },
  errorBuilder: (context, state) => const ErrorPage(),
  routes: [
    // Kalau 1 level -> Push Replacement
    // Kalau Sub Level -> Push (biasa)
    // Prioritas dalam pembuatan GoRoute (Urutan dari atas -> bawah)
    GoRoute(
      path: '/',
      name: Routes.home,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'products',
          name: Routes.products,
          builder: (context, state) => const ProductsPage(),
          routes: [
            GoRoute(
              path: ':productId',
              name: Routes.detailProducts,
              builder: (context, state) => DetailProductPage(
                state.pathParameters['productId'].toString(),
                state.extra as Product,
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'add-product',
          name: Routes.addProduct,
          builder: (context, state) => AddProductPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      name: Routes.login,
      builder: (context, state) => LoginPage(),
    ),
  ],
);
