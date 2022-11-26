import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/models/admin_model.dart';
import 'package:teledoctor/modules/update_user_screen.dart';
import 'package:teledoctor/shared/component/components.dart';

import '../shared/constants/constants.dart';
import 'add_admin_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    bool inProgress=false;

    return BlocConsumer<AppCubit,AppState>(
      listener:(context,state){} ,
        builder:(context,state)
        {
          var cubit=AppCubit.get(context);
          return Scaffold(
            appBar: myAppBar(appBarText: 'Admins'),
            body:Padding(
              padding: EdgeInsets.symmetric(
                  vertical:size.height*0.05 ,
                  horizontal:size.width*.05 ),
              child: GridView.builder(

                physics: const BouncingScrollPhysics(),
                itemCount:cubit.admins.length ,
                itemBuilder:(context,index)
                {
                  return myCard(context,cubit.admins[index]);
                },
                gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 3/5,
                    crossAxisSpacing: size.width*.03,
                    mainAxisSpacing: size.height*.02

                ),

              ),
            ),
            floatingActionButton: Container(
              height:size.height*.1 ,
              width: size.width*.18,
              child: FloatingActionButton(
                backgroundColor: primaryColor,
                child:const Icon(Icons.add,size: 40,) ,
                onPressed: ()
                {
                  navigateTo(context,AddAdminScreen());
                },

              ),
            ),


          );
        }
    );
  }
}

Widget myCard(context,AdminModel admin)=>InkWell(
  onTap: (){
    navigateTo(context,UpdateAdminScreen(admin: admin));
  },
  child:   Expanded(
    child: Container(

      padding:EdgeInsets.all(30) ,

      decoration: BoxDecoration(

          color: blue4,

          borderRadius: BorderRadius.circular(15)

      ),

      child: Center(

          child: Column(

            children: [

              CircleAvatar(

                backgroundColor: blue10,

                backgroundImage: const AssetImage('images/user.png'),

                radius: 42,



              ),

              const SizedBox(height: 15,),

              Text('${admin.name?.toUpperCase()}',
                style: TextStyle(fontSize: 20,color: Colors.white,
                    fontWeight: FontWeight.bold),maxLines: 1,
                  ),

              const SizedBox(height: 5,),

              Text('${admin.hospitalName?.toUpperCase()}',
                style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),maxLines: 2,
              )



            ],

          )),

    ),
  ),
);
