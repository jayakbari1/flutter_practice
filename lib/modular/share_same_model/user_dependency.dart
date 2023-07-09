class GetUserDetails {
  String username = '';
  String email = '';
  String phoneNumber = '';

  // GetUserDetails(this.username, this.email, this.phoneNumber);

  String get user => username;
  String get userEmail => email;
  String get userPhoneNumber => phoneNumber;

  set newUserName(newName) => username = newName;
  set newUserEmail(newUserEmail) => email = newUserEmail;
  set newUserPhoneNumber(newUserPhoneNumber) =>
      phoneNumber = newUserPhoneNumber;
}
