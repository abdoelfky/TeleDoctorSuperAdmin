import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teledoctor/cubit/app_cubit.dart';
import 'package:teledoctor/cubit/app_state.dart';
import 'package:teledoctor/modules/update_user_screen.dart';
import 'package:teledoctor/shared/component/components.dart';

import '../shared/constants/constants.dart';
import 'add_admin_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppState>(
      listener:(context,state){} ,
        builder:(context,state)
        {
          return Scaffold(
            appBar: myAppBar(appBarText: 'Admins'),
            body:Padding(
              padding: EdgeInsets.symmetric(
                  vertical:size.height*0.05 ,
                  horizontal:size.width*.05 ),
              child: GridView.builder(

                physics: const BouncingScrollPhysics(),
                itemCount:8 ,
                itemBuilder:(context,index)
                {return myCard(context);
                },
                gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 1,
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

Widget myCard(context)=>InkWell(
  onTap: (){
    navigateTo(context,UpdateAdminScreen());
  },
  child:   Container(

    padding:EdgeInsets.all(18) ,

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

            const SizedBox(height: 10,),

            const Text('Abdou',style: TextStyle(fontSize: 23,color: Colors.white),),

          ],

        )),

  ),
);
