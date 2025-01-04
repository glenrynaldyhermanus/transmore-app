import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'dynamic_field_model.dart';
export 'dynamic_field_model.dart';

class DynamicFieldWidget extends StatefulWidget {
  const DynamicFieldWidget({
    super.key,
    required this.label,
    required this.type,
    required this.fieldId,
    required this.task,
    required this.result,
  });

  final String? label;
  final int? type;
  final String? fieldId;
  final TasksViewRow? task;
  final ResultsRecord? result;

  @override
  State<DynamicFieldWidget> createState() => _DynamicFieldWidgetState();
}

class _DynamicFieldWidgetState extends State<DynamicFieldWidget> {
  late DynamicFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DynamicFieldModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.uuid = await actions.createRandomUuid();
    });

    _model.textController1 ??= TextEditingController(
        text: functions.getInitialValue(widget.result!, widget.fieldId!));
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textFieldFocusNode1!.addListener(
      () async {
        if (functions.checkResultValues(widget.result!, widget.fieldId!)) {
          _model.updatedResultCopy = await actions.updateResultValue(
            widget.result!,
            widget.fieldId!,
            _model.textController1.text,
          );

          await widget.result!.reference.update({
            ...mapToFirestore(
              {
                'result_values': getResultValuesListFirestoreData(
                  _model.updatedResultCopy?.resultValues,
                ),
              },
            ),
          });
        } else {
          await widget.result!.reference.update({
            ...mapToFirestore(
              {
                'result_values': FieldValue.arrayUnion([
                  getResultValuesFirestoreData(
                    updateResultValuesStruct(
                      ResultValuesStruct(
                        resultValueId: _model.uuid,
                        resultId: widget.result?.resultId,
                        fieldId: widget.fieldId,
                        label: widget.label,
                        value: _model.textController1.text,
                        type: widget.type,
                      ),
                      clearUnsetFields: false,
                    ),
                    true,
                  )
                ]),
              },
            ),
          });
        }

        safeSetState(() {});
      },
    );
    _model.textController2 ??= TextEditingController(
        text: functions.getInitialValue(widget.result!, widget.fieldId!));
    _model.textFieldFocusNode2 ??= FocusNode();
    _model.textFieldFocusNode2!.addListener(
      () async {
        if (functions.checkResultValues(widget.result!, widget.fieldId!)) {
          _model.updatedResultNumberCopy = await actions.updateResultValue(
            widget.result!,
            widget.fieldId!,
            _model.textController2.text,
          );

          await widget.result!.reference.update({
            ...mapToFirestore(
              {
                'result_values': getResultValuesListFirestoreData(
                  _model.updatedResultNumberCopy?.resultValues,
                ),
              },
            ),
          });
        } else {
          await widget.result!.reference.update({
            ...mapToFirestore(
              {
                'result_values': FieldValue.arrayUnion([
                  getResultValuesFirestoreData(
                    updateResultValuesStruct(
                      ResultValuesStruct(
                        resultValueId: _model.uuid,
                        resultId: widget.result?.resultId,
                        fieldId: widget.fieldId,
                        label: widget.label,
                        value: _model.textController2.text,
                        type: widget.type,
                      ),
                      clearUnsetFields: false,
                    ),
                    true,
                  )
                ]),
              },
            ),
          });
        }

        safeSetState(() {});
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Builder(
          builder: (context) {
            if (widget.type == 1) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.label!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Albert Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                  TextFormField(
                    controller: _model.textController1,
                    focusNode: _model.textFieldFocusNode1,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController1',
                      const Duration(milliseconds: 2000),
                      () async {
                        if (functions.checkResultValues(
                            widget.result!, widget.fieldId!)) {
                          _model.updatedResult =
                              await actions.updateResultValue(
                            widget.result!,
                            widget.fieldId!,
                            _model.textController1.text,
                          );

                          await widget.result!.reference.update({
                            ...mapToFirestore(
                              {
                                'result_values':
                                    getResultValuesListFirestoreData(
                                  _model.updatedResult?.resultValues,
                                ),
                              },
                            ),
                          });
                        } else {
                          await widget.result!.reference.update({
                            ...mapToFirestore(
                              {
                                'result_values': FieldValue.arrayUnion([
                                  getResultValuesFirestoreData(
                                    updateResultValuesStruct(
                                      ResultValuesStruct(
                                        resultValueId: _model.uuid,
                                        resultId: widget.result?.resultId,
                                        fieldId: widget.fieldId,
                                        label: widget.label,
                                        value: _model.textController1.text,
                                        type: widget.type,
                                      ),
                                      clearUnsetFields: false,
                                    ),
                                    true,
                                  )
                                ]),
                              },
                            ),
                          });
                        }

                        safeSetState(() {});
                      },
                    ),
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Albert Sans',
                                letterSpacing: 0.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Albert Sans',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      suffixIcon: _model.textController1!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.textController1?.clear();
                                if (functions.checkResultValues(
                                    widget.result!, widget.fieldId!)) {
                                  _model.updatedResult =
                                      await actions.updateResultValue(
                                    widget.result!,
                                    widget.fieldId!,
                                    _model.textController1.text,
                                  );

                                  await widget.result!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'result_values':
                                            getResultValuesListFirestoreData(
                                          _model.updatedResult?.resultValues,
                                        ),
                                      },
                                    ),
                                  });
                                } else {
                                  await widget.result!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'result_values': FieldValue.arrayUnion([
                                          getResultValuesFirestoreData(
                                            updateResultValuesStruct(
                                              ResultValuesStruct(
                                                resultValueId: _model.uuid,
                                                resultId:
                                                    widget.result?.resultId,
                                                fieldId: widget.fieldId,
                                                label: widget.label,
                                                value:
                                                    _model.textController1.text,
                                                type: widget.type,
                                              ),
                                              clearUnsetFields: false,
                                            ),
                                            true,
                                          )
                                        ]),
                                      },
                                    ),
                                  });
                                }

                                safeSetState(() {});
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 20.0,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Albert Sans',
                          letterSpacing: 0.0,
                        ),
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator:
                        _model.textController1Validator.asValidator(context),
                  ),
                ].divide(const SizedBox(height: 8.0)),
              );
            } else if (widget.type == 2) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.label!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Albert Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                  TextFormField(
                    controller: _model.textController2,
                    focusNode: _model.textFieldFocusNode2,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController2',
                      const Duration(milliseconds: 2000),
                      () async {
                        if (functions.checkResultValues(
                            widget.result!, widget.fieldId!)) {
                          _model.updatedResultNumber =
                              await actions.updateResultValue(
                            widget.result!,
                            widget.fieldId!,
                            _model.textController2.text,
                          );

                          await widget.result!.reference.update({
                            ...mapToFirestore(
                              {
                                'result_values':
                                    getResultValuesListFirestoreData(
                                  _model.updatedResultNumber?.resultValues,
                                ),
                              },
                            ),
                          });
                        } else {
                          await widget.result!.reference.update({
                            ...mapToFirestore(
                              {
                                'result_values': FieldValue.arrayUnion([
                                  getResultValuesFirestoreData(
                                    updateResultValuesStruct(
                                      ResultValuesStruct(
                                        resultValueId: _model.uuid,
                                        resultId: widget.result?.resultId,
                                        fieldId: widget.fieldId,
                                        label: widget.label,
                                        value: _model.textController2.text,
                                        type: widget.type,
                                      ),
                                      clearUnsetFields: false,
                                    ),
                                    true,
                                  )
                                ]),
                              },
                            ),
                          });
                        }

                        safeSetState(() {});
                      },
                    ),
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Albert Sans',
                                letterSpacing: 0.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Albert Sans',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      suffixIcon: _model.textController2!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.textController2?.clear();
                                if (functions.checkResultValues(
                                    widget.result!, widget.fieldId!)) {
                                  _model.updatedResultNumber =
                                      await actions.updateResultValue(
                                    widget.result!,
                                    widget.fieldId!,
                                    _model.textController2.text,
                                  );

                                  await widget.result!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'result_values':
                                            getResultValuesListFirestoreData(
                                          _model.updatedResultNumber
                                              ?.resultValues,
                                        ),
                                      },
                                    ),
                                  });
                                } else {
                                  await widget.result!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'result_values': FieldValue.arrayUnion([
                                          getResultValuesFirestoreData(
                                            updateResultValuesStruct(
                                              ResultValuesStruct(
                                                resultValueId: _model.uuid,
                                                resultId:
                                                    widget.result?.resultId,
                                                fieldId: widget.fieldId,
                                                label: widget.label,
                                                value:
                                                    _model.textController2.text,
                                                type: widget.type,
                                              ),
                                              clearUnsetFields: false,
                                            ),
                                            true,
                                          )
                                        ]),
                                      },
                                    ),
                                  });
                                }

                                safeSetState(() {});
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 20.0,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Albert Sans',
                          letterSpacing: 0.0,
                        ),
                    keyboardType: TextInputType.number,
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator:
                        _model.textController2Validator.asValidator(context),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                  ),
                ].divide(const SizedBox(height: 8.0)),
              );
            } else if (widget.type == 3) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Albert Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      final selectedMedia = await selectMedia(
                        maxWidth: 720.00,
                        maxHeight: 720.00,
                        includeDimensions: true,
                        includeBlurHash: true,
                        multiImage: false,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        safeSetState(() => _model.isDataUploading = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        var downloadUrls = <String>[];
                        try {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          selectedUploadedFiles = selectedMedia
                              .map((m) => FFUploadedFile(
                                    name: m.storagePath.split('/').last,
                                    bytes: m.bytes,
                                    height: m.dimensions?.height,
                                    width: m.dimensions?.width,
                                    blurHash: m.blurHash,
                                  ))
                              .toList();

                          downloadUrls = (await Future.wait(
                            selectedMedia.map(
                              (m) async =>
                                  await uploadData(m.storagePath, m.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          _model.isDataUploading = false;
                        }
                        if (selectedUploadedFiles.length ==
                                selectedMedia.length &&
                            downloadUrls.length == selectedMedia.length) {
                          safeSetState(() {
                            _model.uploadedLocalFile =
                                selectedUploadedFiles.first;
                            _model.uploadedFileUrl = downloadUrls.first;
                          });
                          showUploadMessage(context, 'Success!');
                        } else {
                          safeSetState(() {});
                          showUploadMessage(context, 'Failed to upload data');
                          return;
                        }
                      }

                      if (functions.checkResultValues(
                          widget.result!, widget.fieldId!)) {
                        _model.updatedResultImage =
                            await actions.updateResultValue(
                          widget.result!,
                          widget.fieldId!,
                          _model.uploadedFileUrl,
                        );

                        await widget.result!.reference.update({
                          ...mapToFirestore(
                            {
                              'result_values': getResultValuesListFirestoreData(
                                _model.updatedResultCopy?.resultValues,
                              ),
                            },
                          ),
                        });
                      } else {
                        await widget.result!.reference.update({
                          ...mapToFirestore(
                            {
                              'result_values': FieldValue.arrayUnion([
                                getResultValuesFirestoreData(
                                  updateResultValuesStruct(
                                    ResultValuesStruct(
                                      resultValueId: _model.uuid,
                                      resultId: widget.result?.resultId,
                                      fieldId: widget.fieldId,
                                      label: widget.label,
                                      value: _model.uploadedFileUrl,
                                      type: widget.type,
                                    ),
                                    clearUnsetFields: false,
                                  ),
                                  true,
                                )
                              ]),
                            },
                          ),
                        });
                      }

                      safeSetState(() {});
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          () {
                            if (_model.uploadedFileUrl != '') {
                              return _model.uploadedFileUrl;
                            } else if (functions.getInitialValue(
                                        widget.result!, widget.fieldId!) !=
                                    '') {
                              return functions.imagePathFromUrl(
                                  functions.getInitialValue(
                                      widget.result!, widget.fieldId!));
                            } else {
                              return 'https://placehold.co/240?text=Upload%20Picture';
                            }
                          }(),
                          'https://placehold.co/240?text=Upload%20Picture',
                        ),
                        width: 120.0,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ].divide(const SizedBox(height: 8.0)),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
