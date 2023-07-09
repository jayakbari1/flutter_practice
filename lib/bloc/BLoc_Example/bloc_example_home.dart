import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_5/BLoc/BLoc_Example/bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Show Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<BLocExample, ImageState>(
              builder: (context, state) {
                print(state);
                if (state is FetchingState) {
                  return const CircularProgressIndicator();
                } else if (state is FetchedState) {
                  print(state.number);
                  return SizedBox(
                    height: 200,
                    width: 500,
                    child: Image.network(
                      frameBuilder:
                          (context, image, frame, wasSynchronouslyLoaded) {
                        if (frame == null) {
                          return const LinearProgressIndicator();
                        } else {
                          return image;
                        }
                      },
                      'https://source.unsplash.com/random?sig=${state.number}',
                    ),
                  );
                } else {
                  return const LinearProgressIndicator();
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: BlocListener<BLocExample, ImageState>(
                listener: (context, state) {
                  if (state is FetchedState) {
                    state.number = int.parse(number.text.toString());
                  }
                },
                child: TextField(
                  controller: number,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<BLocExample>(context)
                      .add(ChangeImageOnTextForm());
                },
                child: const Text('Change Image'))
          ],
        ),
      ),
    );
  }
}
