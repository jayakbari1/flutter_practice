import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_5/getx/get_home_page_controller.dart';
import 'package:practical_5/getx/get_second_page.dart';

class GetXHomePage extends StatefulWidget {
  const GetXHomePage({Key? key}) : super(key: key);

  @override
  State<GetXHomePage> createState() => _GetXHomePageState();
}

class _GetXHomePageState extends State<GetXHomePage> {
  @override
  void initState() {
    print('Called initState');
    print('$mounted is called from init State');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('Call didChangeDependencies');
    print('$mounted from didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant GetXHomePage oldWidget) {
    print('$mounted from didUpdate');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('Mounted is called');
    print('$mounted from deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose is called');
    print('$mounted from dispose is called');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GetXHomePageController getXHomePageController =
        GetXHomePageController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ObxValue(
              (p0) => Switch(
                value: p0.value,
                onChanged: (value) => p0.value = value,
              ),
              false.obs,
            ),
            ObxValue(
              (p0) => Checkbox(
                value: p0.value,
                onChanged: (value) => p0.value = value!,
              ),
              true.obs,
            ),
            Obx(
              () => Text(
                '${getXHomePageController.counter.value}',
                style: const TextStyle(fontSize: 96),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                GetSnackBar snackbar = const GetSnackBar(
                  message: 'Nice and Awesome Snack bar',
                  snackPosition: SnackPosition.TOP,
                  duration: Duration(seconds: 2),
                  dismissDirection: DismissDirection.horizontal,
                );
                Get.showSnackbar(snackbar);
                print(Get.find().obs.runtimeType.toString());
              },
              child: const Text('Show Snackbar'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'Is this Interesting?',
                  content: const Text('This Dialog is created using GetX'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Yes')),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('No'))
                  ],
                );
              },
              child: const Text('Show AlertDialogBox'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const GetXSecondPage()));
                // Get.to(
                //   const GetXSecondPage(),
                //   transition: Transition.fadeIn,
                // );
              },
              child: const Text('Navigate to Another Scree'),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: getXHomePageController.increment,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: getXHomePageController.decrement,
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: getXHomePageController.reset,
            child: const Icon(Icons.lock_reset),
          ),
        ],
      ),
    );
  }
}
