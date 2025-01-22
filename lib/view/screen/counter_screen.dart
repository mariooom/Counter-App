import 'package:bloc_task2/view/widgets/dialog.dart';
import 'package:bloc_task2/view/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../counter/counter_cubit.dart';
import '../widgets/button_widget.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Counter App',
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
      ),
      body: Center(
        child: BlocListener<CounterCubit, int>(      //using BlocListener for the dialog
          listener: (context, state) {
            if (state == -1) {
              CustomDialog.showAnimatedDialog(
                context,
                'Negative Counter',
                'Counter value is negative!',
              );
            }
          },
          child: BlocConsumer<CounterCubit, int>(    //using BlocConsumer for the snackbar
            listener: (context, state) {
              if (state == 10) {
                CustomSnackbar.showSnackBar(context, 'Counter reached 10!');
              } else if (state == -10) {
                CustomSnackbar.showSnackBar(context, 'Counter reached -10!');
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Counter: $state',     //to update text widget with Cubit's state
                    style: const TextStyle(fontSize: 37),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CounterButtons(),
                    ],
                  ),
                  const SizedBox(width: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(180, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        backgroundColor: Colors.deepPurpleAccent,
                      ),
                      onPressed: () => context.read<CounterCubit>().reset(),     //using Cubit's reset method
                      child: const Text(
                        'Reset',
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
