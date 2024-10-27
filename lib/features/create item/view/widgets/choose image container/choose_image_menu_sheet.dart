part of 'image_container.dart';

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
            title: const Text('Choose from gallery'),
            onTap: () {
              context.pop();
              pickImageFromGallery();
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take a picture'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
