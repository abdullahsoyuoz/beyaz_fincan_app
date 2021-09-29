import 'dart:ui';

import 'package:beyaz_fincan_app/Model/UserEntity.dart';
import 'package:beyaz_fincan_app/Pages/App/MyProfilePage.dart';
import 'package:beyaz_fincan_app/Test/testData.dart';
import 'package:beyaz_fincan_app/Utility/AppAssetPaths.dart';
import 'package:beyaz_fincan_app/Utility/AppUtility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

class CustomAppBar extends StatefulWidget {
  UserEntity user;
  GlobalKey<ScaffoldState> scaffoldKey;
  CustomAppBar(this.user, this.scaffoldKey, {Key key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(context),
      height: 79,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.white.withAlpha(20),
          Colors.black.withAlpha(80),
        ],
      )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.ellipsisV,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    widget.scaffoldKey.currentState.openDrawer();
                  },
                ),
                Text(
                  'Beyaz\t\n\t\t\tFincan',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${widget.user.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${widget.user.point}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 3.0,
                              ),
                              child: Image.asset(appAssetsPathRate),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 16.0,
                      left: 8,
                    ),
                    child: InkWell(
                      onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => MyProfilePage(faeLoginUser),)),
                      child: UserProfileAvatar(
                        avatarUrl: faeLoginUser.photoUrl,
                        radius: 30,
                        notificationCount: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
