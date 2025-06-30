import '/flutter_flow/flutter_flow_util.dart';
import 'payment_method_page_widget.dart' show PaymentMethodPageWidget;
import 'package:flutter/material.dart';

class PaymentMethodPageModel extends FlutterFlowModel<PaymentMethodPageWidget> {
  ///  Local state fields for this page.

  int selectedIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
