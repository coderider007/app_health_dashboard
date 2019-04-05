import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './../models/app_status_model.dart';
import '../utils/utils.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:async';

class StatusCard extends StatefulWidget {
  final AppStatus appStatus;
  StatusCard({this.appStatus});

  @override
  _StatusCardState createState() => _StatusCardState(appStatus: appStatus);
}

class _StatusCardState extends State<StatusCard> {
  AppStatus appStatus;
  bool isLoading = false;
  _StatusCardState({this.appStatus});

  getHealthStatus(String appId) {
    return isLoading
        ? null
        : () => {
              setState(() {
                isLoading = true;
              }),
              getResults(appId)
            };
  }

  void getResults(String appId) async {
    // call rest API to fetch the latest result for the provided application id and set the state
    // the circulat progress bar to be handled here
    await new Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
        appStatus.time =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      });
    });
  }

  showMore(String detailsHtml) {
    return isLoading
        ? null
        : () => showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Html(
                                  data: appStatus.detailsHtml,
                                ),
                              );
                            },
                            itemCount: 1),
                      ),
                    ],
                  ),
                );
              },
            );
  }

  Widget loadCardHeader() {
    return ListTile(
      title: Text(this.appStatus.appName),
      subtitle: Text('Result time: ' +
          (isLoading ? 'yyyy-MM-dd HH:mm:ss' : this.appStatus.time)),
      trailing: getStatus(isLoading ? 0 : this.appStatus.status),
    );
  }

  Widget loadCardBody() {
    return isLoading
        ? CircularProgressIndicator()
        : ListTile(
            title: Text(this.appStatus.discription),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          loadCardHeader(),
          loadCardBody(),
          ButtonTheme.bar(
            // make buttons use the appropriate styles for cards
            child: ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.more,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text(
                          'More',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      )
                    ],
                  ),
                  onPressed: showMore(this.appStatus.detailsHtml),
                ),
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.refresh,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text(
                          'Reload',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      )
                    ],
                  ),
                  onPressed: getHealthStatus(this.appStatus.appId),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
