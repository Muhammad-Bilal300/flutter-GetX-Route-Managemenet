import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      getPages: [
        GetPage(name: "/course-page", page: () => PageThree()),
        GetPage(name: "/page-four/:data", page: () => PageFour()),
        // GetPage(name: "/course-page", page: ()=>PageThree()),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Home Page",
              style: TextStyle(fontSize: 25, color: Colors.red),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  text: "Go to Page One",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(() => PageOne()),
                  style: TextStyle(color: Colors.grey, fontSize: 30)),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => PageOne());
                },
                child: Text("Go to Page One")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => PageTwo(), arguments: {
                    "price": Random().nextInt(10000).toString(),
                    "text":
                        "The course price price is USD ${Random().nextInt(10000).toString()}"
                  });
                },
                child: Text("Go to Page Two")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/course-page", arguments: {
                    "price": Random().nextInt(100).toString(),
                  });
                },
                child: Text("Go to Page Three")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/page-four/${Random().nextInt(100).toString()}");
                  // arguments: {
                  //   "price":Random().nextInt(100).toString(),
                  // }
                },
                child: Text("Go to Page Four")),
          ],
        ),
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page One"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Page One",
              style: TextStyle(fontSize: 25, color: Colors.red),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Go back"))
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Two"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Page Two",
              style: TextStyle(fontSize: 25, color: Colors.red),
            ),
            Text(
              Get.arguments["price"] ?? "Null",
              style: TextStyle(fontSize: 25, color: Colors.red),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                Get.arguments["text"] ?? "Null",
                style: TextStyle(fontSize: 25, color: Colors.red),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Go back"))
          ],
        ),
      ),
    );
  }
}

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Welcome to the Course Page",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
            Text(
              "The price of USD " + Get.arguments["price"],
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageFour extends StatefulWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  _PageFourState createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Four"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Welcome to the Page Four",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
            Text(
              "The price of USD " + Get.arguments["data"],
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
