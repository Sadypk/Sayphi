import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sayphi/demo_files.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class HomeScreenUserView extends StatefulWidget {
  const HomeScreenUserView({Key? key}) : super(key: key);

  @override
  _HomeScreenUserViewState createState() => _HomeScreenUserViewState();
}

class _HomeScreenUserViewState extends State<HomeScreenUserView> {
  @override
  Widget build(BuildContext context) {

    _buildAppBar() {
      return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              Demo.PROFILE_IMAGE
            ),
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.star_rounded,
                  color: AppColor.DARK_GREY,
                ),
              )
          )
        ],
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
    );
  }
}
