import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class SendGiftBottomSheet extends StatefulWidget {
  const SendGiftBottomSheet({Key? key}) : super(key: key);

  @override
  _SendGiftBottomSheetState createState() => _SendGiftBottomSheetState();
}

class _SendGiftBottomSheetState extends State<SendGiftBottomSheet> {

  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.SCAFFOLD_BG_PINK,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Send gift to user',
            style: TextStyle(
              fontSize: 20,
              fontFamily: CFontFamily.MEDIUM
            ),
          ),
          SizedBox(height: 12),
          Text(
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: CFontFamily.REGULAR
            ),
          ),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GiftOption(
                onPressed: (){setState(() {selected = true;});},
                isSelected: selected,
                price: 300,
                title: 'Title',
                subtitle: '2 USD only',
                label: 'label',
              ),
              SizedBox(width: 20),
              GiftOption(
                onPressed: (){setState(() {selected = false;});},
                isSelected: !selected,
                price: 300,
                title: 'Title',
                subtitle: '2 USD only',
                label: 'label',
              ),
            ],
          ),
          SizedBox(height: 12),

          RichText(
            text: TextSpan(
              text: 'read our',
              style: TextStyle(
                color: AppColor.TEXT_COLOR
              ),
              children: [
                TextSpan(
                  text: ' Terms ',
                  style: TextStyle(
                    color: AppColor.PRIMARY
                  )
                ),
                TextSpan(
                  text: 'and ',
                ),
                TextSpan(
                  text: 'conditions.',
                  style: TextStyle(
                    color: AppColor.PRIMARY
                  )
                ),
              ]
            ),
          ),

          SizedBox(height: 20),
          MainButton(onPress: (){}, label: 'Continue'),
        ],
      ),
    );
  }
}

class GiftOption extends StatelessWidget {
  final VoidCallback onPressed;
  final bool? isSelected;
  final double price;
  final String title;
  final String subtitle;
  final String label;
  GiftOption({
    this.isSelected = false,
    required this.price,
    required this.title,
    required this.subtitle,
    required this.label,
    required this.onPressed
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Container(
            width: Get.width * .41,
            height: Get.height * .135,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: isSelected! ? Border.all(
                    color: AppColor.PRIMARY,
                    width: 3
                ) : Border()
            ),
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$price',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: CFontFamily.REGULAR
                  ),
                ),
                Text(
                  'Credits at'
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: CFontFamily.REGULAR
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.PRIMARY,
                  borderRadius: BorderRadius.circular(4)
              ),
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: CFontFamily.REGULAR
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}