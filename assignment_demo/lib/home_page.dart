import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List countryData;

  fetchCountryData() async {
    http.Response response = await http.get(
        'https://corona.lmao.ninja/v2/countries?sort=deaths');
    setState(() {
      countryData = json.decode(response.body);
    });
    print(countryData[0]['country']);
  }


  @override
  void initState() {
    fetchCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Covid Tracker'),
              pinned: true,
              floating: false,
              expandedHeight: 200,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: 'One',),
                  Tab(text: 'Two',),
                ],
              ),
              flexibleSpace:FlexibleSpaceBar(
                background: Image.network(
                  'https://cdn.pixabay.com/photo/2020/03/16/16/29/virus-4937553__340.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: 250
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
