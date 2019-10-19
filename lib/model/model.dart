enum CustomTextFormFieldType { Email, Password, Token }

class MeResponse {
  int since;
  Data data;

  MeResponse({this.since, this.data});

  MeResponse.fromJson(Map<String, dynamic> json) {
    since = json['since'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['since'] = this.since;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String apiToken;
  int defaultWid;
  String email;
  String fullname;
  String jqueryTimeofdayFormat;
  String jqueryDateFormat;
  String timeofdayFormat;
  String dateFormat;
  bool storeStartAndStopTime;
  int beginningOfWeek;
  String language;
  String imageUrl;
  bool sidebarPiechart;
  String at;
  String createdAt;
  int retention;
  bool recordTimeline;
  bool renderTimeline;
  bool timelineEnabled;
  bool timelineExperiment;
  NewBlogPost newBlogPost;
  bool shouldUpgrade;
  bool achievementsEnabled;
  String timezone;
  bool openidEnabled;
  bool sendProductEmails;
  bool sendWeeklyReport;
  bool sendTimerNotifications;
  String lastBlogEntry;
  List<Workspace> workspaces;
  List<Tag> tags;
  List<Task> tasks;
  List<Project> projects;
  List<Client> clients;
  String durationFormat;
  Obm obm;

  Data(
      {this.id,
      this.apiToken,
      this.defaultWid,
      this.email,
      this.fullname,
      this.jqueryTimeofdayFormat,
      this.jqueryDateFormat,
      this.timeofdayFormat,
      this.dateFormat,
      this.storeStartAndStopTime,
      this.beginningOfWeek,
      this.language,
      this.imageUrl,
      this.sidebarPiechart,
      this.at,
      this.createdAt,
      this.retention,
      this.recordTimeline,
      this.renderTimeline,
      this.timelineEnabled,
      this.timelineExperiment,
      this.newBlogPost,
      this.shouldUpgrade,
      this.achievementsEnabled,
      this.timezone,
      this.openidEnabled,
      this.sendProductEmails,
      this.sendWeeklyReport,
      this.sendTimerNotifications,
      this.lastBlogEntry,
      this.workspaces,
      this.durationFormat,
      this.obm});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    apiToken = json['api_token'];
    defaultWid = json['default_wid'];
    email = json['email'];
    fullname = json['fullname'];
    jqueryTimeofdayFormat = json['jquery_timeofday_format'];
    jqueryDateFormat = json['jquery_date_format'];
    timeofdayFormat = json['timeofday_format'];
    dateFormat = json['date_format'];
    storeStartAndStopTime = json['store_start_and_stop_time'];
    beginningOfWeek = json['beginning_of_week'];
    language = json['language'];
    imageUrl = json['image_url'];
    sidebarPiechart = json['sidebar_piechart'];
    at = json['at'];
    createdAt = json['created_at'];
    retention = json['retention'];
    recordTimeline = json['record_timeline'];
    renderTimeline = json['render_timeline'];
    timelineEnabled = json['timeline_enabled'];
    timelineExperiment = json['timeline_experiment'];
    newBlogPost = json['new_blog_post'] != null
        ? new NewBlogPost.fromJson(json['new_blog_post'])
        : null;
    shouldUpgrade = json['should_upgrade'];
    achievementsEnabled = json['achievements_enabled'];
    timezone = json['timezone'];
    openidEnabled = json['openid_enabled'];
    sendProductEmails = json['send_product_emails'];
    sendWeeklyReport = json['send_weekly_report'];
    sendTimerNotifications = json['send_timer_notifications'];
    lastBlogEntry = json['last_blog_entry'];
    if (json['workspaces'] != null) {
      workspaces = new List<Workspace>();
      json['workspaces'].forEach((v) {
        workspaces.add(new Workspace.fromJson(v));
      });
    }
    durationFormat = json['duration_format'];
    obm = json['obm'] != null ? new Obm.fromJson(json['obm']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['api_token'] = this.apiToken;
    data['default_wid'] = this.defaultWid;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['jquery_timeofday_format'] = this.jqueryTimeofdayFormat;
    data['jquery_date_format'] = this.jqueryDateFormat;
    data['timeofday_format'] = this.timeofdayFormat;
    data['date_format'] = this.dateFormat;
    data['store_start_and_stop_time'] = this.storeStartAndStopTime;
    data['beginning_of_week'] = this.beginningOfWeek;
    data['language'] = this.language;
    data['image_url'] = this.imageUrl;
    data['sidebar_piechart'] = this.sidebarPiechart;
    data['at'] = this.at;
    data['created_at'] = this.createdAt;
    data['retention'] = this.retention;
    data['record_timeline'] = this.recordTimeline;
    data['render_timeline'] = this.renderTimeline;
    data['timeline_enabled'] = this.timelineEnabled;
    data['timeline_experiment'] = this.timelineExperiment;
    if (this.newBlogPost != null) {
      data['new_blog_post'] = this.newBlogPost.toJson();
    }
    data['should_upgrade'] = this.shouldUpgrade;
    data['achievements_enabled'] = this.achievementsEnabled;
    data['timezone'] = this.timezone;
    data['openid_enabled'] = this.openidEnabled;
    data['send_product_emails'] = this.sendProductEmails;
    data['send_weekly_report'] = this.sendWeeklyReport;
    data['send_timer_notifications'] = this.sendTimerNotifications;
    data['last_blog_entry'] = this.lastBlogEntry;
    if (this.workspaces != null) {
      data['workspaces'] = this.workspaces.map((v) => v.toJson()).toList();
    }
    data['duration_format'] = this.durationFormat;
    if (this.obm != null) {
      data['obm'] = this.obm.toJson();
    }
    return data;
  }
}

class NewBlogPost {
  String title;
  String url;
  String category;
  String pubDate;

  NewBlogPost({this.title, this.url, this.category, this.pubDate});

  NewBlogPost.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    category = json['category'];
    pubDate = json['pub_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['category'] = this.category;
    data['pub_date'] = this.pubDate;
    return data;
  }
}

class Workspace {
  int id;
  String name;
  int profile;
  bool premium;
  bool admin;
  int defaultHourlyRate;
  String defaultCurrency;
  bool onlyAdminsMayCreateProjects;
  bool onlyAdminsSeeBillableRates;
  bool onlyAdminsSeeTeamDashboard;
  bool projectsBillableByDefault;
  int rounding;
  int roundingMinutes;
  String apiToken;
  String at;
  bool icalEnabled;

  Workspace(
      {this.id,
      this.name,
      this.profile,
      this.premium,
      this.admin,
      this.defaultHourlyRate,
      this.defaultCurrency,
      this.onlyAdminsMayCreateProjects,
      this.onlyAdminsSeeBillableRates,
      this.onlyAdminsSeeTeamDashboard,
      this.projectsBillableByDefault,
      this.rounding,
      this.roundingMinutes,
      this.apiToken,
      this.at,
      this.icalEnabled});

  Workspace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profile = json['profile'];
    premium = json['premium'];
    admin = json['admin'];
    defaultHourlyRate = json['default_hourly_rate'];
    defaultCurrency = json['default_currency'];
    onlyAdminsMayCreateProjects = json['only_admins_may_create_projects'];
    onlyAdminsSeeBillableRates = json['only_admins_see_billable_rates'];
    onlyAdminsSeeTeamDashboard = json['only_admins_see_team_dashboard'];
    projectsBillableByDefault = json['projects_billable_by_default'];
    rounding = json['rounding'];
    roundingMinutes = json['rounding_minutes'];
    apiToken = json['api_token'];
    at = json['at'];
    icalEnabled = json['ical_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profile'] = this.profile;
    data['premium'] = this.premium;
    data['admin'] = this.admin;
    data['default_hourly_rate'] = this.defaultHourlyRate;
    data['default_currency'] = this.defaultCurrency;
    data['only_admins_may_create_projects'] = this.onlyAdminsMayCreateProjects;
    data['only_admins_see_billable_rates'] = this.onlyAdminsSeeBillableRates;
    data['only_admins_see_team_dashboard'] = this.onlyAdminsSeeTeamDashboard;
    data['projects_billable_by_default'] = this.projectsBillableByDefault;
    data['rounding'] = this.rounding;
    data['rounding_minutes'] = this.roundingMinutes;
    data['api_token'] = this.apiToken;
    data['at'] = this.at;
    data['ical_enabled'] = this.icalEnabled;
    return data;
  }
}

class Obm {
  bool included;
  int nr;
  String actions;

