import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class GradientHeader extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final double height;
  final bool roundedBottom;
  final EdgeInsetsGeometry padding;

  const GradientHeader({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.height = 220,
    this.roundedBottom = true,
    this.padding = const EdgeInsets.fromLTRB(20, 16, 20, 0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppColors.headerGradient,
          borderRadius: roundedBottom
              ? const BorderRadius.vertical(
                  bottom: Radius.circular(AppRadius.card),
                )
              : null,
        ),
        child: ClipRRect(
          borderRadius: roundedBottom
              ? const BorderRadius.vertical(
                  bottom: Radius.circular(AppRadius.card),
                )
              : BorderRadius.zero,
          child: Stack(
            children: [
              Positioned(
                top: -70,
                right: -50,
                child: _blob(190, Colors.white.withValues(alpha: 0.08)),
              ),
              Positioned(
                bottom: -90,
                left: -70,
                child: _blob(220, Colors.white.withValues(alpha: 0.10)),
              ),
              Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (leading != null || trailing != null)
                      Row(
                        children: [
                          ?leading,
                          const Spacer(),
                          ?trailing,
                        ],
                      ),
                    if (title != null || subtitle != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ?title,
                          if (title != null && subtitle != null)
                            const SizedBox(height: 6),
                          ?subtitle,
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _blob(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
