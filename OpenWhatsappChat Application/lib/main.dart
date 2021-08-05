import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final mobno = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    mobno.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///TextEditingController mobno;
    String number;
    return Scaffold(
        appBar: AppBar(
          title: Text("Open WhatsApp Chat"),
          backgroundColor: Colors.cyan,
        ),
        body: Container(
          child: Form(
              child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0, right: 14, left: 14, bottom: 8),
                  child: TextFormField(
                    controller: mobno,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      hintText: "Enter Number",
                      prefixIcon: Icon(
                        Icons.mobile_friendly_outlined,
                        color: Colors.black,
                        size: 40.0,
                      ),
                      hintStyle: TextStyle(fontSize: 15),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    ),
                    onChanged: (value) {
                      setState(() {
                        number = value.trim();
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  child: Container(
                      width: MediaQuery.of(this.context).size.width / 2.8,
                      height: MediaQuery.of(this.context).size.height / 15,
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange[300]),
                      child: Center(
                          child: Wrap(
                        children: <Widget>[
                          Text(
                            'Send',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ))),
                  onTap: () {
                    FlutterOpenWhatsapp.sendSingleMessage(
                        "91" + "${mobno.text}", "Hi");
                  },
                ),
              ],
            ),
          )),
        ));
  }
}
