import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cubit/change_color_cubit.dart';
import 'package:flutter_application_1/pages/cubit/counter_cubit.dart';
import 'package:flutter_application_1/pages/cubit/favorite_count_cubit.dart';
import 'package:flutter_application_1/pages/cubit/items_cubit.dart';
import 'package:flutter_application_1/pages/cubit/visibility_cubit.dart';
import 'package:flutter_application_1/pages/login_page.dart';
// import 'package:flutter_application_1/pages/loginpage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:go_router/go_router.dart';

import './routes/router.dart';
import './bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(),
        ),
      ],
      child: MaterialApp.router(routerConfig: router),
    );
  }
}
