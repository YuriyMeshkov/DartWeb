import 'package:flutter/material.dart';

import 'pages/brokers/screens/brokers_screen.dart';

class MyWebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BrokersScreen(),
      /*initialRoute: LoginScreen.id,
      onGenerateRoute: (settings) {
        print('==== ${settings.name}');
        switch (settings.name) {
          default:
            return MaterialPageRoute(builder: (context) => Text('WEB'));
            //return MaterialPageRoute(builder: (context) => BrokersScreen());
        }
      },*/
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text('Test'),
    );
//      Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'Test for me',
//            ),
//          ],
//        ),
//      ),
//    );
  }
}
