import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:smart_website_creater/view/register/custom_widgets/register_custom_widget.dart';


class RegisterPageview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: RegisterPageWidgets().mobileRegisterWidget(context),
    ));
  }
}
