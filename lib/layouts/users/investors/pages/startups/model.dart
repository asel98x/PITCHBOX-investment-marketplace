import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pitchbox/styles/appColors.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late Interpreter _interpreter;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    try {
      // Load the TFLite model from the assets directory
      final modelFile = await rootBundle.load("assets/model.tflite");
      final model = modelFile.buffer.asUint8List();

      // Create an interpreter from the loaded model
      final interpreterOptions = InterpreterOptions();
      _interpreter = Interpreter.fromBuffer(model, options: interpreterOptions);
      print('load the model.');
    } catch (e) {
      print('Failed to load the model.');
      print(e);
    }
  }

  Future<List<double>> predict(
      {required String categoryList,
        required String market,
        required double fundingTotalUsd,
        required String region}) async {
    // Preprocess the input data
    List<double> input = preprocessInput(
        categoryList: categoryList,
        market: market,
        fundingTotalUsd: fundingTotalUsd,
        region: region,
        userInput: []);

    // Pass the input data to the interpreter
    final output = Float32List.fromList([0, 0]); // replace with actual output from interpreter

    // Postprocess the output data
    List<double> prediction = postprocessOutput(output);

    return prediction;
  }

  List<double> preprocessInput(
      {required String categoryList,
        required String market,
        required double fundingTotalUsd,
        required String region,
        required List<List<double>> userInput}) {
    // Perform the necessary preprocessing steps on the input data
    List<double> input = [0, 0, 0, 0]; // replace with actual preprocessed input

    return input;
  }

  List<double> postprocessOutput(Float32List output) {
    // Convert the output data to a List of doubles
    List<double> prediction =
    output.buffer.asFloat32List().cast<double>().toList();

    return prediction;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My TFLite Model'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Make Prediction'),
          onPressed: () async {
            try {
              // Create user input data
              List<List<double>> userInput = [  [0, 0, 400000, 0, 0, 1, 0, 0, 0, 0]];

              // Preprocess the input data
              final input = preprocessInput(
                userInput: userInput,
                categoryList: 'Software',
                market: 'Software',
                region: 'New York City',
                fundingTotalUsd: 40000,
              );

              // Make the prediction
              final output = Float32List.fromList(List.filled(1 * 13, 0));
              _interpreter.run(input, output); // run the model
              final prediction = postprocessOutput(output);

              // Print the predicted category list
              print('Predicted Category List: $prediction');
            } catch (e) {
              print('error: $e');
            }
          },
        ),
      ),
    );
  }
}