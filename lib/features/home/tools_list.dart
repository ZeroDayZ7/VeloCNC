import 'package:cnc_toolbox/core/router/app_router.dart';
import 'package:flutter/material.dart';

import './tool_item.dart';

final tools = [
  ToolItem(
    icon: Icons.speed,
    labelKey: "tools.cutting_speed",
    descriptionKey: "descriptions.cutting_speed",
    route: const CuttingSpeedRoute().location,
  ),
  ToolItem(
    icon: Icons.settings,
    labelKey: "tools.spindle_rpm",
    descriptionKey: "descriptions.spindle_rpm",
    route: const SpindleSpeedRoute().location,
  ),
  ToolItem(
    icon: Icons.calculate,
    labelKey: "tools.feed_rate",
    descriptionKey: "descriptions.feed_rate",
    route: const FeedRateRoute().location,
  ),
  ToolItem(
    icon: Icons.straighten,
    labelKey: "tools.unit_converter",
    descriptionKey: "descriptions.unit_converter",
    route: const ConverterRoute().location,
  ),
  ToolItem(
    icon: Icons.precision_manufacturing,
    labelKey: "tools.tolerances",
    descriptionKey: "descriptions.tolerances",
    route: const TolerancesRoute().location,
  ),
  ToolItem(
    icon: Icons.architecture,
    labelKey: "tools.gd_symbols",
    descriptionKey: "descriptions.gd_symbols",
    route: const GdSymbolsRoute().location,
  ),
  ToolItem(
    icon: Icons.code,
    labelKey: "tools.g_codes",
    descriptionKey: "descriptions.g_codes",
    route: const GCodesRoute().location,
  ),
];
