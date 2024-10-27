part of 'image_container.dart';

/// This class contains the logic for the image container
/// It contains the properties and methods for the image container
///
/// The properties are:
///
/// - setState [Function]
///
/// - controller [TextEditingController]
class _ImageContainerUtils {
  final Function setState;
  final TextEditingController controller;
  final ImagePicker _picker = ImagePicker();
  File? image;

  /// set the image to the selected image
  /// set the controller text to the selected image path
  /// call the setState method to update the UI
  void setImage(File selectedImage) {
    image = selectedImage;
    controller.text = selectedImage.path;
    setState();
  }

  /// Pick image from gallery
  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    /// if image is not null then set the image
    if (image != null) {
      // Use the selected image
      setImage(File(image.path));
    }
  }

  /// Pick image from Camera
  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    /// if image is not null then set the image
    if (image != null) {
      // Use the selected image
      setImage(File(image.path));
    }
  }

  /// show the bottom sheet to choose the image
  void onImageContainerPressed(BuildContext context) {
    CustomBottomSheet.show(context,
        widget: _ChooseImageMenuSheet(
          pickImageFromGallery: pickImageFromGallery,
          pickImageFromCamera: pickImageFromCamera,
        ));
  }

  final List<BoxShadow> _shadows = const [
    BoxShadow(
      color: Color(0x198C7373),
      blurRadius: 23,
      offset: Offset(0, 11),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x168C7373),
      blurRadius: 42,
      offset: Offset(0, 42),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x0C8C7373),
      blurRadius: 57,
      offset: Offset(0, 95),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x028C7373),
      blurRadius: 67,
      offset: Offset(0, 168),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x008C7373),
      blurRadius: 74,
      offset: Offset(0, 263),
      spreadRadius: 0,
    )
  ];

  _ImageContainerUtils({
    required this.setState,
    required this.controller,
  });
}
