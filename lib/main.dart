import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alternate icons',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Alternate icons'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String currentIcon;
  static const iconChannels =
      MethodChannel('io.coderreview.alternate_icons/changeIcon');

  Future<void> _onTap(String selectedIcon, BuildContext context) async {
    await _MyHomePageState.iconChannels
        .invokeMethod('changeIcon', {'selectedIcon': selectedIcon});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: [
            ListTile(
              title: const Text("Light"),
              leading: Image.asset('assets/images/light.png'),
              onTap: () => _onTap('light', context),
              // tileColor: currentIcon == 'light' ? Colors.blue : null,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text("Dark"),
              leading: Image.asset('assets/images/dark.png'),
              onTap: () => _onTap('dark', context),
            ),
          ],
        ),
      ),
    );
  }
}
