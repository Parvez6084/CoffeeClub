import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth_bloc.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_image.dart';
import '../widgets/primary_text.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn"),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>  HomePage()));
          }
          if (state is AuthError) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              // Showing the sign in form if the user is not authenticated
              /*return Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        IconButton(
                          onPressed: () {
                            _authenticateWithGoogle(context);
                          },
                          icon: Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png",
                            height: 30,
                            width: 30,
                          ),
                        ),
                        const Text("Don't have an account?"),
                      ],
                    ),
                  ),
                ),
              );*/
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
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(googleIcon, height: 24,width: 24,),
                                  const SizedBox(width: 16),
                                  const PrimaryText( text: 'SIGN IN WITH GOOGLE',size: 14,color: AppColors.blackColor)
                                ],
                              ),
                              onTap: () {
                                _authenticateWithGoogle(context);
                              }
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
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }
}