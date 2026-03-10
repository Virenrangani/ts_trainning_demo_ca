import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/core/constant/font_size/custom_text_style.dart';
import 'package:ts_training_demo_ca/core/constant/string/custom_string.dart';
import 'package:ts_training_demo_ca/feature/profile/widgets/custom_card.dart';
import 'package:ts_training_demo_ca/feature/profile/widgets/custom_list_tile.dart';
import '../../core/utils/image_picker/custom_image_picker.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
            CustomListTile(icon:FontAwesomeIcons.user, text:CustomString.editProfile),
            CustomListTile(icon:FontAwesomeIcons.locationArrow, text:CustomString.addressProfile),
            CustomListTile(icon:FontAwesomeIcons.hireAHelper, text:CustomString.help),
            CustomListTile(icon:MdiIcons.accountSettings, text:CustomString.settings),
            CustomListTile(icon:MdiIcons.logout, text:CustomString.logOut),
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
                      child: CustomImagePicker()
                  ),
                  SizedBox(height: 20,),
                  Text(CustomString.viren,style: CustomTextStyles.bodyLarge.copyWith(color: CustomColor.textLight),),
                  SizedBox(height: 10,),
                  Text(CustomString.virenMail,style: CustomTextStyles.bodyMedium.copyWith(color: CustomColor.textLight),),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomCard(icon: FontAwesomeIcons.bagShopping, text: CustomString.order, onTap: (){print("Order");},),
                      CustomCard(icon:FontAwesomeIcons.gift, text:CustomString.voucher,onTap:(){print("Voucher");}),
                      CustomCard(icon:FontAwesomeIcons.history, text:CustomString.history,onTap: (){print("History");}),
                      CustomCard(icon:FontAwesomeIcons.gift, text:CustomString.giftCoupons,onTap: (){print("Voucher");}),
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
