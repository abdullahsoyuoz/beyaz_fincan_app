import 'dart:ui';

import 'package:beyaz_fincan_app/Utility/AppColors.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> items;
  final ValueChanged<int> onChange;
  final Widget child;

  const CustomDropDown({
    Key key,
    this.items,
    this.child,
    this.onChange,
  })  : assert(items != null),
        super(key: key);
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown>
    with SingleTickerProviderStateMixin {
  GlobalKey _key;
  // GlobalKey _menuKey;
  bool isMenuOpen = false;
  Offset buttonPosition;
  Size buttonSize;
  OverlayEntry _overlayEntry;
  AnimationController _animationController;

  // Size menuSize;
  // Offset menuPosition;
  int selectedIndex;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _key = LabeledGlobalKey("button_icon");
    // _menuKey = LabeledGlobalKey("menu_icon");
    // _menuKey = GlobalKey(debugLabel: 'menu_icon');
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  findButton() {
    RenderBox renderBox = _key.currentContext.findRenderObject();
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  bool hasUnderDrawMenu() {
    if (widget.items.length * buttonSize.height +
            MediaQuery.of(context).padding.bottom >
        MediaQuery.of(context).size.height - buttonPosition.dy) {
      return true;
    }
    return false;
  }

  bool hasOverflowDrawMenu() {
    if (widget.items.length * buttonSize.height +
            MediaQuery.of(context).padding.bottom >
        buttonPosition.dy) {
      return true;
    }
    return false;
  }

  void closeMenu() {
    _overlayEntry.remove();
    _animationController.reverse();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    findButton();
    _animationController.forward();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // TODO: customDropDown !requestFocus
          FocusScope.of(context).requestFocus(new FocusNode());
          if (isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        },
        child: Container(
          key: _key,
          width: getSize(context),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: widget.child,
        ));
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return hasUnderDrawMenu()
            ? Positioned(
                top: buttonPosition.dy -
                    (widget.items.length) * buttonSize.height,
                left: buttonPosition.dx,
                width: buttonSize.width,
                child: Material(
                  color: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 3,
                        sigmaY: 3,
                      ),
                      child: Container(
                        // key: _menuKey,
                        height: widget.items.length * buttonSize.height +
                            2, // +2 -> BORDER
                        decoration: BoxDecoration(
                            color: appColorBgDarkPurple.withOpacity(.8),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: appColorCustomDropDownBorder,
                            )),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(widget.items.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                widget.onChange(index);
                                setState(() {
                                  selectedIndex = index;
                                });
                                closeMenu();
                              },
                              child: Container(
                                width: buttonSize.width,
                                height: buttonSize.height,
                                decoration: index != widget.items.length - 1
                                    ? BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color:
                                                    appColorCustomDropDownBorder)))
                                    : BoxDecoration(),
                                child: Center(
                                    child: Text(
                                  widget.items[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                )),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            
            
            











            : Positioned(
                top: buttonPosition.dy + buttonSize.height,
                left: buttonPosition.dx,
                width: buttonSize.width,
                child: Material(
                  color: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 3,
                        sigmaY: 3,
                      ),
                      child: Container(
                        // key: _menuKey,
                        height: widget.items.length * buttonSize.height +
                            2, // +2 -> BORDER
                        decoration: BoxDecoration(
                            color: appColorBgDarkPurple.withOpacity(.8),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: appColorCustomDropDownBorder,
                            )),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(widget.items.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                widget.onChange(index);
                                setState(() {
                                  selectedIndex = index;
                                });
                                closeMenu();
                              },
                              child: Container(
                                width: buttonSize.width,
                                height: buttonSize.height,
                                decoration: index != widget.items.length - 1
                                    ? BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color:
                                                    appColorCustomDropDownBorder)))
                                    : BoxDecoration(),
                                child: Center(
                                    child: Text(
                                  widget.items[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                )),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
