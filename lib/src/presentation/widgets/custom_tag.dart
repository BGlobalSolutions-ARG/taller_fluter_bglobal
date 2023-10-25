import 'widgets.dart';

class CustomTag extends StatelessWidget {
  final String label;

  const CustomTag({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      constraints: const BoxConstraints(minHeight: 36),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Palette.accentLight,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 2.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: Palette.gray2,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              // fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ).paddingOnly(right: 4.0);
  }
}
