import 'package:flutter/material.dart';

class Prioritas2 extends StatelessWidget {
  const Prioritas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Prioritas 2',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Haloo',
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Click Me',
            ),
          ),
        ],
      ),
    );
  }
}
