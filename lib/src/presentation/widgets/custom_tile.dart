import 'widgets.dart';

class CustomTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color color;
  final VoidCallback onTap;
  // final bool end;
  // final bool showArrow;
  const CustomTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
    // this.end = false,
    // this.showArrow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: zero,
      child: Container(
        width: context.w,
        // height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: icon,
              
            ),
            gap24,
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Palette.gray1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
