import 'package:flutter/cupertino.dart';

// Displays error message when the BLoC state comes into an error.
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Oops! Something unusual happened. Please contact customer support.',
      ),
    );
  }
}
