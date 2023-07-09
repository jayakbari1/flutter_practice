import 'package:mobx/mobx.dart';

part 'parent_class_store.g.dart';

class ParentClassStore = _ParentClassStore with _$ParentClassStore;

abstract class _ParentClassStore with Store {
  ObservableList<int> likeCount = ObservableList.of([0, 0, 0, 0, 0]);
  ObservableList<int> dislikeCount = ObservableList.of([0, 0, 0, 0, 0]);

  @observable
  bool isPostLike = false;

  void postLiked(int index) {
    likeCount[index]++;
    isPostLike = true;
  }

  void postDisliked(int index) {
    dislikeCount[index]--;
    isPostLike = false;
  }
}
