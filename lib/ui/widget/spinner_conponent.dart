import 'package:flutter/material.dart';

class SpinnerComponent extends StatelessWidget {

  const SpinnerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        widthFactor: 2,
        heightFactor: 2,
        child: SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).highlightColor
            ),
          ),
        ),
      ),
    );
  }
}
