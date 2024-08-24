import 'package:image_picker/image_picker.dart';

class FileAndImagePickFunction {
  // IMAGE PICKER
  final ImagePicker _picker = ImagePicker();
  // IMAGE PICK IN GALLERY
  Future<String> getIamgeFromeGallery() async {
    final getImage = await _picker.pickImage(source: ImageSource.gallery);
    String image = "";
    if (getImage != null) {
      image = getImage.path;
    }
    return image;
  }

  // IMAGE PICK IN CAMERA
  Future<String> getImageFromeCamera() async {
    final getImage = await _picker.pickImage(source: ImageSource.camera);
    String image = "";
    if (getImage != null) {
      image = getImage.path;
    }
    return image;
  }
}
