import 'package:mobx/mobx.dart';
import 'package:practical_5/mobx/fetch_response.dart';

part 'future_observable.g.dart';

class ObservableFutureExample = _ObservableFutureExample
    with _$ObservableFutureExample;

abstract class _ObservableFutureExample with Store {
  late ObservableFuture<List> observableFuture;

  @observable
  List<dynamic> response = [];

  Future<void> fetchResponse() async {
    FetchResponse fetchResponse = FetchResponse();

    observableFuture = ObservableFuture(fetchResponse.fetchData());
    response = await observableFuture;
    response = await fetchResponse.fetchData();
  }
}
