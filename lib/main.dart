import 'package:flutter/material.dart';

import 'expandable_bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'BOTTOM SHEET EXAMPLE',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                showBottomModalSheet(context);
              },
              child: Text('Modal bottom sheet', style: raisedButtonTextStyle),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                showPersistentSheet();
              },
              child:
                  Text('Persistent bottom sheet', style: raisedButtonTextStyle),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                showExpandableBottomSheet();
              },
              child:
                  Text('Expandable bottom sheet', style: raisedButtonTextStyle),
            )
          ],
        ),
      ),
    );
  }

  void showPersistentSheet() {
    _scaffoldKey.currentState!.showBottomSheet<void>((BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black)),
            color: Colors.cyanAccent),
        child: const Padding(
          padding: EdgeInsets.all(120.0),
          child: Text(
            'This is a persistent bottom sheet. Drag downwards to dismiss it.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      );
    });
  }

  final TextStyle raisedButtonTextStyle =
      const TextStyle(color: Colors.white, fontSize: 16.0, letterSpacing: 0.1);

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.pink,
    primary: Colors.pinkAccent,
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  );

  void showBottomModalSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Photo'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.music_note),
                title: const Text('Music'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.videocam),
                title: const Text('Video'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                    'Click outside of the sheet or drag down to dismiss'),
                onTap: () {},
              ),
            ],
          );
        });
  }

  void showExpandableBottomSheet() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ExpandableBottomSheetExample()),
    );
    // ExpandableBottomSheet(
    //   background: Container(
    //     color: Colors.red,
    //     child: const Center(
    //       child: Text('Background'),
    //     ),
    //   ),
    //   persistentHeader: Container(
    //     height: 40,
    //     color: Colors.blue,
    //     child: const Center(
    //       child: Text('Header'),
    //     ),
    //   ),
    //   expandableContent: Container(
    //     height: 500,
    //     color: Colors.green,
    //     child: const Center(
    //       child: Text('Content'),
    //     ),
    //   ),
    // );
  }
}
