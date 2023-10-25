import 'widgets.dart';

class NoDataWidget extends StatelessWidget {
  final String label;
  final Widget? icon;
  final Future<void> Function() onRefresh;
  const NoDataWidget({
    Key? key,
    this.icon,
    required this.label,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Container(
        width: context.w,
        height: context.h,
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (icon != null) icon!,
                if (icon != null) gap32,
                Center(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
