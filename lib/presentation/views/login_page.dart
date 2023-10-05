import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth_bloc.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_image.dart';
import '../widgets/primary_text.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomePage()));}
          if (state is AuthError) {ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));}
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {return const Center(child: CircularProgressIndicator());}
            if (state is UnAuthenticated) {
              return Scaffold(
                body: SafeArea(
                    child: Stack(
                      children: [
                        Positioned(
                            left: 0,right: 0,top: 100,
                            child: Image.asset(welcomeImage, height: 150,width: 150)
                        ),
                        Positioned(
                          left: 24,right: 24,bottom: 120,
                          child: InkWell(
                            onTap: () {_authenticateWithGoogle(context);},
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
                          ),
                        )
                      ],
                    )
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(GoogleSignInRequested());
  }
}