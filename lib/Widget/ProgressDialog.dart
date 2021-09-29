import 'package:beyaz_fincan_app/Utility/AppAssetPaths.dart';
import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends StatefulWidget {
  ProgressDialog({Key key}) : super(key: key);

  @override
  _ProgressDialogState createState() => _ProgressDialogState();
}

class _ProgressDialogState extends State<ProgressDialog> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: StatefulBuilder(
        builder: (context, setStateC) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Container(
                width: getSize(context) * 0.8,
                height: getSize(context) * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(
                      appAssetsPathBg1L,
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                  gradient: appGradientBackground,
                ),
                child: Column(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        appAssetsFalBurc,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'İşleminiz Yapılıyor',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Lütfen bekleyin..',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
