import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:flutter/material.dart';

import './tool_item.dart';

const tools = [
  ToolItem(
    icon: Icons.speed,
    labelKey: "tools.cutting_speed",
    descriptionKey: "descriptions.cutting_speed",
    route: Routes.cuttingSpeed,
  ),
  ToolItem(
    icon: Icons.settings,
    labelKey: "tools.spindle_rpm",
    descriptionKey: "descriptions.spindle_rpm",
    route: Routes.spindleSpeed,
  ),
  ToolItem(
    icon: Icons.calculate,
    labelKey: "tools.feed_rate",
    descriptionKey: "descriptions.feed_rate",
    route: Routes.feedRate,
  ),
  ToolItem(
    icon: Icons.straighten,
    labelKey: "tools.unit_converter",
    descriptionKey: "descriptions.unit_converter",
    route: Routes.converter,
  ),
  ToolItem(
    icon: Icons.precision_manufacturing,
    labelKey: "tools.tolerances",
    descriptionKey: "descriptions.tolerances",
    route: Routes.tolerances,
  ),
  ToolItem(
    icon: Icons.architecture,
    labelKey: "tools.gd_symbols",
    descriptionKey: "descriptions.gd_symbols",
    route: Routes.gdSymbols,
  ),
];
