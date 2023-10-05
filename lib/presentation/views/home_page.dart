import 'package:coffee_club/presentation/views/single_chate_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../bloc/auth_bloc.dart';
import '../../utils/app_constants.dart';
import '../widgets/avatar.dart';
import '../widgets/primary_text.dart';
import '../views/login_page.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // Navigate to the sign in screen when the user Signs Out
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
            );
          }
        },
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator(); // Display a loading indicator while data is loading.
            }

            final List<QueryDocumentSnapshot<Map<String, dynamic>>> usersData =
                snapshot.data!.docs; // Convert the QuerySnapshot into a List of documents.

            return SafeArea(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20, left: 24),
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
                          children: [
                            PrimaryText(
                              text: 'Chat with\nyour friends',
                              size: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                            IconButton(onPressed: (){_authenticateWithGoogle;LoginPage();}, icon: Icon(Icons.east_sharp))
                          ],
                        ),
                        const Gap(24),
                        SizedBox(height: 64,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return  Container(
                                  margin: const EdgeInsets.all(4),
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      boxShadow: AppColors.boxDarkSDW,
                                      shape: BoxShape.circle,
                                      color: AppColors.blackColor
                                  ),
                                  child: const Avatar(imagePath: 'https://i.pinimg.com/originals/97/05/7c/97057c70bc6dfcd8706a6dc4b2f811d2.png')
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height - 200,
                    clipBehavior: Clip.antiAlias,
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.lightColor,
                    ),
                    child: ListView.builder(
                        itemCount: usersData.length,
                        itemBuilder:(context, index){
                          return chatModel(context, userData: usersData[index].data(), isSeen: true);
                          return Container();
                        }
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

Widget chatModel(BuildContext context,{bool isSeen = false,dynamic? userData}) {
    print('>>>>>>>>>>>>>>>>>>${userData}');
    return Container(
       decoration: BoxDecoration(
         boxShadow: AppColors.boxUnSeen,
         color: AppColors.lightColor,
         borderRadius: BorderRadius.circular(12.0),
       ),
       margin: const EdgeInsets.all(8),
       child: ListTile(
          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  SingleChatPage()));},
          contentPadding: const EdgeInsets.only(left: 8, right: 16),
           leading: ClipOval(child: Image.network(userData['photoUrl'],scale: 2,),),
           title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryText(text: userData['displayName'], size: 14, color: isSeen ? Colors.grey.shade500 : Colors.black),
              PrimaryText(text: '07:35 PM', size: 9,color: Colors.grey.shade500,),
            ],
          ),
          subtitle: PrimaryText(
            text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            size: 12,color: isSeen ? Colors.grey.shade500 : Colors.grey.shade600,
            overflow: TextOverflow.ellipsis,
          )
        ),
     );
  }
   void _authenticateWithGoogle(context) {
     BlocProvider.of<AuthBloc>(context).add(
       SignOutRequested(),
     );
   }
// Rest of your code...
}


