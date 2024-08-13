import 'package:avis/common/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({super.key, this.title, this.hideBack = false});
  final Widget? title;
  final bool hideBack;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title ?? const Text(''),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Container(
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? Colors.white.withOpacity(0.03)
                : Colors.black.withOpacity(0.03),
            shape: BoxShape.circle,
          ),
          child: Visibility(
            visible: !hideBack,
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
