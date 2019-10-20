import 'package:rxdart/rxdart.dart';

import '../model/model.dart';
import '../network/api_service.dart';

class ProjectBloc {
  Project project = Project();
  Client client = Client();

  final _projectFetcher = PublishSubject<Project>();
  final _clientFetcher = PublishSubject<Client>();

  Observable<Project> get projectStream => _projectFetcher.stream;
  Observable<Client> get clientStream => _clientFetcher.stream;

  void fetchProject(int projectId) async {
    if (projectId != null) {
      project = await ApiService.instance.fetchProject(projectId);
    }
    _projectFetcher.sink.add(project);
  }

  void fetchClient(int clientId) async {
    if (clientId != null) {
      client = await ApiService.instance.fetchClient(clientId);
    }
    _clientFetcher.sink.add(client);
  }

  void dispose() {
    _projectFetcher.close();
    _clientFetcher.close();
  }
}
