import 'package:flutter/material.dart';
import 'package:gru_chang/shared/colors.dart';

class DialogUtil {
  static Future<dynamic> showCustomDialog(
    BuildContext context, {
    required Widget child,
    required Color backgroundColor,
    bool isShowCloseButton = true,
    bool barrierDismissible = false,
    Color closeButtonColor = colorDarkRed,
    double elevation = 8,
    bool isScrollView = true,
    Function? onTapClose,
  }) async {
    return showDialog<dynamic>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: colorDarkRed.withOpacity(0.6),
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: AlertDialog(
            elevation: elevation,
            backgroundColor: backgroundColor,
            // contentPadding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
            // titlePadding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
            // insetPadding: isPortrait ? EdgeInsets.only(bottom: dialogPadding, top: 30) : null,
            // title: Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     if (isShowCloseButton)
            //       // CustomCloseDialogButton(
            //       //   closeButtonColor: closeButtonColor,
            //       //   isInkStyle: false,
            //       //   onTap: onTapClose ?? () {
            //       //     Navigator.pop(context);
            //       //   },
            //       // ),
            //   ],
            // ),
            content: child,
          ),
        );
      },
    );
  }
}
