import 'package:coffee_club/presentation/widgets/primary_text.dart';
import 'package:coffee_club/utils/app_constants.dart';
import 'package:coffee_club/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                left: 0,right: 0,top: 100,
                  child: Image.asset(
                    welcomeImage, height: 150,width: 150,
                  )
              ),
              Positioned(
                left: 24,right: 24,bottom: 120,
                child: Container(height: 60,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.lightColor,
                    boxShadow: AppColors.boxSeen,
                    borderRadius: BorderRadius.circular(32)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(googleIcon, height: 24,width: 24,),
                      const SizedBox(width: 16),
                      const PrimaryText( text: 'SIGN IN WITH GOOGLE',size: 14,color: AppColors.blackColor)
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
