import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_5/BLoc/BLoc/bloc_counter_state.dart';
import 'package:practical_5/BLoc/BLoc/counter_bloc.dart';

class BlocCounterUI extends StatelessWidget {
  const BlocCounterUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoc Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<BlocCounter, BlocCounterState>(
            /// buildWhen we called for call particular condition and do other operation
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              print('Build and Render new Widget');
              return Text('Counter is ${state.blocCounter.toString()}');
            },
          ),
          BlocListener<BlocCounter, BlocCounterState>(
            listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              var snackBar = SnackBar(
                duration: const Duration(seconds: 1),
                content: Text('Couner is ${state.blocCounter.toString()}'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              print(
                  'While Listning Changes Count is ${state.blocCounter.toString()}');
            },
            child: const Text('Show Snackbar to get Update'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () =>
                    context.read<BlocCounter>().add(IncrementEvent()),
                child: const Text('Increment Counter'),
              ),
              ElevatedButton(
                onPressed: () =>
                    BlocProvider.of<BlocCounter>(context).add(DecrementEvent()),
                child: const Text('Decrement Counter'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
