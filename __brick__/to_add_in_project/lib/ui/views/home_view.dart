import 'package:flutter/material.dart';
import 'package:{{project_name}}/core/viewmodels/home_vm.dart';
import 'package:{{project_name}}/ui/views/base_view.dart';
import 'package:{{project_name}}/ui/widgets/side_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeVM>(
      builder: (context, vm, child) => const Placeholder(),
    );
  }
}
