import 'package:dog_news/src/model/enumClass.dart';
import 'package:dog_news/utils/sizes_config.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String label;
  final TextSizes? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final TextDecoration? textDecoration;

  const AppText(
    this.label, {
    Key? key,
    this.color,
    this.fontWeight = FontWeight.w500,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.padding,
    this.onTap,
    this.textDecoration,
    this.fontSize,
  }) : super(key: key);

  const AppText.small(
    this.label, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.padding,
    this.onTap,
    this.textDecoration,
  }) : super(key: key);

  const AppText.large(
    this.label, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontWeight = FontWeight.w600,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.padding,
    this.onTap,
    this.textDecoration,
  }) : super(key: key);

  const AppText.extraLarge(
    this.label, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontWeight = FontWeight.w600,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.padding,
    this.onTap,
    this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double textSize;
    if (fontSize == TextSizes.small) {
      textSize = Dimens.fontSmall;
    } else if (fontSize == TextSizes.medium) {
      textSize = Dimens.fontMedium;
    } else if (fontSize == TextSizes.large) {
      textSize = Dimens.fontLarge;
    } else if (fontSize == TextSizes.extraLarge) {
      textSize = Dimens.fontExtraLarge;
    } else {
      textSize = Dimens.fontNormal;
    }

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onTap,
        child: color == null
            ? Text(
                label,
                textAlign: textAlign,
                style: TextStyle(
                  color: color,
                  fontWeight: fontWeight,
                  fontSize: textSize,
                  decoration: textDecoration,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: maxLines,
              )
            : Text(
                label,
                textAlign: textAlign,
                style: TextStyle(
                  color: color,
                  fontWeight: fontWeight,
                  fontSize: textSize,
                  decoration: textDecoration,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: maxLines,
              ),
      ),
    );
  }
}
