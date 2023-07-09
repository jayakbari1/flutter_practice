class JsonPlaceHolderTodos {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const JsonPlaceHolderTodos(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory JsonPlaceHolderTodos.fromJson(Map<String, dynamic> json) {
    return JsonPlaceHolderTodos(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}
