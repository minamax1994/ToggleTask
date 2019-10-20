class Client {
  Data data;

  Client({this.data});

  Client.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  int wid;
  String name;
  String at;

  Data({this.id, this.wid, this.name, this.at});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wid = json['wid'];
    name = json['name'];
    at = json['at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wid'] = this.wid;
    data['name'] = this.name;
    data['at'] = this.at;
    return data;
  }
}