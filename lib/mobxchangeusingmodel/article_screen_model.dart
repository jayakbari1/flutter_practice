import 'package:mobx/mobx.dart';

part 'article_screen_model.g.dart';

class ArticleDetails = _ArticleDetails with _$ArticleDetails;

abstract class _ArticleDetails with Store {
  @observable
  int id;

  @observable
  String user;

  @observable
  String title;

  @observable
  String content;

  @observable
  String publishTime;

  @observable
  String userProfilePic;

  @observable
  String image;

  @observable
  bool isFollowingTab;

  _ArticleDetails({
    required this.id,
    required this.user,
    required this.title,
    required this.content,
    required this.publishTime,
    required this.userProfilePic,
    required this.image,
    required this.isFollowingTab,
  });
}
