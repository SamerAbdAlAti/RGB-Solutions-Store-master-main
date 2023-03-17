import 'package:flutter/material.dart';

class ContainerErrorWidget extends StatelessWidget {
  const ContainerErrorWidget(
      {super.key, required this.message, this.width, this.height});
  final Widget message;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Theme.of(context).colorScheme.errorContainer),
      child: Center(child: message),
    );
  }
}
