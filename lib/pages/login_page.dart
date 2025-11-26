import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cubit/item_page.dart';
import 'package:flutter_application_1/pages/cubit/visibility_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('login page'),

            const TextField(
              decoration: InputDecoration(suffixIcon: Icon(Icons.person)),
            ),

            BlocBuilder<VisibilityCubit, bool>(
              builder: (ctxVisibility, visibilitiVal) {
                return TextField(
                  obscureText: visibilitiVal,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        ctxVisibility.read<VisibilityCubit>().visibiliti();
                      },
                      icon: visibilitiVal
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const ItemPage(),
                  ),
                );
              },
              child: Text('login'),
            ),
          ],
        ),
      ),
    );
  }
}