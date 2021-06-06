import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/product.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  //  DietDay _dietDay= DietDay(id: id, date: date, mealsDay: mealsDay);
  var _dietDay = DietDay();

  Future getDietDay() async {
    final response = await http.get(
      Uri.parse('https://test-api.myproportion.com/api/v1/public/diet-for-ada'),
    );

    if (response.statusCode == 200) {
      // Map<String, dynamic> dietDayMap = jsonDecode(response.body);
      // return DietDay.fromJson(dietDayMap);
    } else {
      throw ("Response error.");
    }
  }

  @override
  void initState() {
    getDietDay().then((value) {
      setState(() {
        _dietDay = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My menu for today'),
        ),
        body: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${_dietDay.mealsDay![index].id}'),
              );
            },
            itemCount: _dietDay.mealsDay!.length,
          ),
        ));
  }
}
