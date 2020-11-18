import 'package:dashboard_card/dashboard_card.dart';
import 'package:dashboard_card/tools/tools.dart';
import 'package:flutter/material.dart';

List<Widget> temp = [];
List conteudo = [];
List<Widget> conteudoLinha = [];

class DashboardContainerClean extends StatefulWidget {
  final List<ItemDashboard> itens;
  final double sizeScreen;
  final double marginBetween;
  final double mobileWidthContainer;
  final double webWidthContainer;

  DashboardContainerClean(this.itens, this.sizeScreen, this.marginBetween, this.mobileWidthContainer, this.webWidthContainer);

  @override
  _DashboardContainerCleanState createState() => _DashboardContainerCleanState();
}

class _DashboardContainerCleanState extends State<DashboardContainerClean> {
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
          child: Container(
            child: Card(
              elevation: 2,
              child: Container(
                height: sizes[0]["heigthContainer"],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.itens[j].conteudo,
                          style: TextStyle(
                            fontSize: sizes[0]["heigthContainer"] * 0.35,
                            fontWeight: FontWeight.bold,
                            color: widget.itens[j].corTexto,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.itens[j].titulo,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: sizes[0]["heigthContainer"] * 0.17,
                            color: widget.itens[j].corTexto,
                          ),
                        )
                      ],
                    ),
                  ],
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
