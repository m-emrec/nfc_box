part of '../profile_view.dart';

class _AreYouSureDialog extends StatelessWidget {
  const _AreYouSureDialog({
    required this.onConfirm,
    required this.title,
    required this.content,
  });

  final VoidCallback onConfirm;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(tr(LocaleKeys.profile_no)),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accentError[80],
          ),
          child: Text(
            title,
          ),
        ),
      ],
    );
  }
}
