import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/core/constant/font_size/custom_text_style.dart';
import 'package:ts_training_demo_ca/core/constant/padding/custom_padding.dart';
import 'package:ts_training_demo_ca/core/constant/string/custom_string.dart';
import 'package:ts_training_demo_ca/core/widget/text_form_field/custom_text_form_field.dart';
import 'package:ts_training_demo_ca/feature/cart/presentation/pages/cart_page.dart';
import 'package:ts_training_demo_ca/feature/dashboard/presentation/widgets/scrollable_card.dart';
import 'package:ts_training_demo_ca/feature/product/presentation/pages/product.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.pink.shade300,Colors.pink.shade100,Colors.pink.shade50],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
          ),
          title: Row(
            children: [
              Text(CustomString.flipkart,style: CustomTextStyles.h2.copyWith(color: CustomColor.info),),
              SizedBox(width: 8,),
              Icon(FontAwesomeIcons.basketShopping,)
            ],
          ),
          iconTheme: IconThemeData(color: CustomColor.info),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.heart,)),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
            }, icon: Icon(FontAwesomeIcons.cartShopping,)),
          ],
          bottom: TabBar(
            isScrollable: true,
            labelColor:CustomColor.primaryDark,
            unselectedLabelColor: Colors.grey,
            indicatorColor: CustomColor.info,
            indicatorAnimation: TabIndicatorAnimation.elastic,
            tabs: [
              Tab(icon: Icon(MdiIcons.shopping), text: CustomString.forYou),
              Tab(icon: Icon(MdiIcons.tshirtCrew), text: CustomString.fashion),
              Tab(icon: Icon(MdiIcons.cellphone), text: CustomString.mobile),
              Tab(icon: Icon(MdiIcons.lipstick), text: CustomString.beauty),
              Tab(icon: Icon(MdiIcons.home), text: CustomString.home),
              Tab(icon: Icon(MdiIcons.laptop), text: CustomString.appliances),
              Tab(icon: Icon(MdiIcons.teddyBear), text: CustomString.toy),
              Tab(icon: Icon(MdiIcons.food), text: CustomString.food),
            ],
          ),
        ),
        body: Padding(
          padding: CustomPadding.edgeAll12,
          child: Column(
            children: [
              Padding(
                padding: CustomPadding.edgeAll12,
                child: CustomFormField(labelText: CustomString.search, hintText: CustomString.searchItem,borderColor:CustomColor.info,),
              ),
              SizedBox(height:12,),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: ProductPage()),
                    Center(child: Text(CustomString.fashion)),
                    Center(child: Text(CustomString.mobile)),
                    Center(child: Text(CustomString.beauty)),
                    Center(child: Text(CustomString.home)),
                    Center(child: Text(CustomString.appliances)),
                    Center(child: Text(CustomString.toy)),
                    Center(child: Text(CustomString.food)),
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
