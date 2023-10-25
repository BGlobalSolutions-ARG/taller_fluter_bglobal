import 'widgets.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;
  final Color iconColor;
  final IconData? iconData;
  final bool outline;
  final bool icon;
  final bool alt;
  final bool border;
  final double minSize;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.minSize = 48,
    this.iconData,
    this.backgroundColor = Palette.primary,
    this.iconColor = Colors.white,
  })  : outline = false,
        icon = false,
        alt = false,
        border = false,
        super(key: key);

  const CustomButton.outline({
    Key? key,
    required this.onTap,
    required this.label,
    this.minSize = 48,
    this.iconData,
    this.backgroundColor = Palette.primary,
    this.iconColor = Colors.white,
  })  : outline = true,
        icon = false,
        alt = false,
        border = false,
        super(key: key);

  const CustomButton.alt({
    Key? key,
    required this.onTap,
    required this.label,
    this.minSize = 52,
    this.iconData,
    this.backgroundColor = Palette.primary,
    this.iconColor = Colors.white,
  })  : outline = false,
        icon = false,
        alt = true,
        border = false,
        super(key: key);

  const CustomButton.icon({
    Key? key,
    required this.onTap,
    required this.label,
    required this.iconData,
    this.minSize = 52,
    this.backgroundColor = Palette.primary,
    this.iconColor = Colors.white,
  })  : outline = false,
        icon = true,
        alt = false,
        border = false,
        super(key: key);

  const CustomButton.border({
    Key? key,
    required this.onTap,
    required this.label,
    this.iconData,
    this.minSize = 52,
    this.backgroundColor = Palette.primary,
    this.iconColor = Colors.white,
  })  : outline = false,
        icon = false,
        alt = false,
        border = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (border) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: Palette.primary),
          // color: Palette.primary,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Palette.gray1,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ).toButton(onTap);
    }
    if (alt) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: Palette.culture,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 10.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData != null)
              Icon(
                iconData,
                size: 18.0,
                color: Palette.primary,
              ),
            if (iconData != null) gap12,
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Palette.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ).toButton(onTap);
    }
    if (icon) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData != null)
              Flexible(
                flex: 20,
                child: Icon(
                  iconData,
                  size: 18.0,
                  color: iconColor,
                ),
              ),
            if (iconData != null) gap12,
            Flexible(
              flex: 80,
              child: Text(
                label,
                style: const TextStyle(
                  color: Palette.gray1,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ).toButton(onTap);
    }
    if (outline) {
      return Container(
        constraints: BoxConstraints(minHeight: minSize),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          color: Palette.primary.withOpacity(.15),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Text(
          label,
          style: const TextStyle(
            color: Palette.primary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ).toButton(onTap);
    }
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: Palette.primary,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ).toButton(onTap);
  }
}
