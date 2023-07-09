// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticleDetails on _ArticleDetails, Store {
  late final _$idAtom = Atom(name: '_ArticleDetails.id', context: context);

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$userAtom = Atom(name: '_ArticleDetails.user', context: context);

  @override
  String get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$titleAtom =
      Atom(name: '_ArticleDetails.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$contentAtom =
      Atom(name: '_ArticleDetails.content', context: context);

  @override
  String get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(String value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  late final _$publishTimeAtom =
      Atom(name: '_ArticleDetails.publishTime', context: context);

  @override
  String get publishTime {
    _$publishTimeAtom.reportRead();
    return super.publishTime;
  }

  @override
  set publishTime(String value) {
    _$publishTimeAtom.reportWrite(value, super.publishTime, () {
      super.publishTime = value;
    });
  }

  late final _$userProfilePicAtom =
      Atom(name: '_ArticleDetails.userProfilePic', context: context);

  @override
  String get userProfilePic {
    _$userProfilePicAtom.reportRead();
    return super.userProfilePic;
  }

  @override
  set userProfilePic(String value) {
    _$userProfilePicAtom.reportWrite(value, super.userProfilePic, () {
      super.userProfilePic = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_ArticleDetails.image', context: context);

  @override
  String get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$isFollowingTabAtom =
      Atom(name: '_ArticleDetails.isFollowingTab', context: context);

  @override
  bool get isFollowingTab {
    _$isFollowingTabAtom.reportRead();
    return super.isFollowingTab;
  }

  @override
  set isFollowingTab(bool value) {
    _$isFollowingTabAtom.reportWrite(value, super.isFollowingTab, () {
      super.isFollowingTab = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
user: ${user},
title: ${title},
content: ${content},
publishTime: ${publishTime},
userProfilePic: ${userProfilePic},
image: ${image},
isFollowingTab: ${isFollowingTab}
    ''';
  }
}
