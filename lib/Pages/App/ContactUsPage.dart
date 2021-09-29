import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppAssetPaths.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppConstantTexts.dart';
import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:beyaz_fincan_app/Widget/CustomAppBar.dart';
import 'package:beyaz_fincan_app/Widget/CustomDrawer.dart';
import 'package:beyaz_fincan_app/Widget/CustomGlowButton.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController requestContactUsController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    requestContactUsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: CustomDrawer(faeLoginUser),
      body: Container(
        width: getSize(context),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: appGradientBackground),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: getSize(context),
                  height: getSize(context) * 1.4,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top * 1.5 + 79),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.transparent.withOpacity(.7),
                              BlendMode.dstIn),
                          image: AssetImage(appAssetsPathBg1L))),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: getSize(context),
                child: Column(
                  // shrinkWrap: true,
                  // padding: EdgeInsets.only(bottom: 500),
                  children: [
                    CustomAppBar(faeLoginUser, _scaffoldKey),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 50.0,
                              left: 20,
                              right: 20,
                            ),
                            child: Text(
                              'Bizimle\nBağlantı Kurun',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 20,
                              right: 20,
                            ),
                            child: Text(
                              '$contactUsContext',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 20,
                              right: 20,
                            ),
                            child: Container(
                              width: getSize(context),
                              height: getSize(context) * 0.8,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: requestContactUsController,
                                maxLines: 10,
                                style: TextStyle(
                                  color: appColorGrey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      'Düşünceleriniz, öneri, şikayet ve destek taleplerinizi yazabilirsiniz.',
                                  hintStyle: TextStyle(
                                    color: appColorGrey.withOpacity(.6),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 25,
                              left: 20.0,
                              right: 20.0,
                            ),
                            child: CustomGlowButton(
                              title: 'GÖNDER',
                              width: getSize(context),
                              onPressed: () {},
                              gradientColorStart:
                                  appColorButtonOrangeGradientStart,
                              gradientColorEnd:
                                  appColorButtonOrangeGradientEnd,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
