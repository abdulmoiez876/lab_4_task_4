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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Center(child: Text("Home")),
          toolbarHeight: 85,
        ),
        body: const WelcomeScreen());
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _counter = 0;
  var _isIncrementDisabled = false;
  var _isDecrementDisabled = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 10) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Alert"),
            content: Text("You cannot increment more"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
      if (_counter >= 10) {
        _isIncrementDisabled = true;
      }
      _isDecrementDisabled = false;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter == 1) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Alert"),
            content: Text("You cannot decrement more"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
      if (_counter <= 1) {
        _isDecrementDisabled = true;
      }
      _isIncrementDisabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You have pushed the button $_counter times "),
          const SizedBox(height: 20),
          Text(
            "$_counter",
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.w200,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _isDecrementDisabled ? null : _decrementCounter,
                child: Icon(Icons.remove),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isDecrementDisabled
                      ? Colors.grey
                      : Colors.green, // Change background color when disabled
                  disabledBackgroundColor:
                      Colors.grey[300], // Dull background color when disabled
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _isIncrementDisabled ? null : _incrementCounter,
                child: Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isIncrementDisabled
                      ? Colors.grey
                      : Colors.green, // Change background color when disabled
                  disabledBackgroundColor:
                      Colors.grey[300], // Dull background color when disabled
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
