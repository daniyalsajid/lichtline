import 'package:flutter/material.dart';
import 'package:lichtline/constants/assets/assets_constants.dart';
import 'package:lichtline/constants/colors/colors_constants.dart';
import 'package:lichtline/constants/routes/routes_constants.dart';
import 'package:lichtline/ui_utils/size_config.dart';

import 'components/text_component.dart';
import 'constants/strings/string_constants.dart';
import 'constants/styles/font_styles_constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () {
        // Navigator.pushNamed(context, RouteConstants.login);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: ColorConstant.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Flexible(
            //   child: SizedBox(
            //     height: SizeConfig.screenHeight / 4,
            //   ),
            // ),

            AppLogo()

            // TextComponent(
            //   text: StringConstant.lichtLine,
            //   textStyle: FontStyles.inter(
            //       color: ColorConstant.white,
            //       fontSize: 38,
            //       fontWeight: FontWeight.bold),
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      child: Image.asset(AssetConstant.logo),
    );
  }
}
