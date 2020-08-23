import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class LandmarkPage extends StatefulWidget {
  @override
  _LandmarkPageState createState() => _LandmarkPageState();
}

class _LandmarkPageState extends State<LandmarkPage> {
  File _imageFile;
  List<Face> _faces;
  List<ImageLabel> _labels;
  bool isLoading = false;
  ui.Image _image;
  static const platform = const MethodChannel('samples.flutter.dev/landmark');
  _getImageAndDetectFaces() async {
    final imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    debugPrint("Path: " + imageFile.path);
    setState(() {
      isLoading = true;
    });
    final image = FirebaseVisionImage.fromFile(imageFile);
    final faceDetector = FirebaseVision.instance.faceDetector();
    final labelsDetector = FirebaseVision.instance.cloudImageLabeler();
    List<Face> faces = await faceDetector.processImage(image);
    List<ImageLabel> labels = await labelsDetector.processImage(image);
    labels.forEach((element) {
      debugPrint("Conf: " +
          element.confidence.toString() +
          " Label: " +
          element.entityId +
          " Props: " +
          element.text);
    });
    if (mounted) {
      setState(() {
        _imageFile = imageFile;
        _faces = faces;
        _labels = labels;
        _loadImage(imageFile);
      });
    }
    _getLandmarkInfo();
  }

  Future<void> _getLandmarkInfo() async {
    try {
      final List<dynamic> result =
          await platform.invokeMethod('landmark', _imageFile.path);
      result.forEach((element) {
        debugPrint(element.toString());
      });
    } on PlatformException catch (e) {}
  }

  _loadImage(File file) async {
    final data = await file.readAsBytes();
    await decodeImageFromList(data).then(
      (value) => setState(() {
        _image = value;
        isLoading = false;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : (_imageFile == null)
              ? Center(child: Text('No image selected'))
              : Center(
                  child: FittedBox(
                    child: SizedBox(
                      width: _image.width.toDouble(),
                      height: _image.height.toDouble(),
                      child: CustomPaint(
                        painter: FacePainter(_image, _faces),
                      ),
                    ),
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImageAndDetectFaces,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

class FacePainter extends CustomPainter {
  final ui.Image image;
  final List<Face> faces;
  final List<Rect> rects = [];

  FacePainter(this.image, this.faces) {
    for (var i = 0; i < faces.length; i++) {
      rects.add(faces[i].boundingBox);
    }
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0
      ..color = Colors.yellow;

    canvas.drawImage(image, Offset.zero, Paint());
    for (var i = 0; i < faces.length; i++) {
      canvas.drawRect(rects[i], paint);
    }
  }

  @override
  bool shouldRepaint(FacePainter oldDelegate) {
    return image != oldDelegate.image || faces != oldDelegate.faces;
  }
}
