import '/component/item_list_order_history/item_list_order_history_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'order_history_detail_page_widget.dart'
    show OrderHistoryDetailPageWidget;
import 'package:flutter/material.dart';

class OrderHistoryDetailPageModel
    extends FlutterFlowModel<OrderHistoryDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ItemListOrderHistory component.
  late ItemListOrderHistoryModel itemListOrderHistoryModel1;
  // Model for ItemListOrderHistory component.
  late ItemListOrderHistoryModel itemListOrderHistoryModel2;

  @override
  void initState(BuildContext context) {
    itemListOrderHistoryModel1 =
        createModel(context, () => ItemListOrderHistoryModel());
    itemListOrderHistoryModel2 =
        createModel(context, () => ItemListOrderHistoryModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    itemListOrderHistoryModel1.dispose();
    itemListOrderHistoryModel2.dispose();
  }
}
