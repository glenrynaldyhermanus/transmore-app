import '/components/dynamic_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'form_widget.dart' show FormWidget;
import 'package:flutter/material.dart';

class FormModel extends FlutterFlowModel<FormWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for DynamicField dynamic component.
  late FlutterFlowDynamicModels<DynamicFieldModel> dynamicFieldModels;

  @override
  void initState(BuildContext context) {
    dynamicFieldModels = FlutterFlowDynamicModels(() => DynamicFieldModel());
  }

  @override
  void dispose() {
    dynamicFieldModels.dispose();
  }
}
