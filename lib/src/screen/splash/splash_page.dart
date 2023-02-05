import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:cauvongstore_mobile/src/screen/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:cauvongstore_mobile/src/utils/parse_hex_color.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return _SplashPage();
  }
}

class _SplashPage extends StatefulWidget {
  const _SplashPage({Key? key}) : super(key: key);

  @override
  State<_SplashPage> createState() => __SplashPageState();
}

class __SplashPageState extends State<_SplashPage> {
  int _value = 0;
  int _totalValue = 100;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      // this._splashContentState.currentState.startLoading(100);
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SplashContent(
            // key: _splashContentState,
            deviceHeight: MyDeviceUI(context).deviceHeight,
            deviceWidth: MyDeviceUI(context).deviceWidth,
            loadingCompleted: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                  (_) => false);
              // }
            },
          ),
        ),
      ),
    );
  }
}

class SplashContent extends StatefulWidget {
  final double deviceWidth;
  final double deviceHeight;
  final Function loadingCompleted;

  const SplashContent(
      {required this.deviceWidth,
      required this.deviceHeight,
      required this.loadingCompleted,
      Key? key})
      : super(key: key);

  @override
  _SplashContentState createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  int _value = 0;
  final int _totalValue = 100;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      startLoading(100);
    }
  }

  @override
  Widget build(BuildContext context) {
    double contentWidth = widget.deviceWidth * 0.7;
    // double contentHeight = widget.deviceHeight * 0.35;
    double ratio = this._value / this._totalValue;

    return Container(
      width: contentWidth,
      // height: contentHeight,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              width: contentWidth * 0.7,
              child: Image.asset(Const.imgLogoAssets),
              color: Colors.white,
            ),
            // flex: 7,
          ),
          Flexible(
            child: Container(
              color: Colors.white,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Chào mừng đến với \nCửa hàng Cầu Vồng'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSizeText.fontLargeSize,
                    color: ParseHexToColor(HexColor.black),
                  ),
                ),
              ),
            ),
            // flex: 1,
          ),
          SizedBox(height: 20.0),
          Container(
            width: contentWidth * 0.6,
            height: 10,
            // padding: const EdgeInsets.all(1.5),
            // margin: EdgeInsets.only(top: contentHeight * 0.05),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: ParseHexToColor(HexColor.forestGreen), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                ),
                AnimatedContainer(
                  width: contentWidth * 0.6 * ratio,
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      color: ParseHexToColor(HexColor.forestGreen),
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  onEnd: () {
                    if (this._value == this._totalValue) {
                      widget.loadingCompleted();
                    }
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Flexible(
            child: Container(
              color: Colors.white,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  _value.toString() + '%',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSizeText.fontNormalSize,
                    color: ParseHexToColor(HexColor.darkRed),
                  ),
                ),
              ),
            ),
            // flex: 1,
          ),
        ],
      ),
    );
  }

  /// Start loading progress bar,
  /// [condition] to pause loading state, maximum is 100
  Future<void> startLoading(int condition) async {
    await Future.delayed(Duration(milliseconds: 500));
    while (this._value < condition) {
      setState(() {
        this._value += 10;
      });
      await Future.delayed(Duration(milliseconds: 300));
    }
  }
}
