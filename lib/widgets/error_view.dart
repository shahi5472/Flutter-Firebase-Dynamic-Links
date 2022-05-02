import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: ElevatedButton(
              onPressed: onPressed,
              child: const Text('Retry'),
            ),
          ),
        ],
      ),
    );
  }
}