import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:{{project_name}}/core/viewmodels/base_vm.dart';
import 'package:{{project_name}}/helpers/dependency_assembly.dart';

class BaseView<T extends BaseVM> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel, Widget? child)?
      builder;
  final Function(T)? onVMReady;
  final Function(T)? onVMDispose;
  final Function(T, AppLifecycleState)? didChange;

  BaseView({this.builder, this.onVMReady, this.onVMDispose, this.didChange});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseVM> extends State<BaseView<T>>
    with WidgetsBindingObserver {
  T viewModel = dependencyAssembler<T>();

  @override
  void initState() {
    if (widget.onVMReady != null) {
      widget.onVMReady!(viewModel);
    }
    if (widget.didChange != null) {
      WidgetsBinding.instance.addObserver(this);
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.onVMDispose != null) {
      widget.onVMDispose!(viewModel);
    }
    if (widget.didChange != null) {
      WidgetsBinding.instance.removeObserver(this);
    }

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (widget.didChange != null) {
      widget.didChange!(viewModel, state);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewModel,
      child: Consumer<T>(
        builder: widget.builder!,
      ),
    );
  }
}
