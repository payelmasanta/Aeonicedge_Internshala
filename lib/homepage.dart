import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String username0 = "", details0 = "";
  String username1 = "", details1 = "";
  String username2 = "", details2 = "";
  String username3 = "", details3 = "";
  String username4 = "", details4 = "";
  bool isData = false, load = false;

  void initState() {
    super.initState();
    FetchJSON();
  }

  FetchJSON() async {
    setState(() {
      load = true;
    });
    var Response = await http.get(
      "https://gist.githubusercontent.com/payelmasanta/645b06524a20d7f1a8e82886863cbeda/raw/a83300e3542c1c2a9947809771699a2c16859eef/Aeonicedge.json",
      headers: {"Accept": "application/json"},
    );
    if (Response.statusCode == 200) {
      String responseBody = Response.body;
      var responseJSON = json.decode(responseBody);

      username0 = responseJSON['0']["name"];
      details0 = responseJSON['0']["detail"];
      username1 = responseJSON['1']["name"];
      details1 = responseJSON['1']["detail"];
      username2 = responseJSON['2']["name"];
      details2 = responseJSON['2']["detail"];
      username3 = responseJSON['3']["name"];
      details3 = responseJSON['3']["detail"];
      username4 = responseJSON['4']["name"];
      details4 = responseJSON['4']["detail"];

      isData = true;
      setState(() {
        print('UI Updated');
      });
    } else {
      print('Something went wrong. \nResponse Code : ${Response.statusCode}');
    }
    setState(() {
      load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Logo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.search),
          )
        ],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 30,
              color: Color(0xff89d0f0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              height: 160,
              decoration: BoxDecoration(
                  color: Color(0xff89d0f0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200),
                  )),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset('assets/peop1.jpg')),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Ramdom Name',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'email@email.com',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Color(0xff89d0f0),
                  size: 30,
                ),
                title: Text(
                  '|    Home',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onTap: () {},
              ),
            ),
            ListTile(
              leading: Container(
                child: Image.asset('assets/medi.png'),
                height: 25,
                width: 30,
              ),
              title: Text(
                '|    View Medical Data',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Container(
                child: Image.asset('assets/medi1.png'),
                height: 25,
                width: 30,
              ),
              title: Text(
                '|    Add Medical Data',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: Color(0xff89d0f0),
                size: 30,
              ),
              title: Text(
                '|    Tip of the Day',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.mail_outline,
                color: Color(0xff89d0f0),
                size: 30,
              ),
              title: Text(
                '|    Contact us',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.chrome_reader_mode,
                color: Color(0xff89d0f0),
                size: 30,
              ),
              title: Text(
                '|    Tutorials',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ListTile(
                title: Container(
                  width: 250,
                  child: FlatButton(
                      color: Color(0xff89d0f0),
                      onPressed: () {},
                      child: Text(
                        'LOGOUT',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ),
            ListTile(
              title: Container(
                height: 100,
                width: 150,
                child: Image.asset('assets/bm.png'),
              ),
            )
          ],
        ),
      ),
      body: load
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  cards(username0, details0),
                  SizedBox(
                    height: 10,
                  ),
                  cards(username1, details1),
                  SizedBox(
                    height: 10,
                  ),
                  cards(username2, details2),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Image.asset('assets/1.jpg'),
                  ),
                  cards(username3, details3),
                  SizedBox(
                    height: 10,
                  ),
                  cards(username4, details4),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff89d0f0),
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }

  Widget cards(name, det) {
    return Container(
      height: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '$name   ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '|  $det',
                    style: TextStyle(
                        color: Color(0xff89d0f0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'HSB Clinic & Research Center',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'A prescription is an order for medicine which a doctor writes, and which is given...',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
