import 'package:avatar_glow/avatar_glow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:my_app/Pages/Profile/profile.dart';
import 'package:my_app/Services/GeneralFunctions/functions.dart';

class MainAppBar extends StatelessWidget {
  final String image;
  final String userName;
  final String email;
  final String uid;
  final String status;
  const MainAppBar(
      {Key key, this.image, this.userName, this.email, this.uid, this.status})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 8,
          top: 12,
          bottom: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                HapticFeedback.mediumImpact();
                Functions().showMenu(context);
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFb615dd),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  FeatherIcons.alignLeft,
                  color: Colors.white,
                ),
              ),
            ),
            AvatarGlow(
              endRadius: 40.0,
              glowColor: Color(0xFFb615dd),
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(
                        name: userName,
                        email: email,
                        image: image,
                        uid: uid,
                        status: status,
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: 'profile',
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: CachedNetworkImageProvider(
                      image == " "
                          ? "https://www.tenforums.com/geek/gars/images/2/types/thumb_15951118880user.png"
                          : image,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
