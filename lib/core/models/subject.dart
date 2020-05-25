class Subject {
  int id;
  String name;
  String imgUrl;

  Subject({this.id, this.name, this.imgUrl});

  Subject.fromJson(Map<String, dynamic> data) :
    id = data['id'],
    name = data['name'],
    imgUrl = data['imgUrl'];
}
