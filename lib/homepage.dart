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
          return Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFAC00),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'You saved',
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
                        ),
                        Text(
                          '23Kg',
                          style:
                              TextStyle(fontSize: 40, color: Color(0xFFFFFFFF)),
                        ),
                        Text(
                          'CO2',
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 17),
                  Text(
                    '=',
                    style: TextStyle(fontSize: 40, color: Color(0xFF120E4C)),
                  ),
                  SizedBox(width: 17),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFAC00),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '1km',
                          style:
                              TextStyle(fontSize: 40, color: Color(0xFFFFFFFF)),
                        ),
                        Text('by car',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFFFFFFFF))),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF1D2637),
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0))),
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
                            title: Text(
                              "${app.appName}",
                              style: TextStyle(color: Color(0xFFFFFFFF)),
                            ),
                          ),
                          Divider(
                            height: 1.0,
                          )
                        ],
                      );
                    },
                    itemCount: apps.length,
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
