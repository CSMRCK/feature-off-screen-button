import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  var isVisible;
  @override
  void initState() {
    super.initState();

    setState(() {
      isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          setState(() {
            if (scrollNotification.metrics.pixels > 300) {
              isVisible = true;
            } else {
              isVisible = false;
            }
          });

          return true;
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Visibility(
                    child: Container(
                      height: 300,
                      color: Colors.black45,
                    ),
                  ),
                  Container(
                    height: 600,
                    color: Colors.black26,
                  ),
                  Container(
                    height: 600,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Visibility(
                visible: isVisible,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 42,
                  color: Colors.amber,
                  child: ElevatedButton(
                      child: Text("add to basket"), onPressed: null),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
