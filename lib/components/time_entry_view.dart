import 'package:flutter/material.dart';
import 'package:toggle_task/functions/seconds_to_time_string.dart';

import '../model/model.dart';
import '../bloc/project_bloc.dart';

class TimeEntryView extends StatefulWidget {
  final TimeEntry timeEntry;

  TimeEntryView(this.timeEntry);

  @override
  _TimeEntryViewState createState() => _TimeEntryViewState();
}

class _TimeEntryViewState extends State<TimeEntryView> {
  ProjectBloc projectBloc = ProjectBloc();
  @override
  void initState() {
    projectBloc.fetchProject(widget.timeEntry.pid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Project>(
      stream: projectBloc.projectStream,
      builder: (BuildContext context, AsyncSnapshot<Project> projectSnapshot) {
        if (projectSnapshot.hasData) {
          projectBloc.fetchClient(projectSnapshot.data.data.cid);
          String hexColor = 'ff0000';
          if (projectSnapshot.data.data.hexColor != null) {
            hexColor = projectSnapshot.data.data.hexColor.replaceAll("#", "");
          }
          return _buildTimeEntry(projectSnapshot, hexColor);
        } else if (widget.timeEntry.pid == null) {
          return _buildNoProjectTimeEntry();
        } else {
          return _buildLoadingTimeEntry();
        }
      },
    );
  }

  Widget _buildTimeEntry(
      AsyncSnapshot<Project> projectSnapshot, String hexColor) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                widget.timeEntry.description != null
                    ? widget.timeEntry.description
                    : 'No Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                secondsToTimeString(widget.timeEntry.duration),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(
                    projectSnapshot.data.data.name != null
                        ? projectSnapshot.data.data.name
                        : 'No Project',
                    style: TextStyle(
                        color: Color(int.parse('FF' + hexColor, radix: 16))),
                  ),
                  SizedBox(width: 5),
                  projectSnapshot.data.data.cid != null
                      ? StreamBuilder<Client>(
                          stream: projectBloc.clientStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<Client> clientSnapshot) {
                            if (clientSnapshot.hasData) {
                              return Text(
                                clientSnapshot.data.data.name != null
                                    ? clientSnapshot.data.data.name
                                    : 'No Client',
                                style: TextStyle(color: Colors.grey),
                              );
                            } else {
                              return Container();
                            }
                          })
                      : Text(
                          'No Client',
                          style: TextStyle(color: Colors.grey),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoProjectTimeEntry() {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                widget.timeEntry.description != null
                    ? widget.timeEntry.description
                    : 'No Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                secondsToTimeString(widget.timeEntry.duration),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(
                    'No Project',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingTimeEntry() {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Center(
        heightFactor: 2,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
