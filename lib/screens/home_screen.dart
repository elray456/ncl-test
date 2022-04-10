import 'package:flutter/material.dart';
import 'package:ncl_test/screens/bliss_screen.dart';
import 'package:ncl_test/screens/escape_screen.dart';
import 'package:ncl_test/screens/sky_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => _onClickSkyHandler(context),
                child: const Text('SKY'),
              ),
              TextButton(
                onPressed: () => _onClickBlissHandler(context),
                child: const Text('BLISS'),
              ),
              TextButton(
                onPressed: () => _onClickEscapeHandler(context),
                child: const Text('ESCAPE'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onClickSkyHandler(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SkyScreen(),
      ),
    );
  }

  void _onClickBlissHandler(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BlissScreen(),
      ),
    );
  }

  void _onClickEscapeHandler(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EscapeScreen(),
      ),
    );
  }
}