import 'package:flutter/material.dart';

/// [BuildContext] üzerine yapılmış bir extension.
/// Bu extension sayesinde theme ve textTheme'e erişmek için
/// [Theme.of(this)] kullanmaya gerek kalmıyor.
/// Direkt olarak [context.theme] yada [context.textTheme] ile kullanılabiliyor
extension ContextExtension on BuildContext {
  /// [Theme.of(this)] kullanmak için.
  ThemeData get theme => Theme.of(this);

  /// [Theme.of(this).textTheme] kullanmak için
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// [MediaQueryData]'ya erişmek için kullan.
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  /// Ekran boyutunu almak için kullan
  /// [MediaQuery.of(this)].size
  Size get screenSize => mediaQuery.size;

  /// Klavye boyutunu almak için kullan.
  ///[MediaQuery.of(this)].viewInsets.bottom;
  double get keyboardSize => mediaQuery.viewInsets.bottom;

  /// Bir component'e ekran genişliğine göre değişen bir [width] değeri vermek istediğimizde.
  /// bu method'u kullanabiliriz.
  ///
  /// **Kullanım şekli** :
  ///```
  /// Container(
  ///
  /// Bu [Container] ekran genişliğinin 0.3'ü kadar bir genişlik alacak.
  ///
  ///   width : context.dynamicWidth(0.3)
  ///
  /// )
  ///```
  /// `[MediaQuery.of(this).size.width] x val`
  ///
  /// Ekran genişliğine göre [double] değer döner.
  double dynamicWidth(double? val) {
    val ??= 1;
    assert(val <= 1, "Val 1'den büyük olamaz !!! ");
    return screenSize.width * (val);
  }

  /// Bir component'e ekran yüksekliğine göre değişen bir [height] değeri vermek istediğimizde.
  /// bu method'u kullanabiliriz.
  ///
  /// **Kullanım şekli** :
  ///```
  /// Container(
  /// Bu [Container] ekran yüksekliğini 0.3'ü kadar bir yüksklik alacak.
  ///   height : context.dynamicHeight(0.3)
  /// )
  ///```
  /// `[MediaQuery.of(this).size.height] x val`
  ///
  /// Ekran yüksekliğine göre [double] değer döner.
  double dynamicHeight(double? val) {
    val ??= 1;
    assert(val <= 1, "Val 1'den büyük olamaz !!! ");
    return screenSize.height * (val);
  }
}

extension ScaffoldMessengerExtension on BuildContext {
  showSnack(snackBar) => ScaffoldMessenger.of(this).showSnackBar(snackBar);
}

// extension NavigationExtension on BuildContext {
//   NavigatorState get navigator => Navigator.of(this);
//   Future<T?> pushNamed<T extends Object?>(route, {Object? arguments}) =>
//       navigator.pushNamed(route, arguments: arguments);
//   pop() => navigator.pop();
//   pushReplacementNamed(routeName) => navigator.pushReplacementNamed(routeName);
// }
