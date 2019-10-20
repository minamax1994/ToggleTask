class Project {
  ProjectData data;

  Project({this.data});

  Project.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ProjectData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class ProjectData {
  int id;
  int wid;
  int cid;
  String name;
  bool billable;
  bool isPrivate;
  bool active;
  bool template;
  String at;
  String createdAt;
  String color;
  bool autoEstimates;
  String hexColor;

  ProjectData(
      {this.id,
      this.wid,
      this.cid,
      this.name,
      this.billable,
      this.isPrivate,
      this.active,
      this.template,
      this.at,
      this.createdAt,
      this.color,
      this.autoEstimates,
      this.hexColor});

  ProjectData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wid = json['wid'];
    cid = json['cid'];
    name = json['name'];
    billable = json['billable'];
    isPrivate = json['is_private'];
    active = json['active'];
    template = json['template'];
    at = json['at'];
    createdAt = json['created_at'];
    color = json['color'];
    autoEstimates = json['auto_estimates'];
    hexColor = json['hex_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wid'] = this.wid;
    data['cid'] = this.cid;
    data['name'] = this.name;
    data['billable'] = this.billable;
    data['is_private'] = this.isPrivate;
    data['active'] = this.active;
    data['template'] = this.template;
    data['at'] = this.at;
    data['created_at'] = this.createdAt;
    data['color'] = this.color;
    data['auto_estimates'] = this.autoEstimates;
    data['hex_color'] = this.hexColor;
    return data;
  }
}