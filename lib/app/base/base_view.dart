// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:intesasoft_demo/app/enums/viewstate.dart';
import 'package:intesasoft_demo/views/home/home_view.dart';
import 'package:provider/provider.dart';
import 'base_model.dart';
import '../../locator.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T) onModelReady;
  final Function(T) onDispose;

  const BaseView(
      {Key? key,
      required this.builder,
      required this.onModelReady,
      required this.onDispose})
      : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      nextTick(() {
        widget.onModelReady(model);
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = ChangeNotifierProvider.value(
        child: Consumer<T>(builder: widget.builder), value: model);
    return model.viewState == ViewState.Busy
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : child;
  }
}
