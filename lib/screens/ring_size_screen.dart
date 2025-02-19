import 'package:flutter/material.dart';
import 'dart:io';
import 'ring_size_estimator.dart'; // Import your previous class

class RingSizeScreen extends StatefulWidget {
  @override
  _RingSizeScreenState createState() => _RingSizeScreenState();
}

class _RingSizeScreenState extends State<RingSizeScreen> {
  // Instance of RingSizeEstimator
  final RingSizeEstimator _ringSizeEstimator = RingSizeEstimator();
  
  File? _image;  // Stores the image selected or captured
  String _prediction = "";  // Stores the ring size prediction or error message
  bool _isLoading = false;  // State to handle loading state

  // Method to handle image selection or capture
  void _pickImage() async {
    setState(() {
      _isLoading = true;
    });

    // Capture or pick an image from gallery or camera
    File? image = await _ringSizeEstimator.captureImage();
    if (image != null) {
      setState(() {
        _image = image;
      });
      // Predict ring size
      String result = await _ringSizeEstimator.predictRingSize(image);
      setState(() {
        _prediction = result;
        _isLoading = false;
      });
    } else {
      setState(() {
        _prediction = "No image selected.";
        _isLoading = false;
      });
    }
  }

  // UI for the RingSizeScreen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RingBearerAI - Ring Size Predictor"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image preview (if any image is selected)
            _image != null
                ? Image.file(_image!, height: 200, width: 200)
                : Icon(Icons.image, size: 200, color: Colors.grey),

            SizedBox(height: 20),

            // Button to capture or upload an image
            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Capture or Select Image"),
            ),

            SizedBox(height: 20),

            // Show loading spinner if the model is processing
            _isLoading
                ? CircularProgressIndicator()
                : Text(
                    _prediction.isNotEmpty ? _prediction : "Upload an image to predict the ring size.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the model when no longer needed
    _ringSizeEstimator.closeModel();
    super.dispose();
  }
}
