import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

Widget loadCircular(BuildContext context) {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );
}

class DispLoading {
  static final DispLoading _dispload = DispLoading._dispload;
  static bool bShow = true;
  factory DispLoading() {
    bShow = false;
    return _dispload;
  }

  static Future<void> show([BuildContext? context, String? message]) async {
    bShow = true;
    return await showDialog(
      barrierDismissible: false,
      context: context ?? navigatorKey.currentState!.context,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                message ?? ('Đang tải...'),
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static bool isShowing() {
    bool tmp = bShow;
    bShow = false;
    return tmp;
  }

  // static Future<Null> showVersionDialog() async {
  //   _launchURL(String url) async {
  //     Uri urlParse = Uri.parse(url);
  //     if (await canLaunchUrl(urlParse)) {
  //       await launchUrl(urlParse);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   }

}

class DispErrorMsg {
  static Future<bool> show({
    required BuildContext context,
    String? msg,
  }) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
              child: CustomDialogErrorMessage(
                text: msg ?? "Lỗi",
                onPress: () async {
                  Navigator.of(context).pop(true);
                  // await DialogEventHandle.eventPrimaryButton(context, msg);
                },
              ),
              onWillPop: () async => false);
        });
  }

  // static Future<bool> showForgotPass({String title, final String msg}) async {
  //   return await showDialog(
  //       context: navigatorKey.currentState.context,
  //       barrierDismissible: false,
  //       builder: (context) {
  //         return WillPopScope(
  //             child: CustomDialogErrorMessageForgotPass(
  //               text: msg,
  //               onPress: () async {
  //                 await DialogEventHandle.eventPrimaryButton(context, msg);
  //               },
  //             ),
  //             onWillPop: () async => false);
  //       });
  // }
}

class CustomDialogErrorMessage extends StatelessWidget {
  final String? text;
  final VoidCallback onPress;

  const CustomDialogErrorMessage({
    Key? key,
    this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: const EdgeInsets.all(20),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: Container(
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xFFFFFF),
              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text ?? "Lỗi",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    fontSize: FontSizeText.fontNormalSize,
                    color: Color(0xff2f2f2f),
                    letterSpacing: -0.32,
                    height: 1.625,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: CustomGradientButton(
                    width: 120,
                    height: 40,
                    text: "Đóng",
                    onPressed: onPress,
                  ),
                ),
              ],
            )));
  }
}

class CustomGradientButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final Color contentColor;
  final List<Color> gradientColor;
  final double borderSize;
  final BorderRadius borderRadius;
  final double fontSize;
  final double width;
  final double height;
  final FontWeight fontWeight;
  final void Function() onPressed;
  final void Function()? onLongPressed;

  const CustomGradientButton({
    Key? key,
    required this.width,
    required this.height,
    this.text = '',
    this.fontSize = FontSizeText.fontNormalSize,
    this.fontWeight = FontWeight.normal,
    this.backgroundColor = Colors.white,
    this.borderColor = AppColor.darkBlueDialog,
    this.borderRadius = const BorderRadius.all(Radius.circular(30.0)),
    this.contentColor = Colors.white,
    this.gradientColor = const [AppColor.lightBlueDialog, AppColor.blue],
    this.borderSize = 3.0,
    required this.onPressed,
    this.onLongPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width ?? 200,
      height: this.height ?? 60,
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 5.0, bottom: 5.0, left: 3.0, right: 3.0),
          child: Center(
            child: Text(
              this.text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: this.contentColor,
                  fontSize: this.fontSize,
                  fontWeight: this.fontWeight),
            ),
          ),
        ),
        onPressed: onPressed,
        onLongPress: this.onLongPressed,
      ),
      decoration: BoxDecoration(
        borderRadius: this.borderRadius,
        boxShadow: [
          const BoxShadow(
              color: Colors.black54,
              spreadRadius: 0.5,
              blurRadius: 3,
              offset: Offset(1, 1))
        ],
        gradient: LinearGradient(
            colors: gradientColor,
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }
}

class DispConfirmMsg {
  static Future<bool> show(
      {String? title,
      required BuildContext context,
      required final String msg,
      required String buttonYes,
      required String buttonNo}) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        /*builder: (context) => AlertMessagePageState(
          title: title, content: msg, yes: BTN_OK, no: BTN_NO),*/
        builder: (context) {
          return WillPopScope(
              child: AlertDialog(
                insetPadding: const EdgeInsets.all(20),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                content: Container(
                  // width: MediaQuery.of(context).size.width * 0.8,
                  // height: MediaQuery.of(context).size.height * 0.35,
                  // padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 25.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 25.0),
                          child: Text(
                            title ?? "",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: FontSizeText.fontLargeSize,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 25.0),
                          child: Text(
                            msg,
                            maxLines: 6,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: FontSizeText.fontNormalSize,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.zero,
                              margin: const EdgeInsets.only(right: 15.0),
                              child: CustomOutlineButton(
                                text: buttonNo ?? "Không",
                                width: 120,
                                height: 50,
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                              ),
                            )),
                            Expanded(
                                child: Container(
                              margin: const EdgeInsets.only(left: 5.0),
                              padding: EdgeInsets.zero,
                              child: CustomGradientButton(
                                width: 120,
                                height: 50,
                                text: buttonYes ?? "Xác nhận",
                                onPressed: () async {
                                  // await DialogEventHandle.eventPrimaryButton(
                                  //     context, msg);
                                },
                              ),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onWillPop: () async => false);
        });
  }
}

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final Color contentColor;
  final double borderSize;
  final BorderRadius borderRadius;
  final double fontSize;
  final double? width;
  final double? height;
  final FontWeight fontWeight;
  final void Function() onPressed;
  final void Function()? onLongPressed;

  const CustomOutlineButton({
    Key? key,
    this.width,
    this.height,
    this.text = '',
    this.fontSize = FontSizeText.fontNormalSize,
    this.fontWeight = FontWeight.normal,
    this.backgroundColor = Colors.white,
    this.borderColor = AppColor.darkBlueDialog,
    this.borderRadius = const BorderRadius.all(Radius.circular(30.0)),
    this.contentColor = AppColor.darkBlueDialog,
    this.borderSize = 3.0,
    required this.onPressed,
    this.onLongPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width ?? 200,
      height: this.height ?? 60,
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 0, right: 0),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: contentColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight),
            ),
          ),
        ),
        onPressed: onPressed,
        onLongPress: onLongPressed,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: borderSize),
        borderRadius: borderRadius,
        boxShadow: [
          const BoxShadow(
              color: Colors.black54,
              spreadRadius: 0.5,
              blurRadius: 3,
              offset: Offset(1, 1))
        ],
      ),
    );
  }
}
