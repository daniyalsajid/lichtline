
import 'package:lichtline/components/input_component.dart';
import 'package:lichtline/components/text_component.dart';
import 'package:lichtline/constants/colors/colors_constants.dart';
import 'package:lichtline/constants/routes/routes_constants.dart';
import 'package:lichtline/constants/strings/string_constants.dart';
import 'package:lichtline/constants/styles/font_styles_constants.dart';
import 'package:lichtline/models/input_comparison_model.dart';
import 'package:lichtline/ui_utils/size_config.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<InputModel> _lichtLine = new List<InputModel>();
  List<InputModel> _altLosung = new List<InputModel>();
  @override
  void initState() {
    super.initState();
    _lichtLine.addAll(
      [
        InputModel(
            fieldName: "Hours", value: "", isRequired: true, isNum: true),
        InputModel(fieldName: "Days", value: "", isRequired: true, isNum: true),
        InputModel(
            fieldName: "Stuck", value: "", isRequired: true, isNum: true),
        InputModel(fieldName: "Watt", value: "", isRequired: true, isNum: true),
        InputModel(
            fieldName: "Price", value: "", isRequired: true, isNum: true),
        InputModel(
            fieldName: "Maintenance P",
            value: "",
            isRequired: true,
            isNum: true),
        InputModel(
            fieldName: "Total hours", value: "", isRequired: true, isNum: true),
      ],
    );
    _altLosung.addAll(
      [
        InputModel(
            fieldName: "Hours", value: "", isRequired: true, isNum: true),
        InputModel(fieldName: "Days", value: "", isRequired: true, isNum: true),
        InputModel(
            fieldName: "Stuck", value: "", isRequired: true, isNum: true),
        InputModel(fieldName: "Watt", value: "", isRequired: true, isNum: true),
        InputModel(
            fieldName: "Price", value: "", isRequired: true, isNum: true),
        InputModel(
            fieldName: "Maintenance P",
            value: "",
            isRequired: true,
            isNum: true),
        InputModel(
            fieldName: "Total hours", value: "", isRequired: true, isNum: true),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 72,
                ),
                TextComponent(
                  text: StringConstant.lichtLine,
                  textStyle: FontStyles.inter(
                      color: ColorConstant.black,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: _altLosung.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Visibility(
                                  visible: index == 0,
                                  child: TextComponent(
                                    text: StringConstant.altLosung,
                                    textStyle: FontStyles.inter(
                                        color: ColorConstant.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Visibility(
                                  visible: index == 0,
                                  child: TextComponent(
                                    text: StringConstant.lichtLine,
                                    textStyle: FontStyles.inter(
                                        color: ColorConstant.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: index == 0,
                              child: SizedBox(
                                height: 20,
                              ),
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: TextInputComponent(
                                    title: _altLosung[index].fieldName,
                                    fillColor: ColorConstant.white,
                                    filled: true,
                                    keyboardType: _altLosung[index].isNum
                                        ? TextInputType.number
                                        : null,
                                    onChanged: (value) {
                                      _altLosung[index].value = value;
                                    },
                                    validator: (value) {
                                      if (value == "") {
                                        return _altLosung[index].fieldName +
                                            " is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                TextComponent(
                                  text: "=>",
                                  textStyle: FontStyles.inter(
                                      color: ColorConstant.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Flexible(
                                  child: TextInputComponent(
                                    title: _lichtLine[index].fieldName,
                                    fillColor: ColorConstant.white,
                                    filled: true,
                                    keyboardType: _lichtLine[index].isNum
                                        ? TextInputType.number
                                        : null,
                                    onChanged: (value) {
                                      _lichtLine[index].value = value;
                                    },
                                    validator: (value) {
                                      if (value == "") {
                                        return _lichtLine[index].fieldName +
                                            " is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorConstant.black,
        elevation: 10,
        onPressed: () => {
          print(_lichtLine)
          // Navigator.pushNamed(context, RouteConstants.menuSelection)
          // if (_formKey.currentState.validate())
          //   {

          //   }
          // else
          //   {print("false")}
        },
        label: Row(
          children: [
            TextComponent(
              text: "Fertig",
              textStyle: FontStyles.inter(
                color: ColorConstant.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
