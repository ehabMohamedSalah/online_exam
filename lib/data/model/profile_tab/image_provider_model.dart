import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageProviderModel extends ChangeNotifier {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  File? get selectedImage => _selectedImage;

  ImageProviderModel() {
    _loadImage();
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final savedImage = await _saveImage(File(pickedFile.path));
      _selectedImage = savedImage;
      notifyListeners();
    }
  }

  Future<File> _saveImage(File image) async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/profile_image.png';
    final savedImage = await image.copy(imagePath);

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('profile_image', imagePath);

    return savedImage;
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image');

    if (imagePath != null && File(imagePath).existsSync()) {
      _selectedImage = File(imagePath);
      notifyListeners();
    }
  }

  void clearImage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('profile_image');

    _selectedImage = null;
    notifyListeners();
  }
}
