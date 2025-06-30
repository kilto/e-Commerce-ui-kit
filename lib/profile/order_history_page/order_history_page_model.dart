import '/component/item_list_order_history/item_list_order_history_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'order_history_page_widget.dart' show OrderHistoryPageWidget;
import 'package:flutter/material.dart';

class OrderHistoryPageModel extends FlutterFlowModel<OrderHistoryPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for ItemListOrderHistory component.
  late ItemListOrderHistoryModel itemListOrderHistoryModel1;
  // Model for ItemListOrderHistory component.
  late ItemListOrderHistoryModel itemListOrderHistoryModel2;
  // Model for ItemListOrderHistory component.
  late ItemListOrderHistoryModel itemListOrderHistoryModel3;
  // Model for ItemListOrderHistory component.
  late ItemListOrderHistoryModel itemListOrderHistoryModel4;
  // Model for ItemListOrderHistory component.
  late ItemListOrderHistoryModel itemListOrderHistoryModel5;

  @override
  void initState(BuildContext context) {
    itemListOrderHistoryModel1 =
        createModel(context, () => ItemListOrderHistoryModel());
    itemListOrderHistoryModel2 =
        createModel(context, () => ItemListOrderHistoryModel());
    itemListOrderHistoryModel3 =
        createModel(context, () => ItemListOrderHistoryModel());
    itemListOrderHistoryModel4 =
        createModel(context, () => ItemListOrderHistoryModel());
    itemListOrderHistoryModel5 =
        createModel(context, () => ItemListOrderHistoryModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    itemListOrderHistoryModel1.dispose();
    itemListOrderHistoryModel2.dispose();
    itemListOrderHistoryModel3.dispose();
    itemListOrderHistoryModel4.dispose();
    itemListOrderHistoryModel5.dispose();
  }
}
