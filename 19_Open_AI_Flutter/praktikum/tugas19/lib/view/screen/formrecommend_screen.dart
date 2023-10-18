import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas19/viewmodel/provider/openai_provider.dart';
import 'package:tugas19/view/screen/result_recommed_screen.dart';

class FormRecommedScreen extends StatefulWidget {
  const FormRecommedScreen({super.key});

  @override
  State<FormRecommedScreen> createState() => _FormRecommedScreenState();
}

class _FormRecommedScreenState extends State<FormRecommedScreen> {
  @override
  Widget build(BuildContext context) {
    final openAIProvider = Provider.of<OpenAIProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Smarthphone'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            17.0,
          ),
          child: Form(
            key: openAIProvider.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: openAIProvider.budgetController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [openAIProvider.budgetControllerFormatter],
                  decoration: InputDecoration(
                    label: const Text(
                      'Budget',
                    ),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    suffixIconColor: Colors.blueGrey.shade800,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => openAIProvider.budgetController.clear(),
                      icon: const Icon(
                        Icons.remove_circle_outline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Storage',
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(
                        5.0,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    value: openAIProvider.selectStorage,
                    items: openAIProvider.storageOption.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          '$value GB',
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      openAIProvider.selectStorage = newValue;
                    }),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: openAIProvider.cameraController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: const Text(
                      'Camera',
                    ),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    suffixIconColor: Colors.blueGrey.shade800,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => openAIProvider.cameraController.clear(),
                      icon: const Icon(
                        Icons.remove_circle_outline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (openAIProvider.formKey.currentState!.validate()) {
                      context.read<OpenAIProvider>().getRecomendations(
                            budget: openAIProvider.budgetControllerFormatter
                                .getUnformattedValue()
                                .toInt(),
                            camera: openAIProvider.cameraController.text,
                            selectStorage: openAIProvider.selectStorage ?? '64',
                          );
                      await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ReecommendResults();
                      }));
                    }
                  },
                  child: const Text(
                    'Get Recommendation',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
