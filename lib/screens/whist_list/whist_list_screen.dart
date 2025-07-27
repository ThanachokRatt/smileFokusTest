import 'package:flutter/material.dart';

class WhistListScreen extends StatelessWidget {
  const WhistListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.width),
            child: Center(child: Text('Whist List Screen')),
          ),
        ],
      ),
    );
  }
}
