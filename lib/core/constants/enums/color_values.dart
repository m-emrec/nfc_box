// Colors.red.value,
// Colors.green.value,
// Colors.blue.value,
// Colors.yellow.value,
// Colors.orange.value,
// Colors.purple.value,
// Colors.pink.value,
// Colors.brown.value,
// Colors.cyan.value,
// Colors.teal.value,
// Colors.amber.value,
// Colors.indigo.value,
// Colors.lime.value,
// Colors.grey.value,
// Colors.black.value,
// Colors.white.value,

enum ColorValues {
  red(value: 0xFFFF0000),
  green(value: 0xFF00FF00),
  blue(value: 0xFF0000FF),
  yellow(value: 0xFFFFFF00),
  orange(value: 0xFFFFA500),
  purple(value: 0xFF800080),
  pink(value: 0xFFFFC0CB),
  brown(value: 0xFFA52A2A),
  cyan(value: 0xFF00FFFF),
  teal(value: 0xFF008080),
  amber(value: 0xFFFFBF00),
  indigo(value: 0xFF4B0082),
  lime(value: 0xFF00FF00),
  grey(value: 0xFF808080),
  black(value: 0xFF000000),
  white(value: 0xFFFFFFFF),
  ;

  final int value;

  const ColorValues({required this.value});
}
