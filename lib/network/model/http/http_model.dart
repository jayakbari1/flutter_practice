class HttpModel {
  final String firstName;
  final String lastName;
  final String email;
  final String? userId;
  HttpModel(
      {this.userId,
      required this.firstName,
      required this.lastName,
      required this.email});

  /// fromJson method will fit this json data into the Dart class object
  factory HttpModel.fromJson(Map<String, dynamic> json, [id]) {
    return HttpModel(
      userId: id,
      firstName: json['firstName'] ?? 'Not Found',
      lastName: json['lastName'] ?? 'Not Found',
      email: json['email'] ?? 'Not Found',
    );
  }

  /// toJson will helpful when we need to send data over server from convert dart to json
  Map<String, dynamic> toJson() => <String, dynamic>{
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
      };
}
