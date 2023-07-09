import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:practical_5/BLoc/Cubit/counter_cubit.dart';

class CubitCounterExample extends StatefulWidget {
  const CubitCounterExample({Key? key}) : super(key: key);

  @override
  State<CubitCounterExample> createState() => _CubitCounterExampleState();
}

class _CubitCounterExampleState extends State<CubitCounterExample> {
  Logger logger = Logger();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("CUBIT COUNTER EXAMPLE"),
  //       centerTitle: true,
  //     ),
  //     body: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         BlocBuilder<CounterCubit, int>(
  //           builder: (context, state) {
  //             logger
  //                 .wtf("Now Text widget is re-render with ${state.toString()}");
  //             return Text(state.toString());
  //           },
  //         ),
  //         const SizedBox(
  //           height: 10,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             ElevatedButton(
  //               onPressed: () =>
  //                   BlocProvider.of<CounterCubit>(context).increment(),
  //               child: const Text("ADD"),
  //             ),
  //             ElevatedButton(
  //               onPressed: () => context.read<CounterCubit>().decrement(),
  //               //BlocProvider.of<CounterCubit>(context).decrement(),
  //               child: const Text("SUB"),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CUBIT COUNTER EXAMPLE'),
        centerTitle: true,
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     BlocBuilder<CounterCubit0, int>(
      //       builder: (context, state) {
      //         logger
      //             .wtf("Now Text widget is re-render with ${state.toString()}");
      //         return Text(state.toString());
      //       },
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         ElevatedButton(
      //           onPressed: () =>
      //               BlocProvider.of<CounterCubit>(context).increment(),
      //           child: const Text("ADD"),
      //         ),
      //         ElevatedButton(
      //           onPressed: () => context.read<CounterCubit>().decrement(),
      //           //BlocProvider.of<CounterCubit>(context).decrement(),
      //           child: const Text("SUB"),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit0, CounterInitial0>(
            builder: (context, state) {
              return Text('Counter0 is ${state.counterValue0.toString()}');
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => BlocProvider.of<CounterCubit0>(context)
                    .incrementCounterInitial0(),
                child: const Text('Increment Counter0'),
              ),
              ElevatedButton(
                onPressed: () => BlocProvider.of<CounterCubit0>(context)
                    .decrementCounterInitial0(),
                child: const Text('Decrement Counter0'),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<CounterCubit1, CounterInitial1>(
            builder: (context, state) {
              return Text('Counter1 is ${state.counterValue1.toString()}');
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => BlocProvider.of<CounterCubit1>(context)
                    .incrementCounterInitial1(),
                child: const Text('Increment Counter1'),
              ),
              ElevatedButton(
                onPressed: () => BlocProvider.of<CounterCubit1>(context)
                    .decrementCounterInitial1(),
                child: const Text('Decrement Counter1'),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // BlocBuilder<CounterCubit2, CounterInitial2>(
          //   builder: (context, state) {
          //     return Text("Counter2 is ${state.counterValue2.toString()}");
          //   },
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     ElevatedButton(
          //       onPressed: () => BlocProvider.of<CounterCubit2>(context)
          //           .incrementCounterInitial2(),
          //       child: const Text("Increment Counter2"),
          //     ),
          //     ElevatedButton(
          //       onPressed: () => BlocProvider.of<CounterCubit2>(context)
          //           .decrementCounterInitial2(),
          //       child: const Text("Decrement Counter2"),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // BlocBuilder<CounterCubit3, CounterInitial3>(
          //   builder: (context, state) {
          //     return Text("Counter3 is ${state.counterValue3.toString()}");
          //   },
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     ElevatedButton(
          //       onPressed: () => BlocProvider.of<CounterCubit3>(context)
          //           .incrementCounterInitial3(),
          //       child: const Text("Increment Counter3"),
          //     ),
          //     ElevatedButton(
          //       onPressed: () => BlocProvider.of<CounterCubit3>(context)
          //           .decrementCounterInitial3(),
          //       child: const Text("Decrement Counter3"),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
