class NumberModel {
  final int index;
  final int value;
  final double fontSize;
  final double padding;
  final double top;
  final double left;
  final double rotation;

  NumberModel({
    required this.index,
    required this.value,
    required this.fontSize,
    required this.padding,
    required this.top,
    required this.left,
    required this.rotation,
  });

  copyWith({
    int? index,
    int? value,
    double? fontSize,
    double? padding,
    double? top,
    double? left,
    double? rotation,
  }) {
    return NumberModel(
        index: index ?? this.index,
        value: value ?? this.value,
        fontSize: fontSize ?? this.fontSize,
        padding: padding ?? this.padding,
        top: top ?? this.top,
        left: left ?? this.left,
        rotation: rotation ?? this.rotation);
  }
}
