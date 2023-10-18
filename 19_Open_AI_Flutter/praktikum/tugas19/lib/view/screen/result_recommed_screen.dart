import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas19/viewmodel/provider/openai_provider.dart';

class ReecommendResults extends StatelessWidget {
  const ReecommendResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smarthphone Recomendation'),
      ),
      body: Consumer<OpenAIProvider>(builder: (context, openAIProvider, child) {
        if (openAIProvider.openAIModel != null) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              (openAIProvider.openAIModel?.choices[0].text).toString(),
            ),
          );
        } else {
          return const Center(
            child: Icon(
              Icons.local_activity_outlined,
            ),
          );
        }
      }),
    );
  }
}
