import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/components/dynamic_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'form_model.dart';
export 'form_model.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({
    super.key,
    required this.taskName,
    required this.task,
    required this.resultRef,
  });

  final String? taskName;
  final TasksViewRow? task;
  final DocumentReference? resultRef;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late FormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ResultsRecord>(
      stream: ResultsRecord.getDocument(widget.resultRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final formResultsRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 20.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                valueOrDefault<String>(
                  widget.taskName,
                  'Form',
                ),
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Albert Sans',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<List<TaskFormFieldsViewRow>>(
                          future: TaskFormFieldsViewTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'task_id',
                              widget.task?.id,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<TaskFormFieldsViewRow>
                                columnTaskFormFieldsViewRowList =
                                snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: List.generate(
                                  columnTaskFormFieldsViewRowList.length,
                                  (columnIndex) {
                                final columnTaskFormFieldsViewRow =
                                    columnTaskFormFieldsViewRowList[
                                        columnIndex];
                                return wrapWithModel(
                                  model: _model.dynamicFieldModels.getModel(
                                    columnTaskFormFieldsViewRow.id!,
                                    columnIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: DynamicFieldWidget(
                                    key: Key(
                                      'Keyxsn_${columnTaskFormFieldsViewRow.id!}',
                                    ),
                                    label: columnTaskFormFieldsViewRow.label!,
                                    type: columnTaskFormFieldsViewRow.type!,
                                    fieldId: columnTaskFormFieldsViewRow.id!,
                                    task: widget.task!,
                                    result: formResultsRecord,
                                  ),
                                );
                              }).divide(const SizedBox(height: 8.0)),
                            );
                          },
                        ),
                        if (widget.task!.itemsCount! > 0)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Text(
                                    'Goods',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Albert Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                FutureBuilder<List<TaskItemsViewRow>>(
                                  future: TaskItemsViewTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'task_id',
                                      widget.task?.id,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<TaskItemsViewRow>
                                        columnTaskItemsViewRowList =
                                        snapshot.data!;

                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: List.generate(
                                          columnTaskItemsViewRowList.length,
                                          (columnIndex) {
                                        final columnTaskItemsViewRow =
                                            columnTaskItemsViewRowList[
                                                columnIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'FormItem',
                                                queryParameters: {
                                                  'itemId': serializeParam(
                                                    columnTaskItemsViewRow
                                                        .itemId,
                                                    ParamType.String,
                                                  ),
                                                  'itemName': serializeParam(
                                                    columnTaskItemsViewRow
                                                        .itemName,
                                                    ParamType.String,
                                                  ),
                                                  'resultRef': serializeParam(
                                                    widget.resultRef,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'task': serializeParam(
                                                    widget.task,
                                                    ParamType.SupabaseRow,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              child: ListTile(
                                                title: Text(
                                                  columnTaskItemsViewRow
                                                      .itemName!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Albert Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 16.0,
                                                ),
                                                dense: false,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 0.0,
                                                            12.0, 0.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      _model.sbResults = await ResultsTable().queryRows(
                        queryFn: (q) => q.eqOrNull(
                          'id',
                          formResultsRecord.resultId,
                        ),
                      );
                      if (_model.sbResults != null &&
                          (_model.sbResults)!.isNotEmpty) {
                        // Update Result Status
                        await ResultsTable().update(
                          data: {
                            'status': 3,
                            'updated_at':
                                supaSerialize<DateTime>(getCurrentTimestamp),
                            'updated_by':
                                '413db131-b608-425a-bed9-7fe2b8bdae71',
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'id',
                            formResultsRecord.resultId,
                          ),
                        );
                      } else {
                        // Create Result
                        await ResultsTable().insert({
                          'status': 3,
                          'id': formResultsRecord.resultId,
                          'task_id': widget.task?.id,
                          'created_at':
                              supaSerialize<DateTime>(getCurrentTimestamp),
                          'created_by': '413db131-b608-425a-bed9-7fe2b8bdae71',
                          'worker_id': formResultsRecord.workerId,
                        });
                      }

                      await TasksTable().update(
                        data: {
                          'status': 4,
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'id',
                          widget.task?.id,
                        ),
                      );

                      await widget.resultRef!.update(createResultsRecordData(
                        status: 'Done',
                        statusKey: 3,
                      ));
                      context.safePop();

                      safeSetState(() {});
                    },
                    text: 'Save',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 44.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Albert Sans',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
