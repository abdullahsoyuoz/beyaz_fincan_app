import 'package:beyaz_fincan_app/Utility/AppAssetPaths.dart';
import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppConstantTexts.dart';
import 'package:beyaz_fincan_app/Utility/AppDecorations.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:beyaz_fincan_app/Widget/CustomGlowButton.dart';
import 'package:beyaz_fincan_app/Widget/CustomOutlineGlowButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rubber/rubber.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../HomePage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  bool isClickedButton = false;
  bool isClickedRegisterPage = false;
  GlobalKey _formKey = GlobalKey<FormState>();

  FocusNode _loginEmailFocusNode = FocusNode();
  FocusNode _loginPasswordFocusNode = FocusNode();
  FocusNode _registerNicknameFocusNode = FocusNode();
  FocusNode _registerEmailFocusNode = FocusNode();
  FocusNode _registerPasswordFocusNode = FocusNode();
  FocusNode _registerPasswordValidateFocusNode = FocusNode();
  FocusNode _registerNameFocusNode = FocusNode();
  FocusNode _registerSurnameFocusNode = FocusNode();

  // REGISTER VARIABLES
  PageController _pageController = PageController();
  TextEditingController _usernameRegisterController = TextEditingController();
  TextEditingController _emailRegisterController = TextEditingController();
  TextEditingController _passwordRegisterController = TextEditingController();
  TextEditingController _passwordValidateRegisterController =
      TextEditingController();
  TextEditingController _nameRegisterController = TextEditingController();
  TextEditingController _surnameRegisterController = TextEditingController();
  bool isRegisterFirstPageView = true;
  bool isAcceptedTermsAndConditions = false;

  // LOGIN VARIABLES
  TextEditingController _emailLoginController = TextEditingController();
  TextEditingController _passwordLoginController = TextEditingController();

  //  RUBBER VARIABLES
  RubberAnimationController _ruberController;
  ScrollController _scrollController;
  double ruberInitialHeightValue = 0;
  double ruberMaxHeightValue = 1;
  double ruberStandartHeightValue = 0.7;
  double ruberCurrentValue = 0;

  @override
  void initState() {
    super.initState();
    _loginEmailFocusNode.addListener(
        () => rubberFocusNodeHeightController(_loginEmailFocusNode));
    _loginPasswordFocusNode.addListener(
        () => rubberFocusNodeHeightController(_loginPasswordFocusNode));
    _registerNicknameFocusNode.addListener(
        () => rubberFocusNodeHeightController(_registerNicknameFocusNode));
    _registerEmailFocusNode.addListener(
        () => rubberFocusNodeHeightController(_registerEmailFocusNode));
    _registerPasswordFocusNode.addListener(
        () => rubberFocusNodeHeightController(_registerPasswordFocusNode));
    _registerPasswordValidateFocusNode.addListener(() =>
        rubberFocusNodeHeightController(_registerPasswordValidateFocusNode));
    _registerNameFocusNode.addListener(
        () => rubberFocusNodeHeightController(_registerNameFocusNode));
    _registerSurnameFocusNode.addListener(
        () => rubberFocusNodeHeightController(_registerSurnameFocusNode));

    _scrollController = ScrollController();
    _ruberController = RubberAnimationController(
        vsync: this,
        dismissable: true,
        duration: Duration(milliseconds: 200),
        upperBoundValue: AnimationControllerValue(percentage: 1),
        initialValue: ruberInitialHeightValue);
    _ruberController.addListener(() {
      ruberCurrentValue = _ruberController.value;
      if (_ruberController.value == 0) {
        setState(() {
          isClickedButton = false;
          isClickedRegisterPage = false;
        });
      }
      if (_ruberController.value > 0) {
        setState(() {
          isClickedButton = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _loginEmailFocusNode.dispose();
    _loginPasswordFocusNode.dispose();
    _registerNicknameFocusNode.dispose();
    _registerEmailFocusNode.dispose();
    _registerPasswordFocusNode.dispose();
    _registerPasswordValidateFocusNode.dispose();
    _registerNameFocusNode.dispose();
    _registerSurnameFocusNode.dispose();

    _pageController.dispose();

    _usernameRegisterController.dispose();
    _emailRegisterController.dispose();
    _passwordRegisterController.dispose();
    _passwordValidateRegisterController.dispose();
    _nameRegisterController.dispose();
    _surnameRegisterController.dispose();
    _emailLoginController.dispose();
    _passwordLoginController.dispose();

    // _ruberController.dispose();
    _scrollController.dispose();
  }

  void rubberFocusNodeHeightController(FocusNode node) {
    if (node.canRequestFocus) {
      _ruberController.fling(ruberCurrentValue, ruberMaxHeightValue);
    }

    if (!node.hasFocus) {
      _ruberController.fling(ruberCurrentValue, ruberStandartHeightValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: RubberBottomSheet(
          animationController: _ruberController,
          scrollController: _scrollController,
          upperLayer: buildBottomSheet(),
          lowerLayer: buildLowerLayer(context),
          headerHeight: 0,
          header: SizedBox(),
          // TODO: onTap scrolling bug fix
          onTap: () {},
        ),
      ),
    );
  }

  Widget buildLowerLayer(BuildContext context) {
    return Container(
      width: getSize(context),
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(gradient: appGradientBackground),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: getSize(context),
              height: getSize(context) * 1.4,
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.transparent.withOpacity(.7), BlendMode.dstIn),
                      image: AssetImage(appAssetsPathBg1L))),
              child: AnimatedAlign(
                duration: Duration(milliseconds: 200),
                alignment:
                    isClickedButton ? Alignment.topCenter : Alignment.center,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: isClickedButton
                      ? getSize(context) * 0.50
                      : getSize(context) * 0.65,
                  child: Image.asset(
                    appAssetsFalBurc,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: getSize(context),
              margin: EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hoş Geldin!',
                    style: appTextStyleEnterWelcome,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      bottom: 40,
                    ),
                    child: Text(
                      testDataEntrySubTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          fontSize: 13,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  CustomGlowButton(
                    title: "Hemen Başla",
                    onPressed: () {
                      setState(() {
                        _ruberController
                            .fling(ruberCurrentValue, ruberStandartHeightValue)
                            .whenComplete(() {
                          ruberCurrentValue = _ruberController.value;
                        });
                      });
                    },
                    gradientColorStart: appColorButtonOrangeGradientStart,
                    gradientColorEnd: appColorButtonOrangeGradientEnd,
                    width: getSize(context) * 0.9,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildBottomSheet() {
    return StatefulBuilder(
      builder: (context, setStateC) {
        return Container(
          width: getSize(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            color: appColorBgDarkPurple,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Center(
                    child: AnimatedCrossFade(
                      crossFadeState: isClickedRegisterPage
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 200),
                      firstChild: buildRegisterPage(setStateC),
                      secondChild: buildLoginPage(setStateC),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  buildLoginPage(dynamic setStateC) {
    return Container(
      width: getSize(context),
      padding: EdgeInsets.only(
        top: 30,
        bottom: 10,
      ),
      child: Column(
        children: [
          Text(
            'GİRİŞ',
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          buildLoginController(),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: CustomGlowButton(
              title: 'GİRİŞ',
              onPressed: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => HomePage(),
                    ),
                    (route) => false);
              },
              gradientColorStart: appColorButtonOrangeGradientStart,
              gradientColorEnd: appColorButtonOrangeGradientEnd,
              width: getSize(context) * 0.85,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35),
            child: RichText(
              text: TextSpan(text: 'Hâlâ bir hesabın yoksa ', children: [
                TextSpan(
                    text: 'Kaydol',
                    style: TextStyle(
                      color: appColorOrange,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setStateC(() {
                          isClickedRegisterPage = !isClickedRegisterPage;
                        });
                      })
              ]),
            ),
          ),
          Container(
            width: getSize(context) * 0.85,
            margin: EdgeInsets.only(top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomOutlineGlowButton(
                    title: 'Facebook Login',
                    onPressed: () {},
                    gradientColorStart: appColorButtonOrangeGradientStart,
                    gradientColorEnd: appColorPurple,
                    height: 40,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomOutlineGlowButton(
                    title: 'Google Login',
                    onPressed: () {},
                    gradientColorStart: appColorButtonOrangeGradientStart,
                    gradientColorEnd: appColorPurple,
                    height: 40,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildLoginController() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 30,
          ),
          child: InkWell(
            // TODO: login email requestFocus
            onTap: () => _loginEmailFocusNode.requestFocus(),
            child: Container(
              width: getSize(context) * 0.85,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  )),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.envelope,
                        size: 18,
                        color: appColorGrey,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'EMAIL',
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 12,
                                        letterSpacing: 1),
                                  ))),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: TextFormField(
                                focusNode: _loginEmailFocusNode,
                                controller: _emailLoginController,
                                expands: false,
                                style: appTextStyleLoginInput,
                                decoration: InputDecoration(
                                  hintText: 'Email adresinizi giriniz.',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 2,
          ),
          child: InkWell(
            // TODO: login password requestFocus
            onTap: () => _loginPasswordFocusNode.requestFocus(),
            child: Container(
              width: getSize(context) * 0.85,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  )),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.lock,
                        size: 18,
                        color: appColorGrey,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'PAROLA',
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 12,
                                        letterSpacing: 1),
                                  ))),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: TextFormField(
                                controller: _passwordLoginController,
                                focusNode: _loginPasswordFocusNode,
                                expands: false,
                                obscureText: true,
                                obscuringCharacter: '*',
                                style: appTextStyleLoginInput,
                                decoration: InputDecoration(
                                  hintText: 'Şifrenizi giriniz.',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  buildRegisterPage(dynamic setStateC) {
    List<Widget> _pageViewList = [
      buildRegisterFirstView(),
      buildRegisterSecondView(setStateC),
    ];
    return Form(
      key: _formKey,
      child: Container(
        width: getSize(context),
        padding: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          children: [
            Text(
              'KAYIT',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 25,
              ),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _pageViewList.length,
                effect: JumpingDotEffect(
                  dotColor: appColorPurple.withOpacity(.5),
                  activeDotColor: appColorOrange,
                ),
              ),
            ),
            SizedBox(
              height: 210,
              width: getSize(context),
              child: PageView(
                controller: _pageController,
                // physics: NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  setStateC(() {
                    isRegisterFirstPageView = value == 0 ? true : false;
                  });
                },
                children: _pageViewList,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AnimatedCrossFade(
                  crossFadeState: isRegisterFirstPageView
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 300),
                  firstChild: CustomGlowButton(
                    title: 'Devam',
                    onPressed: () {
                      setStateC(() {
                        isRegisterFirstPageView = false;
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeInExpo,
                        );
                      });
                    },
                    gradientColorStart: appColorButtonBlueGradientStart,
                    gradientColorEnd: appColorButtonBlueGradientEnd,
                    width: getSize(context) * 0.85,
                  ),
                  secondChild: CustomGlowButton(
                    title: 'Kaydol',
                    onPressed: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (route) => false);
                    },
                    gradientColorStart: appColorButtonOrangeGradientStart,
                    gradientColorEnd: appColorButtonOrangeGradientEnd,
                    width: getSize(context) * 0.85,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 35),
              child: RichText(
                text: TextSpan(text: 'Bir hesabım var \t', children: [
                  TextSpan(
                      text: 'Giriş Yap',
                      style: TextStyle(
                        color: appColorOrange,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setStateC(() {
                            isClickedRegisterPage = !isClickedRegisterPage;
                          });
                        })
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterFirstView() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 0,
          ),
          child: InkWell(
            // TODO: register nickname requestFocus
            onTap: () => _registerNicknameFocusNode.requestFocus(),
            child: Container(
              width: getSize(context) * 0.85,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  )),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.user,
                        size: 18,
                        color: appColorGrey,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'KULLANICI ADI',
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 12,
                                        letterSpacing: 1),
                                  ))),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: TextFormField(
                                expands: false,
                                focusNode: _registerNicknameFocusNode,
                                controller: _usernameRegisterController,
                                style: appTextStyleLoginInput,
                                decoration: InputDecoration(
                                  hintText: 'Kullanıcı adınızı giriniz.',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 2,
          ),
          child: InkWell(
            // TODO: register email requestFocus
            onTap: () => _registerEmailFocusNode.requestFocus(),
                      child: Container(
              width: getSize(context) * 0.85,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.envelope,
                        size: 18,
                        color: appColorGrey,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'EMAIL',
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 12,
                                        letterSpacing: 1),
                                  ))),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: TextFormField(
                                controller: _emailRegisterController,
                                focusNode: _registerEmailFocusNode,
                                expands: false,
                                style: appTextStyleLoginInput,
                                decoration: InputDecoration(
                                  hintText: 'Email adresinizi giriniz.',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 2,
          ),
          child: InkWell(
            // TODO: register password requestFocus
            onTap: () => _registerPasswordFocusNode.requestFocus(),
                      child: Container(
              width: getSize(context) * 0.85,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.lock,
                        size: 18,
                        color: appColorGrey,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'PAROLA',
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 12,
                                        letterSpacing: 1),
                                  ))),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: TextFormField(
                                controller: _passwordRegisterController,
                                focusNode: _registerPasswordFocusNode,
                                obscureText: true,
                                obscuringCharacter: '*',
                                expands: false,
                                style: appTextStyleLoginInput,
                                decoration: InputDecoration(
                                  hintText: 'Parola belirleyiniz.',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 2,
          ),
          child: InkWell(
            // TODO: register passwordValidate requestFocus
            onTap: () => _registerPasswordValidateFocusNode.requestFocus(),
                      child: Container(
              width: getSize(context) * 0.85,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  )),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.lock,
                        size: 18,
                        color: appColorGrey,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'PAROLA DOĞRULA',
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 12,
                                        letterSpacing: 1),
                                  ))),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: TextFormField(
                                controller: _passwordValidateRegisterController,
                                focusNode: _registerPasswordValidateFocusNode,
                                obscureText: true,
                                obscuringCharacter: '*',
                                expands: false,
                                style: appTextStyleLoginInput,
                                decoration: InputDecoration(
                                  hintText: 'Parolanızı doğrulayınız.',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRegisterSecondView(dynamic setStateC) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 0,
          ),
          child: InkWell(
            // TODO: register name requestFocus
            onTap: () => _registerNameFocusNode.requestFocus(),
                      child: Container(
              width: getSize(context) * 0.85,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  )),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.user,
                        size: 18,
                        color: appColorGrey,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'ADI',
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 12,
                                        letterSpacing: 1),
                                  ))),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: TextFormField(
                                expands: false,
                                controller: _nameRegisterController,
                                focusNode: _registerNameFocusNode,
                                style: appTextStyleLoginInput,
                                decoration: InputDecoration(
                                  hintText: 'Adınızı giriniz.',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 2,
          ),
          child: InkWell(
            // TODO: register surname requestFocus
            onTap: () => _registerSurnameFocusNode.requestFocus(),
                      child: Container(
              width: getSize(context) * 0.85,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  )),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.user,
                        size: 18,
                        color: appColorGrey,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'SOYADI',
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 12,
                                        letterSpacing: 1),
                                  ))),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: TextFormField(
                                controller: _surnameRegisterController,
                                focusNode: _registerSurnameFocusNode,
                                expands: false,
                                style: appTextStyleLoginInput,
                                decoration: InputDecoration(
                                  hintText: 'Soyadınızı giriniz.',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  // TODO: !requestFocus
                  FocusScope.of(context).requestFocus(new FocusNode());
                  setStateC(() {
                    isAcceptedTermsAndConditions =
                        !isAcceptedTermsAndConditions;
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: isAcceptedTermsAndConditions
                          ? Border.all(
                              color: appColorOrange,
                              width: 10,
                            )
                          : Border.all(
                              color: Colors.white,
                              width: 2,
                            )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Şartlar ve Koşulları kabul ediyorum',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
