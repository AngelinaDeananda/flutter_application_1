import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cubit/change_color_cubit.dart';
import 'package:flutter_application_1/pages/cubit/counter_cubit.dart';
import 'package:flutter_application_1/pages/cubit/visibility_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<CounterCubit, int>(
        builder: (ctxCount, count) => Center(
          child: Column(
            children: [
              BlocBuilder<ChangeColorCubit, bool>(
                builder: (ctxColor, collorVal) {
                  return InkWell(
                    onTap: () {
                      ctxColor.read<ChangeColorCubit>().changeColor();
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: collorVal ? Colors.red : Colors.green,
                      child: Text('$count'),
                    ),
                  );
                },
              ),
              BlocBuilder<VisibilityCubit, bool>(
                builder: (ctxVisibility, visibilitiVal) {
                  return TextField(
                    obscureText: visibilitiVal,
                    decoration: InputDecoration(
                      suffix: IconButton(
                        onPressed: () {
                          ctxVisibility.read<VisibilityCubit>().visibiliti();
                        },
                        icon: visibilitiVal? Icon(Icons.remove_red_eye):Icon(Icons.remove_red_eye_outlined),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}