library dashboard_card;

import 'package:dashboard_card/cards/dashboardClean.dart';
import 'package:dashboard_card/cards/dashboardCleanModern.dart';
import 'package:dashboard_card/cards/dashboardDivided.dart';
import 'package:dashboard_card/cards/dashboardLine.dart';
import 'package:dashboard_card/cards/dashboardModern.dart';
import 'package:flutter/material.dart';

class DashboardContainer extends StatefulWidget {
  final List<ItemDashboard> itens;
  final double sizeScreen;
  final TipoContainer tipoContainer;
  final double marginBetween;
  final double mobileWidthContainer;
  final double webWidthContainer;

  DashboardContainer({
    @required this.itens,
    @required this.sizeScreen,
    @required this.tipoContainer,
    @required this.marginBetween,
    @required this.mobileWidthContainer,
    @required this.webWidthContainer,
  });

  @override
  _DashboardContainerState createState() => _DashboardContainerState();
}

class _DashboardContainerState extends State<DashboardContainer> {
  @override
  Widget build(BuildContext context) {
    switch (widget.tipoContainer) {
      case TipoContainer.divided:
        {
          return DashboardContainerDivided(
            widget.itens,
            widget.sizeScreen,
            widget.marginBetween,
            widget.mobileWidthContainer,
            widget.webWidthContainer,
          );
        }
        break;

      case TipoContainer.modern:
        {
          return DashboardContainerModern(
            widget.itens,
            widget.sizeScreen,
            widget.marginBetween,
            widget.mobileWidthContainer,
            widget.webWidthContainer,
          );
        }
        break;

      case TipoContainer.line:
        {
          return DashboardContainerLine(
            widget.itens,
            widget.sizeScreen,
            widget.marginBetween,
            widget.mobileWidthContainer,
            widget.webWidthContainer,
          );
        }
        break;
      case TipoContainer.cleanModern:
        {
          return DashboardContainerCleanModern(
            widget.itens,
            widget.sizeScreen,
            widget.marginBetween,
            widget.mobileWidthContainer,
            widget.webWidthContainer,
          );
        }
        break;

      default:
        {
          return DashboardContainerClean(
            widget.itens,
            widget.sizeScreen,
            widget.marginBetween,
            widget.mobileWidthContainer,
            widget.webWidthContainer,
          );
        }
        break;
    }
  }
}

class ItemDashboard {
  String titulo;
  String subTitulo;
  String conteudo;
  String help;
  IconData icone;
  Color cor;
  Color corIcone;
  Color corTexto;
  Widget target;
  Function funcao;

  ItemDashboard(
    this.titulo,
    this.conteudo,
    this.icone, {
    this.subTitulo = "",
    this.help = "",
    this.cor = Colors.blue,
    this.corIcone = Colors.white,
    this.corTexto = Colors.black,
    this.target,
    this.funcao,
  });
}

enum TipoContainer { clean, divided, modern, line, cleanModern }
