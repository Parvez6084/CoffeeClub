import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../utils/app_constants.dart';
import '../widgets/avatar.dart';
import '../widgets/primary_text.dart';

class SingleChatPage extends StatelessWidget {
  const SingleChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            appBar(context),
            headerPart(),
            Expanded(
              child: Container(
                height: MediaQuery.sizeOf(context).height - dividerSize,
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                  ),
                  color: AppColors.lightColor,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(4),
                        shrinkWrap: true,
                        children: [
                          senderBubble(isSeen: false),
                          receiverBubble()
                        ]
                      ),
                    ),
                    footerPart(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget headerPart() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24),
      height: dividerSize,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                text: 'Parvez Ahmed',
                size: 18,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
              PrimaryText(
                text: 'Active',
                size: 12,
                color: Colors.white54,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  boxShadow:AppColors.boxDarkSDW,
                  shape: BoxShape.circle,
                  color: AppColors.blackColor
              ),
              child: const Avatar(imagePath: 'https://i.pinimg.com/originals/97/05/7c/97057c70bc6dfcd8706a6dc4b2f811d2.png',size: 20, ))
        ],
      ),
    );
  }

  Widget footerPart() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8,left: 4,right: 4),
      decoration: BoxDecoration(
        boxShadow: AppColors.boxUnSeen,
        color: AppColors.lightColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.lightColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 0,style: BorderStyle.none),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
          hintText: 'Type your message...',
          hintStyle: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.w500),
          suffixIcon: ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(8),
              backgroundColor: AppColors.backgroundColor
            ),
            child: const Icon(Icons.send_rounded, color: Colors.white),
          )
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: context.pop,
              child: const PrimaryText(text: 'Back',color: Colors.white54,size: 14,)
          ),
          const TextButton(
              onPressed: null,
              child: PrimaryText(text: 'Search',color: Colors.white54,size: 14,)
          )
        ],
      ),
    );
  }

  Widget senderBubble({bool isSeen = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
             constraints: const BoxConstraints(minWidth: 100, maxWidth: 280),
             decoration: BoxDecoration(
               boxShadow: isSeen ? AppColors.boxSeen : AppColors.boxUnSeen,
               color: AppColors.lightColor,
               borderRadius: const BorderRadius.only(
                 topLeft: Radius.circular(24),
                 topRight: Radius.circular(24),
                 bottomRight: Radius.circular(0),
                 bottomLeft: Radius.circular(24)
               ),
             ),
             child: Stack(
               children: [
                 const Padding(
                   padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                   child: PrimaryText(text: 'Hi',color: Colors.black54, size: 14),
                 ),
                 Positioned( right: 2,bottom: 2,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 8.0),
                     child: PrimaryText(
                       text: '5.30PM',
                       size: 8,
                       color: Colors.grey.shade400,
                     ),
                   ),
                 )
               ],
             ),
           ),
        ],
      ),
    );
  }

  Widget receiverBubble() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(minWidth: 100, maxWidth: 280),
            decoration: const BoxDecoration(
              boxShadow: AppColors.boxUnSeen,
              color: AppColors.lightColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(0)
              ),
            ),
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                  child: PrimaryText(text: 'Hi',color: Colors.black54, size: 14),
                ),
                Positioned( left: -4,bottom: -2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      children: [
                        const Avatar(imagePath: 'https://i.pinimg.com/originals/97/05/7c/97057c70bc6dfcd8706a6dc4b2f811d2.png',size: 10),
                       const Gap(8),
                        PrimaryText(
                          text: '5.30PM',
                          size: 8,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}

