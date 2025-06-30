import '/component/filter_bottom_sheet/filter_bottom_sheet_widget.dart';
import '/component/item_card/item_card_widget.dart';
import '/component/item_list/item_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'product_list_page_model.dart';
export 'product_list_page_model.dart';

class ProductListPageWidget extends StatefulWidget {
  const ProductListPageWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<ProductListPageWidget> createState() => _ProductListPageWidgetState();
}

class _ProductListPageWidgetState extends State<ProductListPageWidget> {
  late ProductListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductListPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget.title,
              'Title',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 6.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'ddnl49t9' /* 5 ITEMS */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            letterSpacing: 0.0,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 0.0),
                          child: ToggleIcon(
                            onPressed: () async {
                              setState(() =>
                                  _model.isShowAsList = !_model.isShowAsList);
                            },
                            value: _model.isShowAsList,
                            onIcon: Icon(
                              Icons.grid_view,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 32.0,
                            ),
                            offIcon: Icon(
                              Icons.format_list_bulleted_sharp,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 32.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 8.0, 0.0),
                          child: ToggleIcon(
                            onPressed: () async {
                              setState(
                                  () => _model.isFiltered = !_model.isFiltered);
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.85,
                                          child: const FilterBottomSheetWidget(),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            value: _model.isFiltered,
                            onIcon: Icon(
                              Icons.filter_list,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 32.0,
                            ),
                            offIcon: Icon(
                              Icons.filter_list,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 32.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (_model.isShowAsList)
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('ProductDetailPage');
                          },
                          child: wrapWithModel(
                            model: _model.itemListModel1,
                            updateCallback: () => setState(() {}),
                            child: const ItemListWidget(
                              imgUrl: 'https://i.ibb.co/r2f84rs/product9.jpg\n',
                              price: 53.69,
                              title: 'Modern Monk Strap ',
                              rating: 5.0,
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('ProductDetailPage');
                          },
                          child: wrapWithModel(
                            model: _model.itemListModel2,
                            updateCallback: () => setState(() {}),
                            child: const ItemListWidget(
                              imgUrl: 'https://i.ibb.co/Cv7vMW6/product6.jpg',
                              price: 34.83,
                              title: ' Sunset Shimmer Dress',
                              rating: 4.5,
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('ProductDetailPage');
                          },
                          child: wrapWithModel(
                            model: _model.itemListModel3,
                            updateCallback: () => setState(() {}),
                            child: const ItemListWidget(
                              imgUrl: 'https://i.ibb.co/3ytsVJW/product7.jpg\n',
                              price: 13.2,
                              title: 'Elevated Everyday Earrings',
                              rating: 5.0,
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('ProductDetailPage');
                          },
                          child: wrapWithModel(
                            model: _model.itemListModel4,
                            updateCallback: () => setState(() {}),
                            child: const ItemListWidget(
                              imgUrl: 'https://i.ibb.co/qYqyfsM/product8.jpg\n',
                              price: 42.76,
                              priceAfterDiscount: 35.0,
                              title: 'Two-Tone Tote Dress',
                              rating: 5.0,
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('ProductDetailPage');
                          },
                          child: wrapWithModel(
                            model: _model.itemListModel5,
                            updateCallback: () => setState(() {}),
                            child: const ItemListWidget(
                              imgUrl:
                                  'https://i.ibb.co/0jsSB5j/product10.jpg\n',
                              price: 24.03,
                              title: 'Breezy Linen ',
                              rating: 4.5,
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 8.0)),
                    ),
                  ),
                ),
              if (!_model.isShowAsList)
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.5,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('ProductDetailPage');
                          },
                          child: wrapWithModel(
                            model: _model.itemCardModel1,
                            updateCallback: () => setState(() {}),
                            child: const ItemCardWidget(
                              imgUrl: 'https://i.ibb.co/Cv7vMW6/product6.jpg',
                              price: 34.83,
                              title: ' Sunset Shimmer Dress',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('ProductDetailPage');
                          },
                          child: wrapWithModel(
                            model: _model.itemCardModel2,
                            updateCallback: () => setState(() {}),
                            child: const ItemCardWidget(
                              imgUrl: 'https://i.ibb.co/3ytsVJW/product7.jpg\n',
                              price: 13.2,
                              title: 'Elevated Everyday Earrings',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('ProductDetailPage');
                          },
                          child: wrapWithModel(
                            model: _model.itemCardModel3,
                            updateCallback: () => setState(() {}),
                            child: const ItemCardWidget(
                              imgUrl: 'https://i.ibb.co/qYqyfsM/product8.jpg\n',
                              price: 42.76,
                              priceAfterDiscount: 35.0,
                              title: 'Two-Tone Tote Dress',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('ProductDetailPage');
                          },
                          child: wrapWithModel(
                            model: _model.itemCardModel4,
                            updateCallback: () => setState(() {}),
                            child: const ItemCardWidget(
                              imgUrl: 'https://i.ibb.co/r2f84rs/product9.jpg\n',
                              price: 53.69,
                              title: 'Modern Monk Strap ',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('ProductDetailPage');
                          },
                          child: wrapWithModel(
                            model: _model.itemCardModel5,
                            updateCallback: () => setState(() {}),
                            child: const ItemCardWidget(
                              imgUrl:
                                  'https://i.ibb.co/0jsSB5j/product10.jpg\n',
                              price: 24.03,
                              title: 'Breezy Linen ',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
