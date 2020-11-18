List getSizeContainer(double widthScreen, double marginBetween, double mobileSize, double webSize, int qtdContainers) {
  if (widthScreen > 770) {
    for (int i = qtdContainers; i > 0; i--) {
      if (widthScreen >= ((webSize * i) + (marginBetween * (i - 1)))) {
        double restSize = (webSize * i) + (marginBetween * (i - 1));

        if (restSize < widthScreen) {
          if (qtdContainers == i) {
            webSize = (widthScreen - (marginBetween * (i + 1))) / i;
          } else {
            if (webSize * (i + 1) < widthScreen * 1.1) {
              i = i + 1;
              webSize = (widthScreen * 0.94 - (marginBetween * i + 1)) / i;
            } else {
              widthScreen = widthScreen * 0.95;
              webSize = ((widthScreen - ((marginBetween * i))) / i);
            }
          }
        }

        return [
          {
            "widthContainer": webSize,
            "heigthContainer": webSize / 4,
            "qtdContainersLinha": i,
            "qtdLinha": (qtdContainers / i).ceil(),
          }
        ];
      }
    }
  } else {
    for (int i = qtdContainers; i > 0; i--) {
      if (widthScreen >= ((mobileSize * i) + (marginBetween * (i - 1)))) {
        double restSize = (mobileSize * i) + (marginBetween * (i - 1));
        if (restSize < widthScreen) {
          if (qtdContainers == i) {
            mobileSize = (widthScreen - (marginBetween * (i + 1))) / i;
          } else {
            if (mobileSize * (i + 1) < widthScreen * 1.1) {
              i = i + 1;
              mobileSize = (widthScreen * 0.94 - (marginBetween * i + 1)) / i;
            } else {
              widthScreen = widthScreen * 0.95;
              mobileSize = ((widthScreen - ((marginBetween * i))) / i);
            }
          }
        }

        return [
          {
            "widthContainer": mobileSize,
            "heigthContainer": mobileSize / 4,
            "qtdContainersLinha": i,
            "qtdLinha": (qtdContainers / i).ceil(),
          }
        ];
      }
    }
  }
}
