import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc_repo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Repository Example',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<BlocRepo, ImageState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is LoadedState) {
                  return Image.network(
                    state.img,
                    frameBuilder:
                        (context, image, frame, wasSynchronouslyLoaded) {
                      if (frame == null) {
                        return const CircularProgressIndicator();
                      } else {
                        return SizedBox(
                          height: 350,
                          width: 500,
                          child: image,
                        );
                      }
                    },
                  );
                } else {
                  return const Text('ERROR');
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<BlocRepo>(context).add(LoadEvent());
              },
              child: const Text(
                'Get Image',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
