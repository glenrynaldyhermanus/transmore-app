import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'continue_task_sheet_model.dart';
export 'continue_task_sheet_model.dart';

class ContinueTaskSheetWidget extends StatefulWidget {
  const ContinueTaskSheetWidget({
    super.key,
    required this.task,
    required this.result,
  });

  final TasksViewRow? task;
  final ResultsRecord? result;

  @override
  State<ContinueTaskSheetWidget> createState() =>
      _ContinueTaskSheetWidgetState();
}

class _ContinueTaskSheetWidgetState extends State<ContinueTaskSheetWidget> {
  late ContinueTaskSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContinueTaskSheetModel());

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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x25090F13),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: Container(
                      width: 60.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 44.0,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Continue Task',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Albert Sans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 72.0,
                            height: 72.0,
                            decoration: const BoxDecoration(
                              color: Color(0x332B75DA),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.reset_tv_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 40.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 32.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'You recent task is not finished, do you wish to continue?',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Albert Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              await widget.result!.reference
                                  .update(createResultsRecordData(
                                status: 'Canceled',
                                statusKey: 11,
                              ));
                              _model.uuid = await actions.createRandomUuid();

                              var resultsRecordReference =
                                  ResultsRecord.collection.doc();
                              await resultsRecordReference.set({
                                ...createResultsRecordData(
                                  resultId: _model.uuid,
                                  projectId: widget.task?.projectId,
                                  project: widget.task?.projectName,
                                  workerId: widget.task?.workerId,
                                  worker: widget.task?.workerName,
                                  taskId: widget.task?.id,
                                  task: widget.task?.name,
                                  placeId: widget.task?.placeId,
                                  place: widget.task?.place,
                                  status: 'On Progress',
                                  statusKey: 2,
                                ),
                                ...mapToFirestore(
                                  {
                                    'created_at': FieldValue.serverTimestamp(),
                                    'updated_at': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.newResult =
                                  ResultsRecord.getDocumentFromData({
                                ...createResultsRecordData(
                                  resultId: _model.uuid,
                                  projectId: widget.task?.projectId,
                                  project: widget.task?.projectName,
                                  workerId: widget.task?.workerId,
                                  worker: widget.task?.workerName,
                                  taskId: widget.task?.id,
                                  task: widget.task?.name,
                                  placeId: widget.task?.placeId,
                                  place: widget.task?.place,
                                  status: 'On Progress',
                                  statusKey: 2,
                                ),
                                ...mapToFirestore(
                                  {
                                    'created_at': DateTime.now(),
                                    'updated_at': DateTime.now(),
                                  },
                                ),
                              }, resultsRecordReference);
                              Navigator.pop(context);

                              context.pushNamed(
                                'Form',
                                queryParameters: {
                                  'taskName': serializeParam(
                                    widget.task?.name,
                                    ParamType.String,
                                  ),
                                  'task': serializeParam(
                                    widget.task,
                                    ParamType.SupabaseRow,
                                  ),
                                  'resultRef': serializeParam(
                                    _model.newResult?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );

                              safeSetState(() {});
                            },
                            text: 'Start Over',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Albert Sans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              await widget.result!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'updated_at': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              Navigator.pop(context);

                              context.pushNamed(
                                'Form',
                                queryParameters: {
                                  'taskName': serializeParam(
                                    widget.task?.name,
                                    ParamType.String,
                                  ),
                                  'task': serializeParam(
                                    widget.task,
                                    ParamType.SupabaseRow,
                                  ),
                                  'resultRef': serializeParam(
                                    widget.result?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'Continue',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Albert Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 16.0)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
