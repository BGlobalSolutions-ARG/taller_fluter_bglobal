import 'widgets.dart';

class CustomSelector<T> extends StatelessWidget {
  final String label;
  final List<T> list;
  final T? value;
  final String Function(T value) toText;
  final ValueChanged<T> onChanged;
  const CustomSelector({
    Key? key,
    required this.list,
    required this.value,
    required this.toText,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Palette.gray2,
              fontWeight: FontWeight.w600,
            ),
          ).paddingSymmetric(horizontal: 4.0),
          gap2,
          Wrap(
            spacing: 6.0,
            runSpacing: 6.0,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: list
                .map(
                  (e) => MyButton(
                    onTap: () => onChanged(e),
                    label: toText(e),
                    selected: e == value,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String label;

  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final bool selected;
  final bool secondary;
  const MyButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.selected,
    this.onLongPress,
  })  : secondary = false,
        super(key: key);

  const MyButton.secondary({
    Key? key,
    required this.label,
    required this.onTap,
    required this.selected,
    this.onLongPress,
  })  : secondary = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Container(
        // height: 40,
        constraints: const BoxConstraints(minHeight: 36),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          color: () {
            if (secondary) {
              return selected ? Palette.primary : Palette.blueLight;
            }
            return selected ? Palette.green : Palette.accentLight;
          }(),
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
              style: TextStyle(
                fontFamily: 'Poppins',
                color: selected ? Colors.white : Palette.gray2,
                fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
                fontSize: 14,
                // fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
