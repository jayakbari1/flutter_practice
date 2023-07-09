import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practical_5/AdvancedWidget/alert_dialogbox.dart';

class CounterProviderObserver extends ProviderObserver {
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    // TODO: implement didAddProvider
    print(
        'List of Providers are $provider and value is $value as well container is $container');
    super.didAddProvider(provider, value, container);
//     print('''
// {
//   "provider": "${provider.name ?? provider.runtimeType}",
//   "newValue": "$value"
// }''');
  }
}

final counterProvider = StateProvider((ref) {
  ref.onCancel(() {
    print('Goes into Paused State');
  });
  ref.onResume(() {
    print('Alive again');
  });
  ref.onDispose(() {
    print('Cycle is remove');
  });
  // ref.keepAlive();
  return 0;
});

final secondCounterProvider = StateProvider((ref) {
  ref.onCancel(() {
    print('Goes into Paused State');
  });
  ref.onResume(() {
    print('Alive again');
  });
  ref.onDispose(() {
    print('Cycle is remove');
  });
  final readFirstProvider = ref.watch(counterProvider);
  //
  print('Updated $readFirstProvider with value');

  return readFirstProvider;
});

class RiverPodCounterExample extends ConsumerWidget {
  const RiverPodCounterExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(secondCounterProvider, (previous, next) {
    //   if (next == 5) {
    //     Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => const AlertDialogBoxWidget(),
    //     ));
    //   } else {
    //     print("NEXT : $next \nPrevious : $previous");
    //   }
    // });
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod Counter Example'),
      ),
      body: Column(
        children: [
          Center(
            child: Consumer(
              builder: (context, ref, _) {
                final counter = ref.watch(counterProvider);
                return Text(
                  counter.toString(),
                  style: const TextStyle(fontSize: 96),
                );
              },
            ),
          ),
          Center(
            child: Consumer(
              builder: (context, ref, _) {
                return Text(
                  ref.watch(secondCounterProvider).toString(),
                  style: const TextStyle(fontSize: 96),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AlertDialogBoxWidget(),
                ),
              );
            },
            child: const Text('Navigate'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
