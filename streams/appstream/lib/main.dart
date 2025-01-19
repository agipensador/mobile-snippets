import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stream<int>? intStream;
  Stream<int> getIntStream(Duration duration) async* {
    int i = 0;
    while (i <= 5) {
      i++;
      await Future.delayed(duration);
      yield i;
    }
  }

  @override
  void initState() {
    super.initState();
    intStream = getIntStream(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<int>(
                  initialData: 0,
                  stream: intStream,
                  builder: (context, snapshot) {
                    print('runing builder');
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(fontSize: 60),
                    );
                  })
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}
