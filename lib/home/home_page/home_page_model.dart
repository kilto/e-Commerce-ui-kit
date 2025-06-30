import '/component/item_card/item_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // State field(s) for Banner widget.
  PageController? bannerController;

  int get bannerCurrentIndex => bannerController != null &&
          bannerController!.hasClients &&
          bannerController!.page != null
      ? bannerController!.page!.round()
      : 0;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // Model for ItemCard component.
  late ItemCardModel itemCardModel1;
  // Model for ItemCard component.
  late ItemCardModel itemCardModel2;
  // Model for ItemCard component.
  late ItemCardModel itemCardModel3;
  // Model for ItemCard component.
  late ItemCardModel itemCardModel4;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for ItemCard component.
  late ItemCardModel itemCardModel5;
  // Model for ItemCard component.
  late ItemCardModel itemCardModel6;
  // Model for ItemCard component.
  late ItemCardModel itemCardModel7;
  // Model for ItemCard component.
  late ItemCardModel itemCardModel8;
  // Model for ItemCard component.
  late ItemCardModel itemCardModel9;
  // Model for ItemCard component.
  late ItemCardModel itemCardModel10;

  @override
  void initState(BuildContext context) {
    itemCardModel1 = createModel(context, () => ItemCardModel());
    itemCardModel2 = createModel(context, () => ItemCardModel());
    itemCardModel3 = createModel(context, () => ItemCardModel());
    itemCardModel4 = createModel(context, () => ItemCardModel());
    itemCardModel5 = createModel(context, () => ItemCardModel());
    itemCardModel6 = createModel(context, () => ItemCardModel());
    itemCardModel7 = createModel(context, () => ItemCardModel());
    itemCardModel8 = createModel(context, () => ItemCardModel());
    itemCardModel9 = createModel(context, () => ItemCardModel());
    itemCardModel10 = createModel(context, () => ItemCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    itemCardModel1.dispose();
    itemCardModel2.dispose();
    itemCardModel3.dispose();
    itemCardModel4.dispose();
    itemCardModel5.dispose();
    itemCardModel6.dispose();
    itemCardModel7.dispose();
    itemCardModel8.dispose();
    itemCardModel9.dispose();
    itemCardModel10.dispose();
  }
}
