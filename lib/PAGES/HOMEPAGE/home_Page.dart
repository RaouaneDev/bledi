import 'package:bledi/API/driver.Model.dart';
import 'package:bledi/PAGES/HOMEPAGE/driversDetailsPage.dart';
import 'package:bledi/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME PAGE'),
      ),
      body: Center(
        child: FutureBuilder<List<Driver>>(
          future: fetchDriversData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Driver> drivers = snapshot.data;
              print(drivers);
              return ListView(
                children: drivers
                    .map(
                      (driver) => Card(
                        elevation: 9,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DriverDetailsPage(
                                          driver: driver,
                                        )));
                          },
                          child: ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(driver.image.url),
                              ),
                            ),
                            title: Text(
                              driver.name,
                            ),
                            subtitle: Text(driver.email),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.phone,
                                color: Colors.green,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<List<Driver>> fetchDriversData() async {
  final response =
      await http.get('https://bledibaguages.herokuapp.com/drivers');

  if (response.statusCode == 200) {
    List drivers = json.decode(response.body);
    return drivers.map((e) => Driver.fromJson(e)).toList();
  }
  return null;
}

Widget bottomSheet() {
  return Container(
    height: 278,
    width: double.infinity,
    child: Card(
      margin: EdgeInsets.all(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconCreation(
                    Icons.insert_drive_file, Colors.indigo, 'Documents'),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.camera_alt, Colors.pink, 'camera'),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.insert_photo, Colors.purple, 'Gallery'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconCreation(Icons.headset, Colors.orange, 'audio'),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.location_pin, Colors.teal, 'location'),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.person, Colors.blue, 'contact'),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget iconCreation(IconData icon, Color color, String text) {
  return InkWell(
    onTap: () {},
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(
            icon,
            color: Colors.white,
            size: 29,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(text),
      ],
    ),
  );
}
