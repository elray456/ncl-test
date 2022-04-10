import 'package:flutter/material.dart';

class EscapeScreen extends StatefulWidget {
  const EscapeScreen({Key? key}) : super(key: key);

  @override
  State<EscapeScreen> createState() => _EscapeScreenState();
}

class _EscapeScreenState extends State<EscapeScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('Escape');
  }
}
