class DataHome{
  late List<dynamic> result;
  DataHome(this.result);
  DataHome.fromMap(Map<String, dynamic> map) : result = map['result'];
}

class HomeModel {
  late int userId;
  late int id;
  late String title;
  late String body;

  HomeModel({required this.userId, required this.id, required this.title, required this.body});

  HomeModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}


abstract class HomeFetchData {
  Future<List<HomeModel>> fetchHome();
}