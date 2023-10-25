import 'widgets.dart';

class CommomFormBackground extends StatelessWidget {
  final Widget child;
  const CommomFormBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        constraints: const BoxConstraints(maxWidth: 512, minHeight: 256),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}

class CommomBackground extends StatelessWidget {
  final Widget child;
  const CommomBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        constraints: BoxConstraints(maxWidth: 1024, minHeight: context.h / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
