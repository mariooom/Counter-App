import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../counter/counter_cubit.dart';

class CounterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
            onPressed: () => context
                .read<CounterCubit>()
                .increment(), //using Cubit's increment method
            child: Icon(Icons.add),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: FloatingActionButton(
            shape: CircleBorder(),
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurpleAccent,
            onPressed: () => context.read<CounterCubit>().decrement(),    //using Cubit's decrement method
            child: Icon(Icons.remove),
          ),
        ),
      ],
    );
  }
}
