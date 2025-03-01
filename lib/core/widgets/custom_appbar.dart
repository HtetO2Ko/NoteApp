import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Widget? leading;
  final Color? backgroundColor;
  final bool hideBack;
  final double? height;
  final PreferredSizeWidget? bottom;
  const CustomAppbar({
    this.title,
    this.hideBack = false,
    this.action,
    this.backgroundColor,
    this.height,
    this.leading,
    this.bottom,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      surfaceTintColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 60,
      title: title ?? const Text(''),
      titleSpacing: 0,
      leadingWidth: leading != null ? 60 : null,
      actions: [action ?? Container()],
      leading: leading ??
          (hideBack
              ? null
              : InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 23,
                    color: Colors.black,
                  ),
                )),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60);
}
