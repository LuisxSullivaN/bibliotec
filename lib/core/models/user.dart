class User {
  String sessionId;
  String controlNumber;
  String name;
  String career;
  String email;

  User({this.sessionId, this.controlNumber, this.name, this.career, this.email});

  User.fromJson(Map<String, dynamic> data) :
    sessionId = data['sessionId'],
    name = data['name'],
    career = data['career'],
    email = data['email'];


  Map<String, dynamic> toJson() {
    return {
      'sessionId': sessionId,
      'controlNumber': controlNumber,
      'name': name,
      'career': career,
      'email': email
    };
  }
}
