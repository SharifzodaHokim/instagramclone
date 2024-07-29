
import 'dart:io';

import 'package:exsam3/data/firebase_servise/firebase_auth.dart';
import 'package:exsam3/util/dialog.dart';
import 'package:exsam3/util/exseption.dart';
import 'package:exsam3/util/imagepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SighupScreen extends StatefulWidget {
  final VoidCallback show;
  const SighupScreen(this.show,{super.key});

  @override
  State<SighupScreen> createState() => _SighupScreenState();

}

class _SighupScreenState extends State<SighupScreen> {
  final email  =  TextEditingController();
  FocusNode email_F = FocusNode();
 final password  =  TextEditingController();
   FocusNode password_F = FocusNode();
    final bio  =  TextEditingController();
   FocusNode bio_F = FocusNode();
    final username  =  TextEditingController();
   FocusNode username_F = FocusNode();
   final passwordConfirme  =  TextEditingController();
   FocusNode passwordConfirme_F = FocusNode();

   File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(child: 
        Column(children: [
          SizedBox(width: 96.w,height: 30.h,),
          Center(
            child: Image.asset("images/Instagram Logo.png"),
          ),
           SizedBox(height: 60.h,),
          Center(
            child: InkWell(
             onTap: () async{
               File _imagefilee = await Imagepickerr().uploadImage('gallery');
               setState(() {
                 _imageFile = _imagefilee;
               });
             }, 
              child: CircleAvatar(
                radius: 36.r,
                backgroundColor: Colors.grey,
                child: _imageFile == null? CircleAvatar(
                  radius: 34.r,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: const AssetImage("   https://firebasestorage.googleapis.com/v0/b/instagram-8a227.appspot.com/o/person.png?alt=media&token=c6fcbe9d-f502-4aa1-8b4b-ec37339e78ab "),
                ):CircleAvatar(
                         radius: 34.r,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage:Image.file(
                    
                    _imageFile!,
                    fit: BoxFit.cover,
        
                    ).image,
                )
              ),
            ),
          ),
          SizedBox(height: 50.h,),
                    Textfield(email,Icons.email,'Email',email_F),
         SizedBox(height: 15.h,),
         Textfield(username,Icons.person,'Username',username_F),
         SizedBox(height: 10.h,),
         Textfield(bio,Icons.abc_sharp,'bio',bio_F),
         SizedBox(height: 10.h,),
          Textfield(password,Icons.lock,'Password',password_F),
         SizedBox(height: 10.h,),
           Textfield(passwordConfirme,Icons.lock,'passwordConfirme',passwordConfirme_F),
         SizedBox(height: 20.h,),
         Sighup(),
          SizedBox(height:10.h,),
          Have(),
         
        ],)
        ),
      )
    );
  }

  Widget Have() {
    return Padding(
  padding:  EdgeInsets.symmetric(horizontal: 15.w),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text("Don't have account?",
       style: TextStyle(
  fontSize: 13.sp,
  color: Colors.grey,
  
   ),
      ),
      GestureDetector(
        onTap:widget.show ,
        child: Text("Sigh up",
         style: TextStyle(
          fontSize: 15.sp,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
           ),
        ),
      ),
    ],
  ),
);
  }

  Widget Sighup() {
    return Padding(
 padding:  EdgeInsets.symmetric(horizontal: 10.w),
 child: InkWell(
  onTap: () async{
    try{
      await Authentication().Sighup(email: email.text, password: password.text, passwordConfirme: passwordConfirme.text, username: username.text, bio: bio.text, profile:  File(''));

    }on exseptions catch(e){
     dialogBuilder(context, e.massage);
    }
  },
   child: Container(
    alignment: Alignment.center,
    
    width: double.infinity,
    height: 44.h,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(10.r),
   
    ),
    child: Text("Sigh up",
     style: TextStyle(
    fontSize: 23.sp,
    color: Colors.white,
    fontWeight: FontWeight.bold,
   ),
    ),
    ),
 ),
 );
  }

  Widget Forgot() {
    return Padding(
 padding:  EdgeInsets.symmetric(horizontal: 15.w),
 child: Text("Forgot your password?",
 style: TextStyle(
  fontSize: 13.sp,
  color: Colors.black,
  fontWeight: FontWeight.bold,
 ),
 ),
 );
  }

  Widget Textfield(TextEditingController controller,IconData icon,String type,FocusNode focusNode) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
            height: 44.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
         
          
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: type,
                prefixIcon: Icon(
                  icon,
                  color: focusNode.hasFocus ? Colors.black:Colors.grey,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.w,
                  )
                ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.w,
                  )
                )
              ),
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
            
              ),
            ),
          ),
    );
  }
}