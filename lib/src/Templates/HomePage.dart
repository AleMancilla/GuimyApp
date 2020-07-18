import 'package:flutter/material.dart';
import 'package:guimyapp/src/Widgets/AppBarWidgetP.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            AppBarWidgetP(),
          ],
        ),
      ),
    );
  }
}