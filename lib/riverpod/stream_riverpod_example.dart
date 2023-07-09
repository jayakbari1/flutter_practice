import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider.autoDispose((ref) async* {
  yield* Stream.periodic(
    const Duration(seconds: 2),
    (dateTime) => DateTime.now(),
  );
});

class StreamRiverPodExample extends ConsumerWidget {
  const StreamRiverPodExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream RiverPod Example'),
      ),
      body: Consumer(builder: (context, ref, child) {
        final data = ref.watch(streamProvider);
        return data.when(
            data: (data) {
              return Center(
                child: Text(
                  data.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ));
      }),
    );
  }
}
