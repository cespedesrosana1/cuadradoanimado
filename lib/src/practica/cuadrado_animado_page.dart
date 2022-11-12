import 'package:flutter/material.dart';


class CuadradoAnimadoPage extends StatefulWidget {
  
  @override
  State<CuadradoAnimadoPage> createState() => _CuadradoAnimadoPageState();
}

class _CuadradoAnimadoPageState extends State<CuadradoAnimadoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado()
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
 
  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  // animaciones
  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;


  @override
  void initState() { 
    super.initState();
    // inicializar todo

    controller = AnimationController(vsync: this, duration: Duration( milliseconds: 5000 ));

    moverDerecha = Tween( begin: 0.5, end: 100.0 ).animate(
      CurvedAnimation(parent: controller,
       curve: Interval(0, 0.25, curve: Curves.bounceOut ))
    );

    moverArriba = Tween( begin: 0.99, end: -100.0 ).animate(
      CurvedAnimation(parent: controller, 
      curve: Interval(0.25, 0.5, curve: Curves.bounceOut ))
    );

    moverIzquierda = Tween( begin: 0.5, end: -100.0 ).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.5, 0.50, curve: Curves.linear ))
    );

    moverAbajo = Tween( begin: 0.0, end: 100.0 ).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.easeInCubic ))
    );
    
    controller.addListener((){
      if ( controller.status == AnimationStatus.completed ) {
        controller.reset();
      }
    });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(moverDerecha.value + moverIzquierda.value, moverArriba.value + moverAbajo.value ),
          child: child,
        );
      },
    );
  }
}






class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 50,
       height: 50,
       decoration: BoxDecoration(
         color: Colors.red
       ),
     );
   }
}