  Obm({this.included, this.nr, this.actions});

  Obm.fromJson(Map<String, dynamic> json) {
    included = json['included'];
    nr = json['nr'];
    actions = json['actions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['included'] = this.included;
    data['nr'] = this.nr;
    data['actions'] = this.actions;
    return data;
  }
}

class Project {
  int id;
  int wid;
  String name;
  bool billable;
  bool active;
  String at;
  String color;

  Project(
      {this.id,
      this.wid,
      this.name,
      this.billable,
      this.active,
      this.at,
      this.color});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wid = json['wid'];
    name = json['name'];
    billable = json['billable'];
    active = json['active'];
    at = json['at'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wid'] = this.wid;
    data['name'] = this.name;
    data['billable'] = this.billable;
    data['active'] = this.active;
    data['at'] = this.at;
    data['color'] = this.color;
    return data;
  }
}

class Tag {
  int id;
  int wid;
  String name;

  Tag({this.id, this.wid, this.name});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wid = json['wid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wid'] = this.wid;
    data['name'] = this.name;
    return data;
  }
}

class Task {
  String name;
  int id;
  int wid;
  int pid;
  bool active;
  String at;
  int estimatedSeconds;
  String uname;
  int doneSeconds;

  Task(
      {this.name,
      this.id,
      this.wid,
      this.pid,
      this.active,
      this.at,
      this.estimatedSeconds,
      this.uname,
      this.doneSeconds});

  Task.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    wid = json['wid'];
    pid = json['pid'];
    active = json['active'];
    at = json['at'];
    estimatedSeconds = json['estimated_seconds'];
    uname = json['uname'];
    doneSeconds = json['done_seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['wid'] = this.wid;
    data['pid'] = this.pid;
    data['active'] = this.active;
    data['at'] = this.at;
    data['estimated_seconds'] = this.estimatedSeconds;
    data['uname'] = this.uname;
    data['done_seconds'] = this.doneSeconds;
    return data;
  }
}

class Client {
  int id;
  int wid;
  int cid;
  String name;
  bool billable;
  bool isPrivate;
  bool active;
  String at;

  Client(
      {this.id,
      this.wid,
      this.cid,
      this.name,
      this.billable,
      this.isPrivate,
      this.active,
      this.at});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wid = json['wid'];
    cid = json['cid'];
    name = json['name'];
    billable = json['billable'];
    isPrivate = json['is_private'];
    active = json['active'];
    at = json['at'];
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
    data['at'] = this.at;
    return data;
  }
}
