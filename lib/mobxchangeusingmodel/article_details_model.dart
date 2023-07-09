class ArticleDetailsModel {
  int id;
  String user;
  String title;
  String content;
  String publishTime;
  String userProfilePic;
  String image;
  bool isFollowingTab;

  ArticleDetailsModel({
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
