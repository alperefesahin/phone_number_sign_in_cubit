import 'package:flutter/material.dart';
import 'package:phone_number_sign_in/presentation/common_widgets/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.appBarTitle,
    required this.appBarAction,
    this.appBarLeading,
  })  : preferredSize = const Size.fromHeight(70.0),
        super(key: key);

  @override
  final Size preferredSize;
  final String appBarTitle;
  final IconData? appBarLeading;
  final IconData appBarAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: customIndigoColor,
      toolbarHeight: 80,
      elevation: 0,
      title: Text(appBarTitle),
      leadingWidth: 90,
      leading: IconButton(onPressed: () {}, icon: Icon(appBarLeading)),
      actions: [Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(onPressed: () {}, icon: Icon(appBarAction,size: 28)),
      )],
    );
  }
}
