// import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_ml_custom/firebase_ml_custom.dart';
//
// class MyPage extends StatefulWidget {
//   const MyPage({Key? key}) : super(key: key);
//
//   @override
//   _MyPageState createState() => _MyPageState();
// }
//
// class _MyPageState extends State<MyPage> {
//   String? _modelOutput;
//
//   Future<void> _loadModel() async {
//     try {
//
//       // Specify download conditions
//       FirebaseModelDownloadConditions conditions = FirebaseModelDownloadConditions(
//         iosAllowCellularAccess: true,
//         iosAllowBackgroundDownloading: false,
//         androidChargingRequired: false,
//         androidWifiRequired: true,
//         androidDeviceIdleRequired: false,
//       );
//
//       // Download the model
//       FirebaseCustomModel customModel = await FirebaseModelDownloader.instance.getModel(
//         'MLModel',
//         FirebaseModelDownloadType.latestModel,
//         conditions,
//       );
//
//       // Load the model
//       FirebaseModelInterpreter interpreter = FirebaseModelInterpreter.instance;
//       FirebaseModelManager modelManager = FirebaseModelManager.instance;
//       FirebaseModelOptions modelOptions = FirebaseModelOptions(
//         remoteModelName: customModel.name,
//         localModelName: null,
//         modelDownloadConditions: conditions,
//       );
//       FirebaseModelInfo modelInfo = await modelManager.download(modelOptions);
//       FirebaseModelInterpreterOptions interpreterOptions = FirebaseModelInterpreterOptions(modelInfo);
//       FirebaseModelInterpreter interpreter = FirebaseModelInterpreter.instance;
//       FirebaseModelInterpreterResult result = await interpreter.run(
//         interpreterOptions,
//         <String, FirebaseModelInputOutput>{
//           'input': FirebaseModelInputOutput.fromBytes(inputData),
//         },
//         <String>[ 'output' ],
//       );
//
//       // Decode the output
//       String output = String.fromCharCodes(result.output['output']!.data);
//       setState(() {
//         _modelOutput = output;
//       });
//     } catch (e) {
//       setState(() {
//         _modelOutput = 'Error: $e';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Load Model'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _loadModel,
//               child: Text('Load Model'),
//             ),
//             SizedBox(height: 20),
//             _modelOutput != null
//                 ? Text(_modelOutput!)
//                 : SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
// }
