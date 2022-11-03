// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inspirathon/pages/checkOut_page.dart';
import 'package:inspirathon/pages/home_page.dart';
import 'package:inspirathon/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationDetail extends StatefulWidget {
  static String id = 'location detail page';
  final LocationDataModel? locationDataModel;
  const LocationDetail({
    Key? key,
    this.locationDataModel,
  });

  @override
  State<LocationDetail> createState() => _LocationDetailState();
}

class _LocationDetailState extends State<LocationDetail> {
  //function to get locally stored user ID
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          // child: appLogo,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange[600],
      ),
      //Display Agent Details
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
              child: Text(
                'Location Detail',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            widget.locationDataModel!.img.toString()))),
              ),
            ),
//Name tile
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                tileColor: Colors.orange.shade300,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 2, top: 6),
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    'Name:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(widget.locationDataModel!.name.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ),
              ),
            ),
//email tile
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                tileColor: Colors.orange.shade300,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 6),
                  child: Icon(
                    Icons.email,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    'Email:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    widget.locationDataModel!.desc.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
//phone tile
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                // shape: roundedRectangleBorder,
                tileColor: Colors.orange.shade300,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 6),
                  child: Icon(
                    Icons.phone,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    'Phone:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    widget.locationDataModel!.locality.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
//location tile
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                // shape: roundedRectangleBorder,
                tileColor: Colors.orange.shade300,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 6),
                  child: Icon(
                    Icons.location_on_sharp,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    'Location:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    widget.locationDataModel!.ratings.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  var name = widget.locationDataModel!.name.toString();
                  var img = widget.locationDataModel!.img.toString();
                  //checks if valid user by auth in API
                  String? token = '';
                  await getToken().then((result) {
                    token = result;
                  });
                  if (token != null) {
                    Navigator.pushNamed(context, CheckOutPage.id);
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Please Login Before Booking!'),
                      ),
                      barrierDismissible: true,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckOutPage(name: name)));
                  }
                },
                child: Text('Book Now!'))
          ],
        ),
      ),
    );
  }
}
