import 'package:flutter/material.dart';

import '../../../theme/app_palette.dart';


class CCard extends StatelessWidget {
  final Widget child;
  final double elevation;
  final EdgeInsetsGeometry? margin;
  final Color shadowColor;
  final BorderSide side;
  const CCard({
    super.key,
    required this.child,
    this.margin,
    this.elevation = 5,
    this.shadowColor = AppPalette.lightGrey,
    this.side = const BorderSide(color: AppPalette.lightGrey),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      shadowColor: shadowColor,
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: side,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
