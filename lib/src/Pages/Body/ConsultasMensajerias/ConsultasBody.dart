import 'package:flutter/material.dart';

class ConsultasBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _ItemConsultas("Tuve un problema con mi pedido"),
          _ItemConsultas("Mis Canjes y promiciones no funcionan"),
          _ItemConsultas("Tuve una mala experiencia con el repartidor"),
          _ItemConsultas("¿Cómo puedo asociar mi restaurante a Guimy?"),
          _ItemConsultas("Tengo un problema con el pago"),
          _ItemConsultas("otros"),
          
          
        ],
      ),
    );
  }
}

class _ItemConsultas extends StatelessWidget {

  final String texto;

  _ItemConsultas(this.texto);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 60.0,
          minHeight: 40.0
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              
            },
            
            child: Ink(
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black26,
                      blurRadius: 2.0
                    )
                  ]
                ),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: double.infinity,
              child: Container(
                alignment: Alignment.centerLeft,
                height: double.infinity,
                child: Text("$texto",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
              ),
              
              // Container(
              //   decoration: 
              //   margin: EdgeInsets.symmetric(vertical: 5.0),
              //   padding: EdgeInsets.symmetric(horizontal: 20.0),
              //   width: double.infinity,
              //   child: Text("$texto",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
              //   alignment: Alignment.centerLeft,
              // ),
            ),
          ),
        ),
      ),
    );
  }
}