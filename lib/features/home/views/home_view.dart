import 'package:flutter/material.dart';
import 'package:hungry_app/features/home/widgets/custom_sliverpadding.dart';
import 'package:hungry_app/features/home/widgets/custom_slivertooxAdapter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomSlivertooxadapter(),
            CustomSliverpadding(),
          ],
        ),
      ),
    );
  }
}
