import 'package:flutter/material.dart';
import '../../../core/Widgets/space_widget.dart';
import '../../../core/utilis/size_responsive.dart';
import '../../../nav_bar/screens/more/widgets/profile.dart';
import '../../../nav_bar/screens/more/widgets/support.dart';
import '../../../nav_bar/screens/more/widgets/terms.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import '../../../Auth/start.dart';
import '../../../core/Widgets/Custom_Buttons.dart';
import '../../../core/Widgets/listTile.dart';
import '../favourit/favourit_page.dart';
import '../orders_page.dart';

class more_page extends StatelessWidget {
  const more_page({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(9),
          child: Container(

            height: 1.5,
            decoration: BoxDecoration(
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(0, 5),
                ),
              ],
            ),

          ),

        ),
        title: Text('Fruit Market',
            style: TextStyle(
                color: kMainColor, fontSize: 30, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      body:
      isPortrait?
      SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20,top: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [


                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500]!, width: 2.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                   child: Icon(Icons.person_outline_outlined,size: 50,color: Colors.grey[300],),
                  ),
                ),
                heightSpace(value: 2),
                Text('Welcome, Fruit Market',style: TextStyle(fontSize: 20),),
                heightSpace(value: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Genral_Button(text: 'Login', ontap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Start() ));
                  }),
                ),
                heightSpace(value: 2),

                Listtile(

                  iconLeading: Icons.person_outline_sharp , text: 'Profile', ontap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile() ));},),
                Listtile(iconLeading: Icons.reorder, text: 'My Orders', ontap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>orders_page())); },),
                Listtile(iconLeading: Icons.favorite_border, text: 'Favorite', ontap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>favourit_page() ));},),
                Listtile(iconLeading: Icons.language, text: 'Language', ontap: () => _showLanguageDialog(context),),
                Listtile(iconLeading: Icons.headphones, text: 'Support', ontap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>Support() ));},),
                Listtile(iconLeading: Icons.interpreter_mode_sharp, text: 'Terms & Conditions', ontap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>Terms() ));},),
                Listtile(iconLeading: Icons.info, text: 'About Us', ontap: () { },),

              ],
            ),
          ),
        ),
      ):SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         Expanded   (
            flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  heightSpace(value: Sizeresponsive.defaultSize! * .1),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500]!, width: 2.2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Icon(Icons.person_outline_outlined,size: 50,color: Colors.grey[300],),
                    ),
                  ),
                  heightSpace(value: 0.5),
                  Text('Welcome, Fruit Market',style: TextStyle(fontSize: 20),),
                  heightSpace(value: 0.5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 55),
                    child: Genral_Button(text: 'Login', ontap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Start() ));
                    }),
                  ),



                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(children: [
                  Listtile(iconLeading: Icons.person_outline_sharp , text: 'Profile', ontap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile() ));},),
                  Listtile(iconLeading: Icons.reorder, text: 'My Orders', ontap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>orders_page() )); },),
                  Listtile(iconLeading: Icons.favorite_border, text: 'Favorite', ontap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>favourit_page() ));},),
                  Listtile(iconLeading: Icons.language, text: 'Language', ontap: () => _showLanguageDialog(context),),
                  Listtile(iconLeading: Icons.headphones, text: 'Support', ontap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>Support() ));},),
                  Listtile(iconLeading: Icons.interpreter_mode_sharp, text: 'Terms & Conditions', ontap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>Terms() ));},),
                  Listtile(iconLeading: Icons.info, text: 'About Us', ontap: () { },),
                
                ],),
              ),
            )
          ],
        ),
      )
    );
  }
}

void _showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      content: Column(

     mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: RoundCheckBox(
              size: 30,
              onTap: (selected) {},),
            title: Row(
              children: [
        ImageIcon(AssetImage('assets/icons/ar.png')),
                Text('العربية'),
              ],
            ),

          ),
          ListTile(
            leading: RoundCheckBox(
              size: 30,
              onTap: (selected) {},),
            title: Row(
              children: [

                ImageIcon(AssetImage('assets/icons/en.png'),),
                Text('English'),
              ],
            ),

          ),
          heightSpace(value: 1.5),
          Genral_Button(text: 'Apply', ontap: (){}),
          heightSpace(value: 1),
          GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Container(
              child: Text('Close',style: TextStyle(color: Colors.grey,fontSize: 20),),
            ),
          )

        ],
      ),
    ),
  );
}
