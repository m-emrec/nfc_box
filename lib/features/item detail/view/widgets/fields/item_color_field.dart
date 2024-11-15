part of '../../item_detail_view.dart';

class _ItemColorField extends StatelessWidget {
  final String color;
  const _ItemColorField({required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 32,
      child: Card(
        shape: const StadiumBorder(),
        color: Color(int.parse(color)),
        elevation: 3,
      ),
    );
  }
}
