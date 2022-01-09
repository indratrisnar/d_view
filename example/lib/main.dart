import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('DView')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title('empty'),
              DView.empty(),
              DView.empty("There's no data"),
              title('error'),
              DView.error(),
              DView.error("Something wrong"),
              title('Loading'),
              DView.loadingBar(),
              DView.loadingCircle(),
              title('space'),
              Column(
                children: [
                  Text('a' * 9),
                  DView.spaceHeight(),
                  Text('b' * 9),
                  DView.spaceHeight(4),
                  Text('c' * 9),
                ],
              ),
              Row(
                children: [
                  Text('d' * 9),
                  DView.spaceWidth(),
                  Text('e' * 9),
                  DView.spaceWidth(8),
                  Text('f' * 9),
                ],
              ),
              title('textTitle'),
              DView.textTitle("Text Title"),
              title('textAction'),
              DView.textAction(
                () {
                  print('click See All 1');
                },
                'See All',
                color: Colors.amber,
              ),
              DView.textAction(
                () {
                  print('click See All 2');
                },
                'See All',
                size: 18,
              ),
              DView.textAction(
                () {
                  print('click lihat semua 3');
                },
                'See All',
                iconRight: Icons.navigate_next,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget title(String title) {
    return Column(
      children: [
        const SizedBox(height: 16),
        ListTile(
          title: Text(title),
          tileColor: Colors.grey[300],
          trailing: const Icon(Icons.arrow_downward),
        ),
      ],
    );
  }
}
