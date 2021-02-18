import 'package:bledi/API/driver.Model.dart';
import 'package:bledi/constants.dart';
import 'package:flutter/material.dart';

class DriverDetailsPage extends StatefulWidget {
  final Driver driver;

  const DriverDetailsPage({Key key, this.driver}) : super(key: key);

  @override
  _DriverDetailsPageState createState() => _DriverDetailsPageState();
}

class _DriverDetailsPageState extends State<DriverDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('driver details page'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (builder) => bottomSheet());
          },
          child: Icon(
            Icons.call,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                api_base_url + widget.driver.profileImage.url,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Name:  ' + widget.driver.name),
                        Text('Email:  ' + widget.driver.email),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.driver.descriptions,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

Widget bottomSheet() {
  return Container(
    height: 165,
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
                iconCreation(Icons.sms, Colors.orange, 'SMS'),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.email, Colors.teal, 'Email'),
                SizedBox(
                  width: 40,
                ),
                iconCreation(
                  Icons.call,
                  Colors.blue,
                  'Telephone',
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget iconCreation(
  IconData icon,
  Color color,
  String text,
) {
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
