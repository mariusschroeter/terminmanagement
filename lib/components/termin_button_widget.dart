import 'ff/theme.dart';
import 'ff/widgets.dart';
import 'package:flutter/material.dart';

class TerminButtonWidget extends StatefulWidget {
  const TerminButtonWidget({
    Key? key,
    this.text,
    this.color,
    this.onPressed,
  }) : super(key: key);

  final String? text;
  final Color? color;
  final Function? onPressed;

  @override
  _TerminButtonWidgetState createState() => _TerminButtonWidgetState();
}

class _TerminButtonWidgetState extends State<TerminButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
      child: FFButtonWidget(
        onPressed: () async {
          widget.onPressed!();
        },
        text: widget.text!,
        options: FFButtonOptions(
          width: double.infinity,
          height: 40,
          color: widget.color,
          textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
