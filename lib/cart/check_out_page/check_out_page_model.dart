import '/flutter_flow/flutter_flow_util.dart';
import 'check_out_page_widget.dart' show CheckOutPageWidget;
import 'package:flutter/material.dart';

class CheckOutPageModel extends FlutterFlowModel<CheckOutPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
