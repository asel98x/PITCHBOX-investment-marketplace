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
  late List<String> _categoryList;

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

    } catch (e) {
      print('Failed to load the model.');
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My TFLite Model'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Make Prediction'),
              onPressed: () async {
                // Create input tensor from user input
                // final input = [400000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
                // final inputTensor = Tensor.(input, shape: [1, input.length]);
                //
                // // Allocate output tensor for the interpreter
                // final outputTensor = Tensor.allocate(TfLiteFloat32, [1, _categoryList.length]);
                //
                // // Run the interpreter with the input and output tensors
                // _interpreter.run(inputTensor, outputTensor);
                //
                // // Get the predicted category index and decode it
                // final predictedIndex = outputTensor.argmax()[0];
                // final predictedCategory = _categoryList[predictedIndex];
                //
                // // Show the predicted category in a dialog box
                // showDialog(
                //   context: context,
                //   builder: (context) => AlertDialog(
                //     title: Text('Predicted Category'),
                //     content: Text(predictedCategory),
                //     actions: [
                //       ElevatedButton(
                //         child: Text('OK'),
                //         onPressed: () => Navigator.pop(context),
                //       ),
                //     ],
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }


}
