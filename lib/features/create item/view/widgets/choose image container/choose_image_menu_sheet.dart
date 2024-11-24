part of 'choose_image_container.dart';

class _ChooseImageMenuSheet extends StatelessWidget {
  const _ChooseImageMenuSheet({
    required this.pickImageFromGallery,
    required this.pickImageFromCamera,
  });
  final Function pickImageFromGallery;
  final Function pickImageFromCamera;
  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo),
            title: Text(_ImageContainerUtils.chooseFromGallery),
            onTap: () {
              context.pop();
              pickImageFromGallery();
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: Text(_ImageContainerUtils.takeAPicture),
            onTap: () {
              context.pop();
              pickImageFromCamera();
            },
          ),
        ],
      ),
    );
  }
}
