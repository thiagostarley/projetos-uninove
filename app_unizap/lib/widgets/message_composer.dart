import 'dart:io';
import 'package:app_unizap/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MessageComposer extends StatefulWidget {
  const MessageComposer(this.enviarMensagem, {Key? key}) : super(key: key);

  final Function({String mensagem, File imagem}) enviarMensagem;

  @override
  State<MessageComposer> createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  bool _estaCompondo = false;
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void _limpaCampo() {
    _controller.clear();
    setState(() {
      _estaCompondo = false;
    });
  }

  late XFile _img;

  Future<XFile?> _imgFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _img = photo!;
    });
  }

  Future<XFile?> _imgFromGallery() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _img = photo!;
    });
  }

  void enviImg() {
    if (_img == null) return;
    widget.enviarMensagem(imagem: File(_img.path));
  }

  void _showPicker(contex) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text(Constants.txtGaleria),
                onTap: () {
                  _imgFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt_rounded),
                title: const Text(Constants.txtCamera),
                onTap: () {
                  _imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.clear, color: Constants.kRed),
                title: const Text(Constants.txtCancelar),
                onTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container();

    //paramos aqui
  }
}
