import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _todoController = TextEditingController();
  List _todoList = [];
  late Map<String, dynamic> _ultimoRemovido;
  late int _indiceUltimoRemovido;

  @override
  void initState() {
    super.initState();
    _lerDados().then((value) {
      setState(() {
        _todoList = json.decode(value!);
      });
    });
  }

  Future<File> _abreArquivo() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/todoList.json");
  }

  Future<String?> _lerDados() async {
    try {
      final arquivo = await _abreArquivo();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _salvarDados() async {
    String dados = json.encode(_todoList);
    final arquivo = await _abreArquivo();
    return arquivo.writeAsString(dados);
  }

  void _adicionaTarefa() {
    setState(() {
      Map<String, dynamic> tarefa = {};
      tarefa["titulo"] = _todoController.text;
      tarefa["realizado"] = false;
      _todoList.add(tarefa);
      _todoController.clear();
      _salvarDados();
    });
  }

  Future<void> _reordenaLista() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _todoList.sort((a, b) {
        if (a["realizado"] && !b["realizado"]) return 1;
        if (!a["realizado"] && b["realizado"]) return -1;
        return 0;
      });
    });
  }

  Widget widgetTarefa(BuildContext context, int index) {
    return Dismissible(
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment(0.9, 0),
          child: Icon(Icons.delete_sweep_outlined, color: Colors.white),
        ),
      ),
      direction: DismissDirection.endToStart,
      child: CheckboxListTile(
        title: Text(_todoList[index]["titulo"]),
        value: _todoList[index]["realizado"],
        secondary: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Icon(
            _todoList[index]["realizado"] ? Icons.check : Icons.error_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        onChanged: (value) {
          setState(() {
            _todoList[index]["realizado"] = value;
            _salvarDados();
          });
        },
      ),
      onDismissed: (direction) {
        _ultimoRemovido = Map.from(_todoList[index]);
        _indiceUltimoRemovido = index;
        _todoList.removeAt(index);
        _salvarDados();

        final snack = SnackBar(
          content: Text("Tarefa \"${_ultimoRemovido["titulo"]}\" removida!"),
          duration: const Duration(seconds: 4),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: () {
              setState(() {
                _todoList.insert(index, _ultimoRemovido);
                _salvarDados();
              });
            },
          ),
        );

        //remove uma snackbar se houver
        ScaffoldMessenger.of(context).removeCurrentSnackBar();

        //mostra a snackbar do último removido
        ScaffoldMessenger.of(context).showSnackBar(snack);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
        centerTitle: true,
      ),
      body: Builder(builder: (context) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(18, 1, 7, 1),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _todoController,
                    maxLength: 90,
                    decoration: const InputDecoration(labelText: "Nova Tarefa"),
                  )),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: FloatingActionButton(
                      child: const Icon(Icons.save_outlined),
                      onPressed: () {
                        if (_todoController.text.isEmpty) {
                          final snack = SnackBar(
                              content: const Text("Não pode ser vazia!"),
                              duration: const Duration(seconds: 4),
                              action: SnackBarAction(
                                  label: "Ok",
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                  }));

                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(snack);
                        } else {
                          _adicionaTarefa();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Expanded(
                child: RefreshIndicator(
                    onRefresh: _reordenaLista,
                    child: ListView.builder(
                      itemBuilder: widgetTarefa,
                      itemCount: _todoList.length,
                      padding: const EdgeInsets.only(top: 10),
                    ),))
          ],
        );
      }),
    );
  }
}
