import 'package:flutter/material.dart';

class HauptseitenWidget extends StatelessWidget {
  Widget _bildWidget;
  Widget _infoTextWidget;
  Widget _kachelGridWidget;

  HauptseitenWidget(
      this._bildWidget, this._infoTextWidget, this._kachelGridWidget);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _bildWidget,
          SizedBox(
            height: 8,
          ),
          _infoTextWidget,
          SizedBox(
            height: 8,
          ),
          Expanded(
            flex: 1,
            child: _kachelGridWidget,
          ),
        ],
      ),
    );
  }
}
