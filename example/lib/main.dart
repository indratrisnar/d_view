import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
              // Empty
              title('empty', false),
              DView.empty(),
              DView.nothing(), // box with empty size
              DView.empty("Belum ada data"),
              // Error
              DView.nothing(), // box with empty size
              title('error'),
              DView.error(),
              DView.error("Terjadi kesalahan"),
              // Loading
              title('loading'),
              DView.loadingBar(),
              DView.loadingCircle(),
              // Space
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
              const Divider(),
              Row(
                children: [
                  Text('d' * 9),
                  DView.spaceWidth(),
                  Text('e' * 9),
                  DView.spaceWidth(8),
                  Text('f' * 9),
                ],
              ),
              const Divider(),
              Column(
                children: [
                  Container(height: 30, width: 60, color: Colors.blue),
                  DView.spaceHeight(),
                  Container(height: 30, width: 60, color: Colors.blue),
                  DView.spaceHeight(4),
                  Container(height: 30, width: 60, color: Colors.blue),
                ],
              ),

              const Divider(),
              Row(
                children: [
                  Container(height: 30, width: 60, color: Colors.blue),
                  DView.spaceWidth(),
                  Container(height: 30, width: 60, color: Colors.blue),
                  DView.spaceWidth(50),
                  Container(height: 30, width: 60, color: Colors.blue),
                ],
              ),
              title('textTitle'),
              DView.textTitle("Text Title"),
              title('textAction'),
              DView.textAction(
                () {
                  print('click See All 1');
                },
                color: Colors.amber,
              ),
              DView.textAction(
                () {
                  print('click See All 2');
                },
                text: 'SEMUA',
                size: 20,
                iconRight: Icons.navigate_next,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DView.textTitle("Popular", color: Colors.black, size: 22),
                    DView.textAction(
                      () {
                        print('More click');
                      },
                      size: 18,
                      text: 'More',
                      iconRight: Icons.navigate_next,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget title(String title, [bool space = true]) {
    return Column(
      children: [
        if (space) const SizedBox(height: 16),
        ListTile(
          title: Text(title),
          tileColor: Colors.grey[300],
          trailing: const Icon(Icons.arrow_downward),
        ),
      ],
    );
  }
}
