import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 6,
      valueColor: AlwaysStoppedAnimation<Color>(Color(0xff637E76)),
    );
  }
}
