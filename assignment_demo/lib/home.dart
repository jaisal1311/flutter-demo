import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  List allCountries;
  Map indiaData;
  final List<String> listItems = [];

  Home({Key key, this.allCountries, this.indiaData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < 500; i++) {
      listItems.add('Item ${i}');
    }

    return DefaultTabController(
        length: 2,
        child: new Scaffold(
          body: new NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  title: Text("Covid Tracker"),
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
                      new Tab(child: Text('WORLD-WIDE', style: TextStyle(fontSize: 20),),),
                      new Tab(child: Text('INDIA', style: TextStyle(fontSize: 20),),),
                    ],
                  ),
                ),
              ];
            },
            body: new TabBarView(
              children: [
                ListView.builder(
                  itemCount: listItems.length,
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
                                              TextSpan(text: allCountries[index]['cases'].toString()),
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
                                              TextSpan(text: allCountries[index]['active'].toString()),
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
                                              TextSpan(text: allCountries[index]['recovered'].toString()),
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
                                              TextSpan(text: allCountries[index]['deaths'].toString()),
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
                Container(
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
                                  Text(indiaData['cases'].toString(), style: TextStyle(letterSpacing: 1.5, color: Colors.red[600]),),
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
                                  Text(indiaData['active'].toString(), style: TextStyle(letterSpacing: 1.5, color: Colors.blue[600]),),
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
                                  Text(indiaData['active'].toString(), style: TextStyle(letterSpacing: 1.5, color: Colors.green[600]),),
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
                                  Text(indiaData['deaths'].toString(), style: TextStyle(letterSpacing: 1.5, color: Colors.grey[600]),),
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