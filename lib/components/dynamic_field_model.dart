import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dynamic_field_widget.dart' show DynamicFieldWidget;
import 'package:flutter/material.dart';

class DynamicFieldModel extends FlutterFlowModel<DynamicFieldWidget> {
  ///  Local state fields for this component.

  ResultsRecord? resultState;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - createRandomUuid] action in DynamicField widget.
  String? uuid;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Custom Action - updateResultValue] action in TextField widget.
  ResultsRecord? updatedResult;
  // Stores action output result for [Custom Action - updateResultValue] action in TextField widget.
  ResultsRecord? updatedResultCopy;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Custom Action - updateResultValue] action in TextField widget.
  ResultsRecord? updatedResultNumber;
  // Stores action output result for [Custom Action - updateResultValue] action in TextField widget.
  ResultsRecord? updatedResultNumberCopy;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Custom Action - updateResultValue] action in Image widget.
  ResultsRecord? updatedResultImage;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
