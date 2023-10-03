class Camino {
  //Poligono 1
  Camino(int cual) {
    if (cual==1) {
      FPoly myPoly1 = new FPoly();
      push();
      myPoly1.vertex(-456.0, 244.0);
      myPoly1.vertex(-449.0, 200.0);
      myPoly1.vertex(-428.0, 166.0);
      myPoly1.vertex(-399.0, 152.0);
      myPoly1.vertex(-362.0, 169.0);
      myPoly1.vertex(-335.0, 181.0);
      myPoly1.vertex(-290.0, 165.0);
      myPoly1.vertex(-248.0, 144.0);
      myPoly1.vertex(-187.0, 156.0);
      myPoly1.vertex(-179.0, 173.0);
      myPoly1.vertex(-156.0, 192.0);
      myPoly1.vertex(-113.0, 203.0);
      myPoly1.vertex(-80.0, 196.0);
      myPoly1.vertex(-53.0, 181.0);
      myPoly1.vertex(13.0, 174.0);
      myPoly1.vertex(63.0, 188.0);
      myPoly1.vertex(105.0, 207.0);
      myPoly1.vertex(165.0, 199.0);
      myPoly1.vertex(219.0, 196.0);
      myPoly1.vertex(268.0, 208.0);
      myPoly1.vertex(303.0, 167.0);
      myPoly1.vertex(324.0, 144.0);
      myPoly1.vertex(353.0, 136.0);
      myPoly1.vertex(359.0, 99.0);
      myPoly1.vertex(370.0, 72.0);
      myPoly1.vertex(372.0, 48.0);
      myPoly1.vertex(358.0, 23.0);
      myPoly1.vertex(345.0, 0.0);
      myPoly1.vertex(361.0, -26.0);
      myPoly1.vertex(395.0, -46.0);
      myPoly1.vertex(445.0, -54.0);
      myPoly1.vertex(487.0, -76.0);
      myPoly1.vertex(508.0, -103.0);
      myPoly1.vertex(515.0, -130.0);
      myPoly1.vertex(519.0, -190.0);
      myPoly1.vertex(515.0, -219.0);
      myPoly1.vertex(516.0, -227.0);
      myPoly1.vertex(539.0, -228.0);
      pop();
      //attach image para ponerle la imagen
      myPoly1.attachImage(poly1);
      myPoly1.setStatic(true);
      myPoly1.setPosition(540, 340);
      myPoly1.setGrabbable(false);
      mundo.add(myPoly1);
    }
    //Poligono2
    else if (cual ==2 ) {
      FPoly myPoly2 = new FPoly();
      push();
      myPoly2.vertex(-329.0, -358.0);
      myPoly2.vertex(-346.0, -336.0);
      myPoly2.vertex(-362.0, -312.0);
      myPoly2.vertex(-374.0, -281.0);
      myPoly2.vertex(-367.0, -247.0);
      myPoly2.vertex(-346.0, -225.0);
      myPoly2.vertex(-302.0, -217.0);
      myPoly2.vertex(-271.0, -215.0);
      myPoly2.vertex(-246.0, -215.0);
      myPoly2.vertex(-216.0, -207.0);
      myPoly2.vertex(-173.0, -194.0);
      myPoly2.vertex(-139.0, -202.0);
      myPoly2.vertex(-119.0, -211.0);
      myPoly2.vertex(-77.0, -208.0);
      myPoly2.vertex(-40.0, -221.0);
      myPoly2.vertex(-7.0, -271.0);
      myPoly2.vertex(22.0, -314.0);
      myPoly2.vertex(76.0, -336.0);
      myPoly2.vertex(159.0, -327.0);
      myPoly2.vertex(231.0, -307.0);
      myPoly2.vertex(333.0, -296.0);
      myPoly2.vertex(412.0, -312.0);
      myPoly2.vertex(449.0, -322.0);
      myPoly2.vertex(493.0, -313.0);
      myPoly2.vertex(503.0, -291.0);
      myPoly2.vertex(506.0, -243.0);
      myPoly2.vertex(511.0, -213.0);
      myPoly2.vertex(516.0, -182.0);
      myPoly2.vertex(519.0, -163.0);
      myPoly2.vertex(521.0, -156.0);
      myPoly2.vertex(538.0, -164.0);
      pop();
      //Attach image para ponerle la imagen
      myPoly2.attachImage(poly2);
      myPoly2.setStatic(true);
      myPoly2.setPosition(545, 350);
      myPoly2.setGrabbable(false);
      mundo.add(myPoly2);
    }
    //Poligono 3
    else if (cual ==3) {
      FPoly myPoly3 = new FPoly();
      myPoly3.vertex(-469.0, -359.0);
      myPoly3.vertex(-464.0, -337.0);
      myPoly3.vertex(-459.0, -296.0);
      myPoly3.vertex(-469.0, -234.0);
      myPoly3.vertex(-477.0, -204.0);
      myPoly3.vertex(-467.0, -157.0);
      myPoly3.vertex(-448.0, -124.0);
      myPoly3.vertex(-423.0, -103.0);
      myPoly3.vertex(-354.0, -106.0);
      myPoly3.vertex(-328.0, -91.0);
      myPoly3.vertex(-313.0, -75.0);
      myPoly3.vertex(-298.0, -65.0);
      myPoly3.vertex(-239.0, -60.0);
      myPoly3.vertex(-170.0, -64.0);
      myPoly3.vertex(-103.0, -62.0);
      myPoly3.vertex(-35.0, -62.0);
      myPoly3.vertex(-2.0, -65.0);
      myPoly3.vertex(24.0, -119.0);
      myPoly3.vertex(46.0, -174.0);
      myPoly3.vertex(83.0, -213.0);
      myPoly3.vertex(173.0, -215.0);
      myPoly3.vertex(211.0, -194.0);
      myPoly3.vertex(299.0, -199.0);
      myPoly3.vertex(337.0, -211.0);
      myPoly3.vertex(392.0, -214.0);
      myPoly3.vertex(415.0, -160.0);
      myPoly3.vertex(397.0, -138.0);
      myPoly3.vertex(356.0, -123.0);
      myPoly3.vertex(298.0, -110.0);
      myPoly3.vertex(265.0, -108.0);
      myPoly3.vertex(230.0, -86.0);
      myPoly3.vertex(223.0, -44.0);
      myPoly3.vertex(213.0, -14.0);
      myPoly3.vertex(195.0, 10.0);
      myPoly3.vertex(139.0, 53.0);
      myPoly3.vertex(115.0, 46.0);
      myPoly3.vertex(95.0, 57.0);
      myPoly3.vertex(65.0, 65.0);
      myPoly3.vertex(36.0, 56.0);
      myPoly3.vertex(-50.0, 45.0);
      myPoly3.vertex(-105.0, 60.0);
      myPoly3.vertex(-148.0, 62.0);
      myPoly3.vertex(-186.0, 43.0);
      myPoly3.vertex(-235.0, 43.0);
      myPoly3.vertex(-287.0, 44.0);
      myPoly3.vertex(-337.0, 39.0);
      myPoly3.vertex(-406.0, 39.0);
      myPoly3.vertex(-463.0, 51.0);
      myPoly3.vertex(-521.0, 77.0);
      myPoly3.vertex(-540.0, 85.0);
      //Attach image para ponerle la imagen
      myPoly3.attachImage(poly3);
      myPoly3.setStatic(true);
      myPoly3.setPosition(530, 360);
      myPoly3.setGrabbable(false);
      mundo.add(myPoly3);
    }
  }
}
