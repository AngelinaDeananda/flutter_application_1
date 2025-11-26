import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cubit/change_color_cubit.dart';
import 'package:flutter_application_1/pages/cubit/counter_cubit.dart';
import 'package:flutter_application_1/pages/cubit/favorite_count_cubit.dart';
import 'package:flutter_application_1/pages/cubit/items_cubit.dart';
import 'package:flutter_application_1/pages/cubit/visibility_cubit.dart';
import 'package:flutter_application_1/pages/login_page.dart';
// import 'package:flutter_application_1/pages/loginpage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => CounterCubit(),
    ),
    BlocProvider(
      create: (context) => ChangeColorCubit(),
    ),
    BlocProvider(
      create: (context) => VisibilityCubit(),
    ),
    BlocProvider(
      create: (context) => FavoriteCountCubit(),
    ),
    BlocProvider(
      create: (context) => ItemsCubit(),
    ),
  ],
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Loginpage(),
  ),
);
  }
}