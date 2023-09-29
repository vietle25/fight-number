import 'package:flutter/material.dart' hide Colors;

class MainScrollView extends StatelessWidget {
  final Widget child; //child
  final Color? color; //child

  const MainScrollView({
    super.key,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraint) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraint.maxHeight,
            ),
            child: SingleChildScrollView(
              child: child,
            ),
          );
        },
      ),
    );
  }
}
