import 'package:coffee_club/presentation/views/single_chate_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../utils/app_constants.dart';
import '../widgets/avatar.dart';
import '../widgets/primary_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, left: 24),
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PrimaryText(
                    text: 'Chat with\nyour friends',
                    size: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
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
                itemCount: 10,
                itemBuilder:(context, index){
                 return chatModel(context, isSeen: true);
                }
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget chatModel(BuildContext context, {bool isSeen = false}) {
    return Container(
       decoration: BoxDecoration(
         boxShadow: AppColors.boxUnSeen,
         color: AppColors.lightColor,
         borderRadius: BorderRadius.circular(12.0),
       ),
       margin: const EdgeInsets.all(8),
       child: ListTile(
          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SingleChatPage()));},
          contentPadding: const EdgeInsets.only(left: 8, right: 16),
          leading: const Avatar(imagePath: 'https://i.pinimg.com/originals/97/05/7c/97057c70bc6dfcd8706a6dc4b2f811d2.png'),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryText(text: 'Parvez Ahmed', size: 14, color: isSeen ? Colors.grey.shade500 : Colors.black),
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

}

