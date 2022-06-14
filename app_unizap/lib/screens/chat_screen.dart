import 'dart:io';

import 'package:app_unizap/services/firebase_service.dart';
import 'package:app_unizap/widgets/chat_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:app_unizap/utils/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _carregando = false;
  User? user = FirebaseAuth.instance.currentUser;

  void enviarMensagem({String? mensagem, File? imagem}) async {
    Map<String, dynamic> data = {
      'uid': user!.uid,
      'displayName': user!.displayName,
      'photoUrl': user!.photoURL,
      'time': Timestamp.now()
    };

    if(mensagem != null) {
      data['mensagem'] = mensagem;
    }

    if(imagem != null) {
      UploadTask task = FirebaseStorage.instance
        .ref()
        .child(user!.uid + DateTime.now().microsecondsSinceEpoch.toString())
        .putFile(imagem);

        setState(() {
          _carregando = true;
        });

        final TaskSnapshot downloadUrl = await task;
        final String url = await downloadUrl.ref.getDownloadURL();

        data['imgUrl'] = url;
    }

    FirebaseFirestore.instance.collection('mensagens').add(data);

    setState(() {
      _carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('${user!.displayName}'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                FirebaseService service = FirebaseService();
                await service.signOutFromGoogle().then((value) =>
                    Navigator.pushReplacementNamed(
                        context, Constants.signInRoute));
              },
              icon: const Icon(Icons.exit_to_app_rounded))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('mensagens')
                .orderBy('time')
                .snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasData) {
                    List<DocumentSnapshot> documentos =
                        snapshot.data!.docs.reversed.toList();
                    return ListView.builder(
                        reverse: true,
                        itemCount: documentos.length,
                        itemBuilder: (context, index) {
                          return ChatMessage(
                              documentos[index].data() as Map<String, dynamic>,
                              (documentos[index].data()
                                      as Map<String, dynamic>)['uid'] ==
                                  user?.uid);
                        });
                  } else {
                    return Container();
                  }
              }
            },
          ))
        ],
      ),
    );
  }
}
