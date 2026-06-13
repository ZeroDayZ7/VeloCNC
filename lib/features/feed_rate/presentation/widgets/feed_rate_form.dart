import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/core/utils/app_number_formatter.dart';
import 'package:cnc_toolbox/features/feed_rate/application/feed_rate_provider.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_rate_state.dart';
import 'package:cnc_toolbox/features/feed_rate/domain/feed_type.dart';
import 'package:cnc_toolbox/features/feed_rate/presentation/widgets/feed_input_fields.dart';
import 'package:cnc_toolbox/features/feed_rate/presentation/widgets/result_card.dart';
import 'package:cnc_toolbox/widgets/custom_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedRateForm extends ConsumerStatefulWidget {
  final FeedType type;
  const FeedRateForm({super.key, required this.type});

  @override
  ConsumerState<FeedRateForm> createState() => _FeedRateFormState();
}

class _FeedRateFormState extends ConsumerState<FeedRateForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nController;
  late final TextEditingController _zController;
  late final TextEditingController _fzController;
  late final TextEditingController _toolDiaController;
  late final TextEditingController _featDiaController;

  @override
  void initState() {
    super.initState();
    final state = ref.read(feedRateProvider(widget.type));
    _nController = TextEditingController(text: _fmt(state.spindleSpeed));
    _zController = TextEditingController(
      text: state.numberOfTeeth > 0 ? state.numberOfTeeth.toString() : "",
    );
    _fzController = TextEditingController(text: _fmt(state.feedPerTooth));
    _toolDiaController = TextEditingController(text: _fmt(state.toolDiameter));
    _featDiaController = TextEditingController(
      text: _fmt(state.featureDiameter),
    );
  }

  @override
  void dispose() {
    _nController.dispose();
    _zController.dispose();
    _fzController.dispose();
    _toolDiaController.dispose();
    _featDiaController.dispose();
    super.dispose();
  }

  String _fmt(double val) => val > 0 ? AppNumberFormatter.format(val) : "";

  void _onCalculate() {
    if (_formKey.currentState!.validate()) {
      ref.read(feedRateProvider(widget.type).notifier).calculate();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(feedRateProvider(widget.type));

    ref.listen(feedRateProvider(widget.type), (prev, next) {
      if (!FocusScope.of(context).hasFocus) {
        _sync(next);
      }
    });

    return SingleChildScrollView(
      padding: AppSpacings.edgeInsetsM,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ResultCard(
              vf: state.resultVf,
              f: state.resultF,
              isArc: widget.type == FeedType.arc,
            ),
            AppSpacings.gapL,
            FeedInputFields(
              type: widget.type,
              nController: _nController,
              zController: _zController,
              fzController: _fzController,
            ),
            if (widget.type == FeedType.arc) ...[
              const Divider(height: 40),
              _buildArcSection(state),
            ],
            AppSpacings.gapL,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onCalculate,
                child: Text(LocaleKeys.common_calculate.tr()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sync(FeedRateState state) {
    _syncField(_nController, state.spindleSpeed);
    _syncField(_zController, state.numberOfTeeth.toDouble());
    _syncField(_fzController, state.feedPerTooth);
    _syncField(_toolDiaController, state.toolDiameter);
    _syncField(_featDiaController, state.featureDiameter);
  }

  void _syncField(TextEditingController ctrl, double val) {
    final text = _fmt(val);
    if (ctrl.text != text) ctrl.text = text;
  }

  Widget _buildArcSection(FeedRateState state) {
    final notifier = ref.read(feedRateProvider(widget.type).notifier);

    return Column(
      children: [
        Text(
          LocaleKeys.feed_rate_arc_parameters.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        AppSpacings.gapMs,
        CustomField(
          label: LocaleKeys.feed_rate_tool_diameter_label.tr(),
          suffix: "mm",
          controller: _toolDiaController,
          onChanged: notifier.updateToolDia,
          validator: (v) => (v == null || v.isEmpty) ? "" : null,
        ),
        AppSpacings.gapMs,
        CustomField(
          label: LocaleKeys.feed_rate_feature_diameter_label.tr(),
          suffix: "mm",
          controller: _featDiaController,
          onChanged: notifier.updateFeatureDia,
          validator: (v) => (v == null || v.isEmpty) ? "" : null,
        ),
        AppSpacings.gapMs,
        SwitchListTile(
          title: Text(
            state.isInternal
                ? LocaleKeys.feed_rate_internal_work.tr()
                : LocaleKeys.feed_rate_external_work.tr(),
          ),
          value: state.isInternal,
          onChanged: notifier.toggleWorkType,
        ),
      ],
    );
  }
}
