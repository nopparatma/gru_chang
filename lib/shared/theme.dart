import 'package:flutter/material.dart';

extension CustomTextStyles on TextTheme {

  //*** กรณีต้องการเพิ่ม style ที่นอกเหนือจาก fontSize ให้ใช้วิธี copyWith และระบุ style ที่ต้องการไปเลย แทน การเพิ่ม style ที่นี่

  TextStyle get smaller => const TextStyle(
    fontSize: 12,
  );

  TextStyle get small => const TextStyle(
    fontSize: 14,
  );

  TextStyle get normal => const TextStyle(
    fontSize: 16,
  );

  TextStyle get large => const TextStyle(
    fontSize: 20,
  );

  TextStyle get larger => const TextStyle(
    fontSize: 24,
  );

  TextStyle get xLarger => const TextStyle(
    fontSize: 30,
  );

  TextStyle get xxLarger => const TextStyle(
    fontSize: 36,
  );

  TextStyle get xxxLarger => const TextStyle(
    fontSize: 42,
  );

  TextStyle get extraLarger => const TextStyle(
    fontSize: 48,
  );

  TextStyle get xExtraLarger => const TextStyle(
    fontSize: 54,
  );
}
