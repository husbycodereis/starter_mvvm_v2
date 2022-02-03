import '../../extensions/string_extensions.dart';

class SVGImagePaths {
  static SVGImagePaths? _instance;
  static SVGImagePaths? get instance {
    return _instance ??= SVGImagePaths.init();
  }

  SVGImagePaths.init();

  final loginGirlSVG = 'login_girl'.toSVG;
}
