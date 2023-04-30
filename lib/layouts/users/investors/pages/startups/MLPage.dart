// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
//
// class StartupCategoryPage extends StatefulWidget {
//   @override
//   _StartupCategoryPageState createState() => _StartupCategoryPageState();
// }
//
// class _StartupCategoryPageState extends State<StartupCategoryPage> {
//   // define the input values and their controllers
//   final TextEditingController _categoryListController =
//   TextEditingController();
//   final TextEditingController _marketController = TextEditingController();
//   final TextEditingController _fundingAmountController =
//   TextEditingController();
//   final TextEditingController _regionController = TextEditingController();
//
//   // define the model file and label file paths
//   late String _modelPath;
//   late String _labelPath;
//
//   // define the interpreter and labels variables
//   late Interpreter _interpreter;
//   late List<String> _labels;
//
//   // define the prediction variable
//   late String _prediction;
//
//   @override
//   void initState() {
//     super.initState();
//     // get the paths of the model and label files
//     _loadModel();
//     _loadLabels();
//   }
//
//   Future<void> loadModel() async {
//     try {
//       // Load the TFLite model from the assets directory
//       final modelFile = await rootBundle.load("assets/model.tflite");
//       final model = modelFile.buffer.asUint8List();
//
//       // Create an interpreter from the loaded model
//       final interpreterOptions = InterpreterOptions();
//       _interpreter = Interpreter.fromBuffer(model, options: interpreterOptions);
//       print('load the model.');
//     } catch (e) {
//       print('Failed to load the model.');
//       print(e);
//     }
//   }
//
//   Future<void> _loadLabels() async {
//     try {
//       final appDir = await getApplicationDocumentsDirectory();
//       final labelFile = File('${appDir.path}/category_list.txt');
//       _labelPath = labelFile.path;
//
//       // copy the label file from assets to app directory
//       final data = await rootBundle.load('assets/category_list.txt');
//       await labelFile.writeAsBytes(data.buffer.asUint8List());
//
//       // load the labels
//       _labels = await labelFile.readAsLines();
//     } catch (e) {
//       print('Failed to load labels: $e');
//     }
//   }
//
//   void _predictCategory() {
//     // get the input values
//     final categoryList = _categoryListController.text;
//     final market = _marketController.text;
//     final fundingAmount = _fundingAmountController.text;
//     final region = _regionController.text;
//
//     // encode the input values
//     final categoryListEncoded = _oneHot Encode(categoryList, 'category_list');
//     final marketEncoded = _oneHotEncode(market, 'market');
//     final fundingAmountEncoded = double.parse(fundingAmount);
//     final regionEncoded = _oneHotEncode(region, 'region');
//
//     // create the input tensor
//     final input = List.filled(inputShape.reduce((a, b) => a * b), 0, dtype: DataType.float32);
//     // populate the input tensor with user input values
//     input[0] = user_input_encoded['funding_total_usd'].toDouble();
//     input.setRange(1, inputShape[1], user_input_encoded.values.toList(growable: false).sublist(2).map((value) => value.toDouble()));
//
// // create the interpreter
//     final interpreterOptions = InterpreterOptions();
//     interpreterOptions.threads = 1;
//     final interpreter = await Interpreter.fromAsset('model.tflite', options: interpreterOptions);
//
// // run the inference
//     interpreter.run(input, output);
//
// // get the predicted category
//     final predictedCategoryIndex = output[0].indexWhere((element) => element == output[0].reduce(max));
//     final categories = await rootBundle.loadString('assets/category_list.txt');
//     final predictedCategory = categories.split('\n')[predictedCategoryIndex];
//
// // return the predicted category
//     return predictedCategory;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Startup Category Predictor'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: categoryListController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Category List',
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: marketController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Market',
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: fundingTotalUsdController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Funding Total (USD)',
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: regionController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Region',
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   predictedCategory = await predictCategory(
//                     categoryListController.text,
//                     marketController.text,
//                     double.tryParse(fundingTotalUsdController.text) ?? 0,
//                     regionController.text,
//                   );
//                   setState(() {});
//                 },
//                 child: const Text('Predict Category'),
//               ),
//               if (predictedCategory != null)
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'Predicted Category: $predictedCategory',
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20.0,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
