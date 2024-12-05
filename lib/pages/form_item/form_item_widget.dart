import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/components/dynamic_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'form_item_model.dart';
export 'form_item_model.dart';

class FormItemWidget extends StatefulWidget {
  const FormItemWidget({
    super.key,
    required this.itemId,
    required this.itemName,
    required this.resultRef,
    required this.task,
  });

  final String? itemId;
  final String? itemName;
  final DocumentReference? resultRef;
  final TasksViewRow? task;

  @override
  State<FormItemWidget> createState() => _FormItemWidgetState();
}

class _FormItemWidgetState extends State<FormItemWidget> {
  late FormItemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormItemModel());

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

        final formItemResultsRecord = snapshot.data!;

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
                  widget.itemName,
                  'Item Form',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: FutureBuilder<List<ItemFormFieldsViewRow>>(
                      future: ItemFormFieldsViewTable().queryRows(
                        queryFn: (q) => q.eqOrNull(
                          'item_id',
                          widget.itemId,
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
                        List<ItemFormFieldsViewRow>
                            columnItemFormFieldsViewRowList = snapshot.data!;

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: List.generate(
                              columnItemFormFieldsViewRowList.length,
                              (columnIndex) {
                            final columnItemFormFieldsViewRow =
                                columnItemFormFieldsViewRowList[columnIndex];
                            return wrapWithModel(
                              model: _model.dynamicFieldModels.getModel(
                                columnItemFormFieldsViewRow.id!,
                                columnIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: DynamicFieldWidget(
                                key: Key(
                                  'Keywyf_${columnItemFormFieldsViewRow.id!}',
                                ),
                                label: columnItemFormFieldsViewRow.label!,
                                type: columnItemFormFieldsViewRow.type!,
                                fieldId: columnItemFormFieldsViewRow.id!,
                                task: widget.task!,
                                result: formItemResultsRecord,
                              ),
                            );
                          }).divide(const SizedBox(height: 8.0)),
                        );
                      },
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      context.safePop();
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
