import 'package:flutter/services.dart';

import 'widgets.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.required = false,
    this.validator,
    this.readOnly = false,
    
    this.onChanged,
    this.keyboardType,
    this.onTap,
    this.maxLines = 1,
    this.maxLength,
    this.icon,
    this.obscureText = false,
    this.prefixText,
    this.autoFocus = false,
    this.enableSugestions = true,
    this.suffixText,
    this.textInputAction,
    this.formatters,
    this.autofillHints,
    this.onFieldSubmitted,
    this.suffix,
    this.textCapitalization = TextCapitalization.sentences,
    this.focusNode,
    required this.hint,
  }) : super(key: key);
  final String? hint;
  final Widget? suffix;
  final bool required;
  final bool autoFocus;
  final bool enableSugestions;
  final TextInputAction? textInputAction;

  final String? prefixText;
  final String? suffixText;
  
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? label;
  final int maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool obscureText;
  final TextInputType? keyboardType;

  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? formatters;
  final String? Function(String? value)? validator;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onTap;
  final Widget? icon;

  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.0),
    borderSide: BorderSide.none,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label!,
                style: const TextStyle(
                  color: Palette.gray2,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ).paddingSymmetric(horizontal: 4.0),
              if (required)
                Text(
                  "*",
                  style: context.s3?.copyWith(color: Colors.red),
                )
            ],
          ),
        if (label != null) gap4,
        TextFormField(
          onTap: onTap,
          maxLength: maxLength,
          controller: controller,
          
          validator: (v) {
            if (required) {
              if (v == null || v.isEmpty) {
                return "No puede dejar este campo vacío.";
              }
            }
            return validator?.call(v);
          },
          autofocus: autoFocus,
          enableSuggestions: enableSugestions,
          textInputAction: textInputAction,
          readOnly: readOnly,
          maxLines: maxLines,
          onChanged: onChanged,
          focusNode: focusNode,
          inputFormatters: formatters,
          // cursorHeight: 23,
          autofillHints: autofillHints,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: const TextStyle(
            color: Palette.gray1,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
          onFieldSubmitted: onFieldSubmitted,
          textAlign: TextAlign.left,
          textCapitalization: textCapitalization,
          textAlignVertical: TextAlignVertical.center,
          // scrollPadding: zero,
          decoration: InputDecoration(
            // contentPadding: zero,
            counter: const SizedBox.shrink(),
            enabledBorder: _border,
            errorBorder: _border,
            disabledBorder: _border,
            focusedErrorBorder: _border,
            border: _border,
            prefixText: prefixText,

            alignLabelWithHint: true,
            focusedBorder: _border,
            // contentPadding: const EdgeInsets.symmetric(
            //   horizontal: 16.0,
            //   vertical: 24.0,
            // ),

            suffixIcon: suffix,
            hintText: hint,
            // suffix: suffix,
            suffixText: suffixText, isCollapsed: false,
            hintStyle: const TextStyle(
              color: Palette.gray3,
              fontWeight: FontWeight.w400,
              // fontFamily: 'Lato',
            ),
          ),
        ),
      ],
    );
  }
}
