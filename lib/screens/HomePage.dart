import 'dart:convert';
import 'package:covid19/DataBase.dart';
import 'package:covid19/Panels/infopanel.dart';
import 'package:covid19/Panels/toprecording.dart';
import 'package:covid19/Panels/worldwide.dart';
import 'package:covid19/screens/countrypage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




 String top5type = 'Deaths';
 String top5case = 'deaths';
 bool reload = false;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

 
   
  Future fetchData() async{
    fetchWorldWideData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'COVID-19 TRACKER',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                DataSource.quote,
                style: TextStyle(
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Worldwide',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CountryPage()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: primaryBlack,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Regional',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
            worldData == null
                ? Center(child: CircularProgressIndicator())
                : WorldwidePanel(
                    worldData: worldData,
                  ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Text(
                    'Countries Recording more\n$top5type',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:10),
                  child: FlatButton.icon(
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Select Type',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              FlatButton(
                                onPressed: (){
                                  setState(() {
                                    top5type = 'Cases';
                                    top5case = 'cases';
                                    reload = true;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text('Cases',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                              ),
                              FlatButton(
                                onPressed: (){
                                  setState(() {
                                    top5type = 'Deaths';
                                    top5case = 'deaths';
                                    reload = true;
                                  });
                                  fetchData();
                                  Navigator.pop(context);
                                },
                                child: Text('Deaths',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                              ),
                              FlatButton(
                                onPressed: (){
                                  setState(() {
                                    top5type = 'Active Cases';
                                    top5case = 'active';
                                    reload = true;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text('Active Cases',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                              ),
                              FlatButton(
                                onPressed: (){
                                  setState(() {
                                    top5type = 'Recoveries';
                                    top5case = 'recovered';
                                    reload = true;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text('Recoveries',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                              )
                            ],
                          ),
                        )
                      );
                    },
                    icon: Icon(Icons.filter_list),
                    label: Text('Filter',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TopRecordedPanel(),
            InfoPanel(),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              'WE ARE TOGETHER IN THE FIGHT',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
            SizedBox(
              height: 50,
            )
          ],
        )),
      ),
    );
  }

  
}