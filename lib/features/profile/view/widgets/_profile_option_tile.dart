part of '../profile_view.dart';

class _ProfileOptionTile extends StatelessWidget {
  const _ProfileOptionTile({
    this.textColor,
    required this.title,
    required this.onTap,
    this.leading,
  });
  final String title;
  final Color? textColor;
  final Function()? onTap;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      titleTextStyle: context.textTheme.labelLarge,
      title: Text(
        title,
      ),
      textColor: textColor,
      leading: leading,
    );
  }
}
