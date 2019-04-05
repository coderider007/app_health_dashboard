import 'package:flutter/material.dart';
import './status_card.dart';
import './../models/app_status_model.dart';

class DashboardHome extends StatelessWidget {
  List<Widget> getCards(List<AppStatus> appStatusList) {
    return appStatusList
        .map((appStatus) => Padding(
              padding:
                  EdgeInsets.only(top: 5.0, bottom: 5.0, left: 2.0, right: 2.0),
              child: StatusCard(appStatus: appStatus),
            ))
        .toList();
  }

  Future<List<AppStatus>> getHealhAll() {
    List<AppStatus> appStatusList = List.generate(
      5,
      (i) => AppStatus(
          appId: 'appid_$i',
          appName: 'Dummy App Name',
          discription:
              'The dummy description of application can be found here!!!',
          detailsHtml: '''
                          <h3 style="color:blue;">Current Health Status</h3> 
                          <p>The dummy html description will be shown here. The dummy html description will be shown here</p>
                          <h4>Health param 1</h4> 
                          <p>The health pramater 1 description will be shown here. The health pramater 1 description will be shown here.</p>
                          <h4>Health param 2</h4> 
                          <p>The health pramater 2 description will be shown here. The health pramater 2 description will be shown here.</p>
                          <h4>Health param 3</h4> 
                          <p>The health pramater 3 description will be shown here. The health pramater 3 description will be shown here.</p>
                          <h4>Health param 4</h4> 
                          <p>The health pramater 4 description will be shown here. The health pramater 4 description will be shown here.</p>
                       ''',
          status: i + 1,
          time: 'yyyy-MM-dd HH:mm:ss',
          logo: 'URL for logo comes here'),
    );

    return Future<List<AppStatus>>.value(appStatusList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Dashboard'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: FutureBuilder<List<AppStatus>>(
            future: getHealhAll(),
            builder: (context, snapshot) {
              // callAPI();
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error");
                }
                return ListView(
                  children: getCards(snapshot.data),
                );
              } else
                return CircularProgressIndicator();
            }),
      ),
    );
  }
}
