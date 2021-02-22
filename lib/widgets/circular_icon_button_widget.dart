import 'package:flutter/material.dart';

class CircularIconButtonWidget extends StatelessWidget {
  Icon icon;
  VoidCallback callback;
  double size;
  String asset;

  CircularIconButtonWidget(
      {@required this.icon,
      @required this.callback,
      this.size = 36,
      this.asset = null});

  @override
  Widget build(BuildContext context) {
    return _buildCircleButton(context, icon: icon, callback: callback);
  }

  ClipOval _buildCircleButton(BuildContext context,
      {@required Icon icon, @required VoidCallback callback}) {
    if (icon != null) {
      return ClipOval(
        child: Material(
          color: Theme.of(context).primaryColor, // button color
          child: InkWell(
            splashColor: Theme.of(context).accentColor, // inkwell color
            child: SizedBox(width: size, height: size, child: icon),
            onTap: callback,
          ),
        ),
      );
    } else {
      return ClipOval(
        child: Material(
          color: Theme.of(context).primaryColor, // button color
          child: InkWell(
            splashColor: Theme.of(context).accentColor, // inkwell color
            child: SizedBox(
              width: size,
              height: size,
              child: Image.asset(asset, fit: BoxFit.cover),
            ),
            onTap: callback,
          ),
        ),
      );
    }
  }
}
