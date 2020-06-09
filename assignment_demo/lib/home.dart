import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {

  List allCountries;

  fetchCountryData() async {
    http.Response response = await http.get(
        'https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      allCountries = json.decode(response.body);
    });
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

    return DefaultTabController(
        length: 2,
        child: new Scaffold(
          body: new NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  title: Text("Covid Tracker", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 30,),textAlign: TextAlign.center,),
                  floating: true,
                  pinned: true,
                  snap: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network('https://cdn.pixabay.com/photo/2020/03/16/16/29/virus-4937553__340.jpg', width: MediaQuery.of(context).size.width,),
                  ),
                  expandedHeight: 200
                  ,
                  bottom: new TabBar(
                    tabs: [
                      new Tab(child: Text('WORLD-WIDE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
                      new Tab(child: Text('INDIA', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
                    ],
                  ),
                ),
              ];
            },
            body: new TabBarView(
              children: [
                allCountries == null || indiaData == null ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SpinKitWanderingCubes(
              color: Colors.white,
              size: 50.0,
            ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Testing the suspects...', style: TextStyle(letterSpacing: 2.0, fontSize: 20),),
                    )
                  ],
                ) : ListView.builder(
                  itemCount: allCountries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ExpansionTile(
                        title:Text(allCountries[index]['country'], style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),),
                        leading: Image.network(
                          allCountries[index]['countryInfo']['flag'],
                          height: 50, width: 60,),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child:Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan(
                                            style: TextStyle(color: Colors.red[500], letterSpacing: 1.5),
                                            children: <TextSpan>[
                                              TextSpan(text: 'CONFIRMED: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                              TextSpan(text: allCountries[index]['cases'].toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan(
                                            style: TextStyle(color: Colors.blue[500], letterSpacing: 1.5),
                                            children: <TextSpan>[
                                              TextSpan(text: 'ACTIVE: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                              TextSpan(text: allCountries[index]['active'].toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(color: Colors.green[500], letterSpacing: 1.5),
                                            children: <TextSpan>[
                                              TextSpan(text: 'RECOVERED: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                              TextSpan(text:allCountries[index]['recovered'].toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(color: Colors.grey[500], letterSpacing: 1.5),
                                            children: <TextSpan>[
                                              TextSpan(text: 'DECEASED: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                              TextSpan(text: allCountries[index]['deaths'].toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),
                            ],
                        initiallyExpanded: false,
                      ),
                    );
                  },
                ),
                allCountries == null || indiaData == null ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SpinKitWanderingCubes(
                      color: Colors.white,
                      size: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Testing the suspects...', style: TextStyle(letterSpacing: 2.0, fontSize: 20),),
                    )
                  ],
                ): Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
//                          color: Colors.red[200],
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Text('CONFIRMED: ', style: TextStyle(letterSpacing: 1.5,fontSize: 24, color: Colors.red[600])),
                                  Text(indiaData['cases'].toString(), style: TextStyle(letterSpacing: 1.5, fontSize: 24, color: Colors.red[600]),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
//                          color: Colors.blue[200],
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Text('ACTIVE: ', style: TextStyle(letterSpacing: 1.5,fontSize: 24, color: Colors.blue[600]),),
                                  Text(indiaData['active'].toString(), style: TextStyle(letterSpacing: 1.5, fontSize: 24, color: Colors.blue[600]),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
//                          color: Colors.green[200],
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Text('RECOVED: ', style: TextStyle(letterSpacing: 1.5, fontSize: 24,color: Colors.green[600]),),
                                  Text(indiaData['active'].toString(), style: TextStyle(letterSpacing: 1.5, fontSize: 24, color: Colors.green[600]),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
//                          color: Colors.grey[300],
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Text('DECEASED: ', style: TextStyle(letterSpacing: 1.5, fontSize: 24,color: Colors.grey[600]),),
                                  Text(indiaData['deaths'].toString(), style: TextStyle(letterSpacing: 1.5, fontSize: 24, color: Colors.grey[600]),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}