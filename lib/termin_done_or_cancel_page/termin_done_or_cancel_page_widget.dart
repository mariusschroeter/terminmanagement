import '../backend/backend.dart';
import '../components/termin_button_widget.dart';
import '../components/ff/icon_button.dart';
import '../components/ff/radio_button.dart';
import '../components/ff/theme.dart';
import '../components/ff/util.dart';
import 'package:flutter/material.dart';

class TerminDoneOrCancelPageWidget extends StatefulWidget {
  const TerminDoneOrCancelPageWidget({
    Key? key,
    this.status,
    this.termin,
  }) : super(key: key);

  final String? status;
  final TermineRecord? termin;

  @override
  _TerminDoneOrCancelPageWidgetState createState() =>
      _TerminDoneOrCancelPageWidgetState();
}

class _TerminDoneOrCancelPageWidgetState
    extends State<TerminDoneOrCancelPageWidget> {
  String? radioButtonValue;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          widget.status == 'done' ? 'Termin abschließen' : 'Termin absagen',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterFlowRadioButton(
                  options: widget.status == 'done'
                      ? [
                          "Termin erfolgreich abgeschlossen",
                          "Termin abgebrochen"
                        ]
                      : [
                          "Termin von uns abgesagt",
                          "Termin vom Kunden abgesagt"
                        ].toList(),
                  onChanged: (val) => setState(() => radioButtonValue = val),
                  optionHeight: 25,
                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                  buttonPosition: RadioButtonPosition.left,
                  direction: Axis.vertical,
                  radioButtonColor: FlutterFlowTheme.of(context).primaryColor,
                  inactiveRadioButtonColor: Color(0x8A000000),
                  toggleable: false,
                  horizontalAlignment: WrapAlignment.start,
                  verticalAlignment: WrapCrossAlignment.start,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                  child: TextFormField(
                    controller: textController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Kommentar',
                      hintText: 'Ein Kommentar zum Termin',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                    maxLines: null,
                    minLines: 5,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Abschließen',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ],
                ),
                TerminButtonWidget(
                  text: widget.status == 'done'
                      ? 'Termin abschließen'
                      : 'Termin absagen',
                  color: widget.status == 'done'
                      ? FlutterFlowTheme.of(context).primaryColor
                      : FlutterFlowTheme.of(context).secondaryText,
                  onPressed: () async {
                    if (radioButtonValue != null) {
                      final termineUpdateData = createTermineRecordData(
                        status: widget.status,
                        statusComment: radioButtonValue,
                        comment: textController!.text,
                        isDone: true,
                      );
                      await widget.termin!.reference.update(termineUpdateData);

                      context.goNamed(
                        'TerminPage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                            duration: Duration(milliseconds: 300),
                          ),
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
