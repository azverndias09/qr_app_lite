// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:inspirathon/pages/home_page.dart';
import 'package:quantity_input/quantity_input.dart';

class CheckOutPage extends StatefulWidget {
  static String id = "cart page";

  CheckOutPage({
    Key? key,
    required this.name,
  });
  final String name;

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  int simpleIntInput = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        title: Text('Cart Page'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          // child: appLogo,
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        child: Column(
          children: [
            Center(child: Text(widget.name)),
            Center(child: Text('sexy')),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     height: 80,
            //     width: 80,
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: NetworkImage(
            //                 widget.locationDataModel!.img.toString()))),
            //   ),
            // ),
            QuantityInput(
                value: simpleIntInput,
                onChanged: (value) => setState(() =>
                    simpleIntInput = int.parse(value.replaceAll(',', '')))),
            SizedBox(height: 10),
            Text('Number of Tickets: $simpleIntInput',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Container(),
          ],
        ),
      ),
    );
  }
}
