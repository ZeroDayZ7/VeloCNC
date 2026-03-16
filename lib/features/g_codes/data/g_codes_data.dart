import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/g_codes/domain/g_code_model.dart';

const gCodes = [
  GCode(
    code: "G00",
    titleKey: LocaleKeys.gcodes_g00_title,
    descriptionKey: LocaleKeys.gcodes_g00_desc,
    example: "G00 X50 Z10",
  ),
  GCode(
    code: "G01",
    titleKey: LocaleKeys.gcodes_g01_title,
    descriptionKey: LocaleKeys.gcodes_g01_desc,
    example: "G01 X50 Z-10 F0.2",
  ),
  GCode(
    code: "G02",
    titleKey: LocaleKeys.gcodes_g02_title,
    descriptionKey: LocaleKeys.gcodes_g02_desc,
    example: "G02 X50 Y20 I10 J0",
  ),
  GCode(
    code: "G03",
    titleKey: LocaleKeys.gcodes_g03_title,
    descriptionKey: LocaleKeys.gcodes_g03_desc,
    example: "G03 X50 Y20 I10 J0",
  ),
  GCode(
    code: "G17",
    titleKey: LocaleKeys.gcodes_g17_title,
    descriptionKey: LocaleKeys.gcodes_g17_desc,
    example: "G17",
  ),
  GCode(
    code: "G18",
    titleKey: LocaleKeys.gcodes_g18_title,
    descriptionKey: LocaleKeys.gcodes_g18_desc,
    example: "G18",
  ),
  GCode(
    code: "G19",
    titleKey: LocaleKeys.gcodes_g19_title,
    descriptionKey: LocaleKeys.gcodes_g19_desc,
    example: "G19",
  ),
  GCode(
    code: "G20",
    titleKey: LocaleKeys.gcodes_g20_title,
    descriptionKey: LocaleKeys.gcodes_g20_desc,
    example: "G20",
  ),
  GCode(
    code: "G21",
    titleKey: LocaleKeys.gcodes_g21_title,
    descriptionKey: LocaleKeys.gcodes_g21_desc,
    example: "G21",
  ),
  GCode(
    code: "G28",
    titleKey: LocaleKeys.gcodes_g28_title,
    descriptionKey: LocaleKeys.gcodes_g28_desc,
    example: "G28 U0 W0",
  ),
];
