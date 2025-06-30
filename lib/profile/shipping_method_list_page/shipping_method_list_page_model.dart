import '/flutter_flow/flutter_flow_util.dart';
import 'shipping_method_list_page_widget.dart'
    show ShippingMethodListPageWidget;
import 'package:flutter/material.dart';

class ShippingMethodListPageModel
    extends FlutterFlowModel<ShippingMethodListPageWidget> {
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
