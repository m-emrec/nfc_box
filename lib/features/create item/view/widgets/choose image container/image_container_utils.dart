part of 'choose_image_container.dart';

/// This class contains the logic for the image container
/// It contains the properties and methods for the image container
///
/// The properties are:
///
/// - setState [Function]
///
/// - controller [TextEditingController]
mixin _ImageContainerUtils on State<ChooseImageContainer> {
  late final TextEditingController controller;
  final ImagePicker _picker = ImagePicker();
  File? image;
  static final String chooseFromGallery =
      tr(LocaleKeys.createItem_chooseImage_chooseFromGallery);
  static final String takeAPicture =
      tr(LocaleKeys.createItem_chooseImage_takePhoto);
  @override
  void initState() {
    controller = widget.controller;
    super.initState();
  }
  // Methods

  /// Builds a widget to display an image based on the current state.
  ///
  /// This method returns different widgets depending on the conditions:
  /// - If `isEdit` is true, `controller.text` is not empty, and `image` is null,
  ///   it returns a `CachedNetworkImage` with the URL from `controller.text`.
  /// - If `image` is not null, it returns an `Image.file` with the selected image.
  /// - Otherwise, it returns an `Image.asset` with a placeholder image.
  ///
  /// Returns:
  /// - A `CachedNetworkImage` if editing and the URL is available.
  /// - An `Image.file` if an image is selected.
  /// - An `Image.asset` as a placeholder if no image is selected.
  Widget buildImageWidget() {
    if (widget.isEdit && widget.controller.text.isNotEmpty && image == null) {
      return CachedNetworkImage(
        imageUrl: widget.controller.text,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (image != null) {
      return Image.file(image!, fit: BoxFit.cover);
    } else {
      return Image.asset(AppAssets.chooseImagePath);
    }
  }

  /// This method sets the image to the selected image
  void setImage(File selectedImage) {
    /// set the image to the selected image
    image = selectedImage;

    /// set the controller text to the selected image path
    controller.text = selectedImage.path;

    /// call the setState method to update the UI
    setState(() {});
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
}
