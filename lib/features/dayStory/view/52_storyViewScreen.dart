import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sayphi/features/dayStory/view_model/dayViewModel.dart';
import 'package:sayphi/mainApp/components/cahcedImage.dart';
import 'package:sayphi/mainApp/helpers/timeHelper.dart';
import 'package:story/story.dart';

class SeeStoryView extends StatefulWidget {

  final int? storyIndex;

  const SeeStoryView({Key? key, this.storyIndex}) : super(key: key);

  @override
  _SeeStoryViewState createState() => _SeeStoryViewState();
}

class _SeeStoryViewState extends State<SeeStoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryPageView(
        initialPage: widget.storyIndex ?? 0,
        indicatorDuration: Duration(seconds: 7),
        itemBuilder: (context, userIndex, storyIndex) {
          final _user = DayViewModel.allDay[userIndex];
          final _story = _user.day[storyIndex];

          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                child: CImage(_story.image)
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44, left: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(_user.profileImage),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _user.name,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          TimeHelper.getDayTime(_story.createdAt),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: IconButton(
                padding: EdgeInsets.zero,
                color: Colors.white,
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
        pageLength: DayViewModel.allDay.length,
        storyLength: (int pageIndex) {
          return DayViewModel.allDay[pageIndex].day.length;
        },
        onPageLimitReached: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
