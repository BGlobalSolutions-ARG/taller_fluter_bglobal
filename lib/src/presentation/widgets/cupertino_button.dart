import 'widgets.dart';

class MyCupertinoButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const MyCupertinoButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: zero,
      minSize: 26,
      onPressed: onTap,
      child: child,
    );
  }
}
