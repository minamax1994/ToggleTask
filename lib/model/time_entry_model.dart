class TimeEntry {
  int id;
  int wid;
  int pid;
  bool billable;
  String start;
  String stop;
  int duration;
  String description;
  String at;

  TimeEntry(
      {this.id,
      this.wid,
      this.pid,
      this.billable,
      this.start,
      this.stop,
      this.duration,
      this.description,
      this.at});

  TimeEntry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wid = json['wid'];
    pid = json['pid'];
    billable = json['billable'];
    start = json['start'];
    stop = json['stop'];
    duration = json['duration'];
    description = json['description'];
    at = json['at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wid'] = this.wid;
    data['pid'] = this.pid;
    data['billable'] = this.billable;
    data['start'] = this.start;
    data['stop'] = this.stop;
    data['duration'] = this.duration;
    data['description'] = this.description;
    data['at'] = this.at;
    return data;
  }
}