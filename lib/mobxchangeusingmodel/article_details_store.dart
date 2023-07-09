import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:practical_5/mobxchangeusingmodel/article_details_model.dart';

part 'article_details_store.g.dart';

class ArticleDetailsStore = _ArticleDetailsStore with _$ArticleDetailsStore;

abstract class _ArticleDetailsStore with Store {
  ObservableList<Observable<ArticleDetailsModel>> articleList =
      ObservableList.of(
    [
      Observable(
        ArticleDetailsModel(
          id: 1,
          user: 'David amos',
          title: 'I wrote an article using OpenAI and received \$100 for it',
          content:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          image: 'https://source.unsplash.com/random?sig=1',
          publishTime: 'Jan 01, 2023',
          userProfilePic: 'https://source.unsplash.com/random?sig=1',
          isFollowingTab: true,
        ),
      ),
      Observable(
        ArticleDetailsModel(
          id: 2,
          user: 'Disha',
          title: 'Everyday skills I Use As A UX Professional',
          content:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          image: 'https://source.unsplash.com/random?sig=2',
          publishTime: 'Sep 25, 2022',
          userProfilePic: 'https://source.unsplash.com/random?sig=2',
          isFollowingTab: true,
        ),
      ),
      Observable(
        ArticleDetailsModel(
          id: 3,
          user: 'Aman',
          title: 'Beginner at Programming?, STOP believing',
          content:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          image: 'https://source.unsplash.com/random?sig=3',
          publishTime: '1 day ago',
          userProfilePic: 'https://source.unsplash.com/random?sig=3',
          isFollowingTab: true,
        ),
      ),
      Observable(
        ArticleDetailsModel(
          id: 4,
          user: 'Edgar Hovhannisyan',
          title:
              'Bought a course for 12\$ on Udemy and reached 3200\$ income per month',
          content:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          image: 'https://source.unsplash.com/random?sig=4',
          publishTime: 'Feb 15, 2022',
          userProfilePic: 'https://source.unsplash.com/random?sig=4',
          isFollowingTab: true,
        ),
      ),
      Observable(
        ArticleDetailsModel(
          id: 5,
          user: 'Daniel van Flymen',
          title: 'Learn Blockchains by Building One',
          content:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          image: 'https://source.unsplash.com/random?sig=5',
          publishTime: '1 day ago',
          userProfilePic: 'https://source.unsplash.com/random?sig=5',
          isFollowingTab: true,
        ),
      ),
      Observable(
        ArticleDetailsModel(
          id: 6,
          user: 'Enrique Dans',
          title: 'Most data brokers should be behind bars',
          content:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          image: 'https://source.unsplash.com/random?sig=6',
          publishTime: 'Feb 3, 2021',
          userProfilePic: 'https://source.unsplash.com/random?sig=6',
          isFollowingTab: true,
        ),
      ),
    ],
  );

  void changeIt() {
    debugPrint('Function is called');
    articleList[0].value.title = 'Title change Using Make model observable';
    articleList[0].reportRead();
    debugPrint('After changing title value is ${articleList[0].value.title}');
  }
}
