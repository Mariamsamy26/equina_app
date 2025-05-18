import 'package:equina_task/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabView extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> views;
  final int initialTabIndex;

  const CustomTabView({
    super.key,
    required this.tabs,
    required this.views,
    required this.initialTabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: initialTabIndex,
      child: Column(
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: black,
            indicatorColor: mainBlue,
            tabs: tabs.map((title) => Tab(text: title)).toList(),
          ),
          SizedBox(height: 470.h, child: TabBarView(children: views)),
        ],
      ),
    );
  }
}
