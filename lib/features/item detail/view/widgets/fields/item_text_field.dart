part of '../../item_detail_view.dart';

class _ItemTextField extends StatelessWidget {
  final String text;
  const _ItemTextField({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.bodyLarge,
    );
  }
}
