import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/core/constant/font_size/custom_text_style.dart';
import 'package:ts_training_demo_ca/feature/profile/widgets/custom_card.dart';
import 'package:ts_training_demo_ca/feature/profile/widgets/custom_list_tile.dart';
import 'package:ts_training_demo_ca/feature/profile/widgets/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Positioned(
        bottom: 0,
        left:0,
        right: -1,
        child: Container(
          height: MediaQuery.sizeOf(context).height*0.45,
          decoration: BoxDecoration(
            color: CustomColor.textLight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
          children: [
            customListTile(FontAwesomeIcons.user, "Edit Profile"),
            customListTile(FontAwesomeIcons.locationArrow, "Address Management"),
            customListTile(FontAwesomeIcons.hireAHelper, "Help"),
            customListTile(MdiIcons.accountSettings, "Settings"),
            customListTile(MdiIcons.logout, "Logout"),
          ],
          ),
        ),
      ),
          Positioned(
            top: 0,
            left: 0,
            right: -1,
            child: Container(
              height: MediaQuery.sizeOf(context).height*0.45,
              decoration: BoxDecoration(
                color: CustomColor.general,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  SizedBox(
                    height: 130,
                      width: 130,
                      child: ImagePickerPage()
                  ),
                  SizedBox(height: 20,),
                  Text("Viren Rangani",style: CustomTextStyles.bodyLarge.copyWith(color: CustomColor.textLight),),
                  SizedBox(height: 10,),
                  Text("viren@gmail.com",style: CustomTextStyles.bodyMedium.copyWith(color: CustomColor.textLight),),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customCards(FontAwesomeIcons.bagShopping, "Order",(){print("Order");}),
                      customCards(FontAwesomeIcons.gift, "Voucher",(){print("Voucher");}),
                      customCards(FontAwesomeIcons.history, "History",(){print("History");})
                    ],
                  )
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}
