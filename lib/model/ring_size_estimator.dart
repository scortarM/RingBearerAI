import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class RingSizeEstimator {
  // The TensorFlow Lite model file path
  final String modelPath = "assets/model.tflite";

  // Constructor for the class
  RingSizeEstimator() {
    _loadModel();
  }

  // Load the TensorFlow Lite model
  Future<void> _loadModel() async {
    try {
      await Tflite.loadModel(
        model: modelPath,
      );
    } on PlatformException catch (e) {
      print("Failed to load model: $e");
    }
  }

  // Capture an image from the user's camera or gallery
  Future<File?> captureImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera); // Or .gallery for gallery
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  // Process the image for prediction (e.g., resize and normalize)
  Future<List?> preprocessImage(File image) async {
    // Implement image preprocessing: resizing, normalizing, etc.
    // Here, we'll assume the image is already prepared for the model.
    var inputImage = await image.readAsBytes();
    var output = await Tflite.runModelOnImage(
      bytesList: inputImage,
      numResults: 1,
      threshold: 0.5, // Confidence threshold
      asynch: true,
    );
    return output;
  }

  // Predict ring size based on the processed image
  Future<String> predictRingSize(File image) async {
    try {
      var result = await preprocessImage(image);
      if (result != null && result.isNotEmpty) {
        // Parse the model output and extract ring size prediction
        var predictedSize = result[0]['label']; // Example output
        return 'Predicted Ring Size: $predictedSize';
      } else {
        return "Prediction failed. Please try again.";
      }
    } catch (e) {
      return "Error: $e";
    }
  }

  // Clean up resources (e.g., unload model) when the app is closed
  Future<void> closeModel() async {
    await Tflite.close();
  }
}
