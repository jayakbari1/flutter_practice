import 'package:get/get.dart';

class GetXHomePageController extends GetxController {
  final counter = 0.obs;

  increment() => counter.value++;

  decrement() => counter.value--;

  reset() => counter.value = 0;
}
