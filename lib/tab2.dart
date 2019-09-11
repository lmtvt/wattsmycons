import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Application> apps;

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
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF1D2637),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0))),
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
                              subtitle: Text('0.65 kw', style: TextStyle(color: Color(0xFFFFFFFF))),
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
              );
            }
          },
    );
  }
}
