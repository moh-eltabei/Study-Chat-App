// ignore_for_file: must_be_immutable

import 'package:chat_app/components/loading_page.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/chat_buble.dart';
import '../contants.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  var scrollController = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  static String id = 'ChatPage';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages
          .orderBy(
            kCreatedAt,
            descending: true,
          )
          .snapshots(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messageList = [];
          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(
              Message.fromJason(
                snapshot.data!.docs[i],
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              title: Text(
                'Study Chat'.toUpperCase(),
                style: const TextStyle(
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: scrollController,
                      itemCount: messageList.length,
                      itemBuilder: (BuildContext context, index) {
                        return messageList[index].id == email
                            ? chatBuble(
                                message: messageList[index],
                              )
                            : chatBubleForFrinds(
                                message: messageList[index],
                              );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        kMessage: data,
                        kCreatedAt: DateTime.now(),
                        kId: email,
                      });
                      controller.clear();
                      scrollController.animateTo(
                        0,
                        duration: const Duration(microseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      suffixIcon: const Icon(Icons.send),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return LoadingPage();
        }
      }),
    );
  }
}
