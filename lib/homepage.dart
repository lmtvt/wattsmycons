import 'package:flutter/material.dart';
import 'main.dart';

import 'package:device_apps/device_apps.dart';

class HomePageState extends State<HomePage> {
  List<Application> apps;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DeviceApps.getInstalledApplications(
          includeAppIcons: true,
          includeSystemApps: false,
          onlyAppsWithLaunchIntent: false),
      builder: (context, data) {
        if (data.data == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          List<Application> apps = data.data;
          print(apps);
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFFe3dede),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'You saved',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('23Kg', style: TextStyle(fontSize: 40)),
                          Text('CO2', style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                    SizedBox(width: 50),
                    Container(
                      width: 120,
                      height: 120,
                      color: Color(0xFFe3dede),
                      child: Column(
                        children: <Widget>[
                          Text('=', style: TextStyle(fontSize: 20)),
                          Text('1km', style: TextStyle(fontSize: 40)),
                          Text('by car', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, position) {
                      Application app = apps[position];
                      return Column(
                        children: <Widget>[
                          ListTile(
                              leading: app is ApplicationWithIcon
                                  ? CircleAvatar(
                                      backgroundImage: MemoryImage(app.icon),
                                      backgroundColor: Colors.white,
                                    )
                                  : null,
                              title:
                                  Text("${app.appName} (${app.packageName})"),
                              subtitle: Text(
                                  "Version: ${app.versionName}\nSystem app: ${app.systemApp}\nData dir : ${app.dataDir}")),
                          Divider(
                            height: 1.0,
                          )
                        ],
                      );
                    },
                    itemCount: apps.length,
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
