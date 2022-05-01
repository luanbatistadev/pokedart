import 'package:flutter/material.dart';


class PlaceholderContainer extends StatefulWidget {
  const PlaceholderContainer({
    Key? key,
    this.constraints,
    this.size,
    this.child,
    this.color,
    this.margin,
  }) : super(key: key);

  final BoxConstraints? constraints;
  final Size? size;
  final Widget? child;
  final Color? color;
  final EdgeInsets? margin;

  static const textPlaceholder = Size(100, 30);

  @override
  _PlaceholderContainerState createState() => _PlaceholderContainerState();
}

class _PlaceholderContainerState extends State<PlaceholderContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: widget.child ??
          Opacity(
            opacity: 0.1,
            child: Container(
              decoration: BoxDecoration(
                color: widget.color ?? Colors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: widget.constraints,
              width: widget.size?.width,
              height: widget.size?.height,
              child: widget.child,
            ),
          ),
    );
  }
}
