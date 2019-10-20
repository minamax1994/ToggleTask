class LoginResponse {
  int since;
  LoginResponseData data;

  LoginResponse({this.since, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    since = json['since'];
    data = json['data'] != null ? new LoginResponseData.fromJson(json['data']) : null;
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

class LoginResponseData {
  int id;
  String apiToken;
  int defaultWid;
  String email;
  String fullnaLogin;
  String jqueryTiLoginofdayFormat;
  String jqueryDateFormat;
  String tiLoginofdayFormat;
  String dateFormat;
  bool storeStartAndStopTiLogin;
  int beginningOfWeek;
  String language;
  String imageUrl;
  bool sidebarPiechart;
  String at;
  String createdAt;
  int retention;
  bool recordTiLoginline;
  bool renderTiLoginline;
  bool tiLoginlineEnabled;
  bool tiLoginlineExperiLoginnt;
  bool shouldUpgrade;
  bool achieveLoginntsEnabled;
  String tiLoginzone;
  bool openidEnabled;
  bool sendProductEmails;
  bool sendWeeklyReport;
  bool sendTiLoginrNotifications;
  String lastBlogEntry;
  List<Workspace> workspaces;
  String durationFormat;

  LoginResponseData(
      {this.id,
      this.apiToken,
      this.defaultWid,
      this.email,
      this.fullnaLogin,
      this.jqueryTiLoginofdayFormat,
      this.jqueryDateFormat,
      this.tiLoginofdayFormat,
      this.dateFormat,
      this.storeStartAndStopTiLogin,
      this.beginningOfWeek,
      this.language,
      this.imageUrl,
      this.sidebarPiechart,
      this.at,
      this.createdAt,
      this.retention,
      this.recordTiLoginline,
      this.renderTiLoginline,
      this.tiLoginlineEnabled,
      this.tiLoginlineExperiLoginnt,
      this.shouldUpgrade,
      this.achieveLoginntsEnabled,
      this.tiLoginzone,
      this.openidEnabled,
      this.sendProductEmails,
      this.sendWeeklyReport,
      this.sendTiLoginrNotifications,
      this.lastBlogEntry,
      this.workspaces,
      this.durationFormat});

  LoginResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    apiToken = json['api_token'];
    defaultWid = json['default_wid'];
    email = json['email'];
    fullnaLogin = json['fullnaLogin'];
    jqueryTiLoginofdayFormat = json['jquery_tiLoginofday_format'];
    jqueryDateFormat = json['jquery_date_format'];
    tiLoginofdayFormat = json['tiLoginofday_format'];
    dateFormat = json['date_format'];
    storeStartAndStopTiLogin = json['store_start_and_stop_tiLogin'];
    beginningOfWeek = json['beginning_of_week'];
    language = json['language'];
    imageUrl = json['image_url'];
    sidebarPiechart = json['sidebar_piechart'];
    at = json['at'];
    createdAt = json['created_at'];
    retention = json['retention'];
    recordTiLoginline = json['record_tiLoginline'];
    renderTiLoginline = json['render_tiLoginline'];
    tiLoginlineEnabled = json['tiLoginline_enabled'];
    tiLoginlineExperiLoginnt = json['tiLoginline_experiLoginnt'];
    shouldUpgrade = json['should_upgrade'];
    achieveLoginntsEnabled = json['achieveLoginnts_enabled'];
    tiLoginzone = json['tiLoginzone'];
    openidEnabled = json['openid_enabled'];
    sendProductEmails = json['send_product_emails'];
    sendWeeklyReport = json['send_weekly_report'];
    sendTiLoginrNotifications = json['send_tiLoginr_notifications'];
    lastBlogEntry = json['last_blog_entry'];
    if (json['workspaces'] != null) {
      workspaces = new List<Workspace>();
      json['workspaces'].forEach((v) {
        workspaces.add(new Workspace.fromJson(v));
      });
    }
    durationFormat = json['duration_format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['api_token'] = this.apiToken;
    data['default_wid'] = this.defaultWid;
    data['email'] = this.email;
    data['fullnaLogin'] = this.fullnaLogin;
    data['jquery_tiLoginofday_format'] = this.jqueryTiLoginofdayFormat;
    data['jquery_date_format'] = this.jqueryDateFormat;
    data['tiLoginofday_format'] = this.tiLoginofdayFormat;
    data['date_format'] = this.dateFormat;
    data['store_start_and_stop_tiLogin'] = this.storeStartAndStopTiLogin;
    data['beginning_of_week'] = this.beginningOfWeek;
    data['language'] = this.language;
    data['image_url'] = this.imageUrl;
    data['sidebar_piechart'] = this.sidebarPiechart;
    data['at'] = this.at;
    data['created_at'] = this.createdAt;
    data['retention'] = this.retention;
    data['record_tiLoginline'] = this.recordTiLoginline;
    data['render_tiLoginline'] = this.renderTiLoginline;
    data['tiLoginline_enabled'] = this.tiLoginlineEnabled;
    data['tiLoginline_experiLoginnt'] = this.tiLoginlineExperiLoginnt;
    data['should_upgrade'] = this.shouldUpgrade;
    data['achieveLoginnts_enabled'] = this.achieveLoginntsEnabled;
    data['tiLoginzone'] = this.tiLoginzone;
    data['openid_enabled'] = this.openidEnabled;
    data['send_product_emails'] = this.sendProductEmails;
    data['send_weekly_report'] = this.sendWeeklyReport;
    data['send_tiLoginr_notifications'] = this.sendTiLoginrNotifications;
    data['last_blog_entry'] = this.lastBlogEntry;
    if (this.workspaces != null) {
      data['workspaces'] = this.workspaces.map((v) => v.toJson()).toList();
    }
    data['duration_format'] = this.durationFormat;
    return data;
  }
}

class Workspace {
  int id;
  String naLogin;
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
      this.naLogin,
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
    naLogin = json['naLogin'];
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
    data['naLogin'] = this.naLogin;
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
