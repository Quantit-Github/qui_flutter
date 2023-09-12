import 'package:qui_flutter/style/base_color/black_color.dart';
import 'package:qui_flutter/style/base_color/gray_scale.dart';
import 'package:qui_flutter/style/base_color/primary_color.dart';
import 'package:qui_flutter/style/base_color/white_color.dart';

///
/// QUI 라이트 컬러 팔레트
///
class QuiLightColorPallete extends QuiColorPallete {
  final PrimaryColor _primary;
  final GrayScale _grayScale;
  final WhiteColor _whiteColor;
  final BlackColor _blackColor;

  QuiLightColorPallete({
    PrimaryColor? primary,
    GrayScale? grayScale,
    WhiteColor? whiteColor,
    BlackColor? blackColor,
  })  : _primary = primary ?? PrimaryColor(),
        _grayScale = grayScale ?? GrayScale(),
        _whiteColor = whiteColor ?? WhiteColor(),
        _blackColor = blackColor ?? BlackColor();

  @override
  QuiColorPallete copyWith({
    PrimaryColor? primary,
    GrayScale? grayScale,
    WhiteColor? whiteColor,
    BlackColor? blackColor,
  }) {
    return QuiLightColorPallete(
      primary: primary ?? this.primary,
      grayScale: grayScale ?? this.grayScale,
      whiteColor: whiteColor ?? this.whiteColor,
      blackColor: blackColor ?? this.blackColor,
    );
  }

  @override
  BlackColor get blackColor => _blackColor;

  @override
  GrayScale get grayScale => _grayScale;

  @override
  PrimaryColor get primary => _primary;

  @override
  WhiteColor get whiteColor => _whiteColor;
}

///
/// QUI 다크 컬러 팔레트
///
class QuiDarkColorPallete extends QuiColorPallete {
  final PrimaryColor _primary;
  final GrayScale _grayScale;
  final WhiteColor _whiteColor;
  final BlackColor _blackColor;

  QuiDarkColorPallete({
    PrimaryColor? primary,
    GrayScale? grayScale,
    WhiteColor? whiteColor,
    BlackColor? blackColor,
  })  : _primary = primary ?? PrimaryColor(),
        _grayScale = grayScale ?? GrayScale(),
        _whiteColor = whiteColor ?? WhiteColor(),
        _blackColor = blackColor ?? BlackColor();

  @override
  QuiColorPallete copyWith({
    PrimaryColor? primary,
    GrayScale? grayScale,
    WhiteColor? whiteColor,
    BlackColor? blackColor,
  }) {
    return QuiDarkColorPallete(
      primary: primary ?? this.primary,
      grayScale: grayScale ?? this.grayScale,
      whiteColor: whiteColor ?? this.whiteColor,
      blackColor: blackColor ?? this.blackColor,
    );
  }

  @override
  BlackColor get blackColor => _blackColor;

  @override
  GrayScale get grayScale => _grayScale;

  @override
  PrimaryColor get primary => _primary;

  @override
  WhiteColor get whiteColor => _whiteColor;
}

///
/// Base color palette
///
abstract class QuiColorPallete {
  PrimaryColor get primary;
  GrayScale get grayScale;
  WhiteColor get whiteColor;
  BlackColor get blackColor;

  QuiColorPallete copyWith({
    PrimaryColor? primary,
    GrayScale? grayScale,
    WhiteColor? whiteColor,
    BlackColor? blackColor,
  });
}
