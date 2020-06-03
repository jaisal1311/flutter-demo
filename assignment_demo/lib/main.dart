import 'package:flutter/material.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spring Edge',
      debugShowCheckedModeBanner: false,
      home: PreHome(),
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
      ),
    );
  }
}
class PreHome extends StatefulWidget {
  @override
  _PreHomeState createState() => _PreHomeState();
}

class _PreHomeState extends State<PreHome> {

  List allCountries;

  fetchCountryData() async {
    http.Response response = await http.get(
        'https://corona.lmao.ninja/v2/countries?sort=deaths');
    setState(() {
      allCountries = json.decode(response.body);
    });
    print(allCountries[0]['country']);
  }

  Map indiaData;

  fetchIndiaData() async {
    http.Response response = await http.get(
        'https://disease.sh/v2/countries/India?yesterday=false');
    setState(() {
      indiaData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCountryData();
    fetchIndiaData();
  }

  @override
  Widget build(BuildContext context) {
    return Home(allCountries: allCountries,indiaData: indiaData,);
  }
}

