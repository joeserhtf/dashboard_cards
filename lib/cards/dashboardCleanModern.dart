import 'package:dashboard_card/dashboard_card.dart';
import 'package:dashboard_card/tools/tools.dart';
import 'package:flutter/material.dart';

List<Widget> temp = [];
List conteudo = [];
List<Widget> conteudoLinha = [];

class DashboardContainerCleanModern extends StatefulWidget {
  final List<ItemDashboard> itens;
  final double sizeScreen;
  final double marginBetween;
  final double mobileWidthContainer;
  final double webWidthContainer;

  DashboardContainerCleanModern(this.itens, this.sizeScreen, this.marginBetween, this.mobileWidthContainer, this.webWidthContainer);

  @override
  _DashboardContainerCleanModernState createState() => _DashboardContainerCleanModernState();
}

class _DashboardContainerCleanModernState extends State<DashboardContainerCleanModern> {
  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width, child: getContainers());
  }

  Widget getContainers() {
    List sizes = getSizeContainer(
      widget.sizeScreen,
      widget.marginBetween,
      widget.mobileWidthContainer,
      widget.webWidthContainer,
      widget.itens.length,
    );

    temp.clear();
    conteudo.clear();
    conteudoLinha.clear();

    for (int i = 0; i < sizes[0]["qtdLinha"]; i++) {
      int maxJ = ((i + 1) * sizes[0]["qtdContainersLinha"]) < widget.itens.length
          ? ((i + 1) * sizes[0]["qtdContainersLinha"])
          : widget.itens.length;

      int initJ = ((i * sizes[0]["qtdContainersLinha"]));
      for (int j = initJ; j < maxJ; j++) {
        temp.add(Expanded(
          flex: 0,
          child: GestureDetector(
            onTap: () {
              final snackBar = SnackBar(
                content: Text(widget.itens[j].help),
                backgroundColor: Colors.blue,
                action: SnackBarAction(
                  label: 'Fechar',
                  textColor: Colors.white,
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );

              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Tooltip(
              message: widget.itens[j].help,
              child: Container(
                child: Card(
                  elevation: 2,
                  child: Container(
                    width: sizes[0]["widthContainer"],
                    height: sizes[0]["heigthContainer"],
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: sizes[0]["heigthContainer"] * 0.75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          widget.itens[j].conteudo,
                                          style: TextStyle(
                                            fontSize: sizes[0]["heigthContainer"] * 0.35,
                                            fontWeight: FontWeight.bold,
                                            color: widget.itens[j].corIcone,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          widget.itens[j].subTitulo,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: sizes[0]["heigthContainer"] * 0.15,
                                            color: widget.itens[j].corTexto,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: sizes[0]["widthContainer"] * 0.33,
                                child: Icon(
                                  widget.itens[j].icone,
                                  size: sizes[0]["widthContainer"] * 0.1,
                                  color: widget.itens[j].corIcone,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          color: widget.itens[j].cor,
                          margin: EdgeInsets.all(0),
                          child: Container(
                              width: sizes[0]["widthContainer"],
                              height: sizes[0]["heigthContainer"] * 0.25,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                widget.itens[j].titulo,
                                style: TextStyle(
                                  fontSize: sizes[0]["heigthContainer"] * 0.13,
                                  color: Colors.white,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
      }
    }

    List<Widget> tempFinal = [];
    List<List<int>> range = [];
    int i = 0;
    int j = 0;

    for (i = 0; i < sizes[0]["qtdContainersLinha"]; i++) {
      int size = tempFinal.length;
      for (j = i; j < temp.length; j = j + sizes[0]["qtdContainersLinha"]) {
        tempFinal.add(temp[j]);
      }
      range.add([size, tempFinal.length - 1]);
    }

    int initJ;
    int maxJ;

    conteudo.clear();
    for (int k = 0; k < range.length; k++) {
      //*print("etapa: " + k.toString());
      initJ = range[k][0];
      maxJ = range[k][1];

      conteudo.add(tempFinal.sublist(initJ, maxJ + 1));

      conteudoLinha.add(
        Expanded(
          flex: 1,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: conteudo[k],
            ),
          ),
        ),
      );
    }

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: conteudoLinha,
      ),
    );
  }
}
