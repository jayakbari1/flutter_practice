class ArticleDetails {
  final int id;
  final String user;
  final String title;
  final String content;
  final String publishTime;
  final String userProfilePic;
  final String image;
  final bool isFollowingTab;

  const ArticleDetails({
    required this.id,
    required this.user,
    required this.title,
    required this.content,
    required this.publishTime,
    required this.userProfilePic,
    required this.image,
    required this.isFollowingTab,
  });

  ArticleDetails copyWith({
    int? id,
    String? user,
    String? title,
    String? content,
    String? publishTime,
    String? userProfilePic,
    String? image,
    bool? isFollowingTab,
  }) =>
      ArticleDetails(
        id: id ?? this.id,
        user: user ?? this.user,
        title: title ?? this.title,
        content: content ?? this.content,
        publishTime: publishTime ?? this.publishTime,
        userProfilePic: userProfilePic ?? this.userProfilePic,
        image: image ?? this.image,
        isFollowingTab: isFollowingTab ?? this.isFollowingTab,
      );
}
