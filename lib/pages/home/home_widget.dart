import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/sheets/continue_task_sheet/continue_task_sheet_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.supabaseUnsubscribe(
        'tasks',
      );
      await actions.supabaseSubscribe(
        'tasks',
        () async {
          safeSetState(() => _model.requestCompleter = null);
          await _model.waitForRequestCompleted();
        },
      );
      await Future.delayed(const Duration(milliseconds: 1000));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Deliveries',
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
          child: FutureBuilder<List<TasksViewRow>>(
            future: (_model.requestCompleter ??= Completer<List<TasksViewRow>>()
                  ..complete(TasksViewTable().queryRows(
                    queryFn: (q) => q
                        .eqOrNull(
                      'worker_id',
                      '413db131-b608-425a-bed9-7fe2b8bdae71',
                    )
                        .inFilterOrNull(
                      'status_key',
                      [2, 3],
                    ),
                  )))
                .future,
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
              List<TasksViewRow> columnTasksViewRowList = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(columnTasksViewRowList.length,
                      (columnIndex) {
                    final columnTasksViewRow =
                        columnTasksViewRowList[columnIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        var shouldSetState = false;
                        _model.results = await queryResultsRecordOnce(
                          queryBuilder: (resultsRecord) => resultsRecord
                              .where(
                                'task_id',
                                isEqualTo: columnTasksViewRow.id,
                              )
                              .where(
                                'worker_id',
                                isEqualTo: columnTasksViewRow.workerId,
                              )
                              .where(
                                'status_key',
                                isEqualTo: 2,
                              ),
                        );
                        shouldSetState = true;
                        if (_model.results != null &&
                            (_model.results)!.isNotEmpty) {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SizedBox(
                                    height: 414.0,
                                    child: ContinueTaskSheetWidget(
                                      task: columnTasksViewRow,
                                      result: _model.results!.first,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));

                          if (shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          _model.uuid = await actions.createRandomUuid();
                          shouldSetState = true;

                          var resultsRecordReference =
                              ResultsRecord.collection.doc();
                          await resultsRecordReference.set({
                            ...createResultsRecordData(
                              resultId: _model.uuid,
                              projectId: columnTasksViewRow.projectId,
                              project: columnTasksViewRow.projectName,
                              workerId: columnTasksViewRow.workerId,
                              worker: columnTasksViewRow.workerName,
                              taskId: columnTasksViewRow.id,
                              task: columnTasksViewRow.name,
                              placeId: columnTasksViewRow.placeId,
                              place: columnTasksViewRow.place,
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
                          _model.result = ResultsRecord.getDocumentFromData({
                            ...createResultsRecordData(
                              resultId: _model.uuid,
                              projectId: columnTasksViewRow.projectId,
                              project: columnTasksViewRow.projectName,
                              workerId: columnTasksViewRow.workerId,
                              worker: columnTasksViewRow.workerName,
                              taskId: columnTasksViewRow.id,
                              task: columnTasksViewRow.name,
                              placeId: columnTasksViewRow.placeId,
                              place: columnTasksViewRow.place,
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
                          shouldSetState = true;

                          context.pushNamed(
                            'Form',
                            queryParameters: {
                              'taskName': serializeParam(
                                columnTasksViewRow.name,
                                ParamType.String,
                              ),
                              'task': serializeParam(
                                columnTasksViewRow,
                                ParamType.SupabaseRow,
                              ),
                              'resultRef': serializeParam(
                                _model.result?.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );

                          if (shouldSetState) safeSetState(() {});
                          return;
                        }

                        if (shouldSetState) safeSetState(() {});
                      },
                      child: Material(
                        color: Colors.transparent,
                        child: ListTile(
                          title: Text(
                            columnTasksViewRow.name!,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Albert Sans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          subtitle: Text(
                            columnTasksViewRow.address!,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Albert Sans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          dense: false,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
