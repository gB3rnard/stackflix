

import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/menu-items/menu_item.dart';
import '../../widgets/elementos_formulario/elementos_formulario.dart';


//var home = const HomePage().getClaseHome(); 

late String usuario;


class LoginPage extends ConsumerStatefulWidget {

  const LoginPage 

  
  
  
({super.key}); 

  static const String name = 'login_screen';

     
  

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();

  const LoginPage._();

  static LoginPage? _claseLogin;

  LoginPage getClaseLogin() {
    return _claseLogin ??= const LoginPage._();
  }
  

}

class _LoginPageState extends ConsumerState<LoginPage> {

  @override
  
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}


class LoginScreen extends ConsumerStatefulWidget { 

 const LoginScreen
({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();

  
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  
  double alturaBox = 450;
  double anchoBox = 400;
  double h1 = 45; 
  double letra = 18;
  double altCaja1 = 55; 
  double altCaja2 = 70; 
  double altCaja3 = 85;
  double altCaja4 = 35;
  double altCaja5 = 35;   



  /* void _expandBox() {
    setState(() {
      alturaBox = 500; 
      anchoBox = 500;
      h1 = 55;
      letra = 20;
      altCaja1 = 80;
      altCaja2 = 75; 
      altCaja3 = 85; 
      altCaja4 = 35; 
      altCaja5 = 40;
    });
  } */

  final MenuItem menuItem = appMenuItem[0];  

  @override
  void initState() {

    setState(() {
      usuario = '';
    });
    super.initState();
  }

  /* @override
  void dispose() {
    usuario.dispose();
    super.dispose();
  } */


  @override
  Widget build(BuildContext context) {

    

    return SafeArea(
      child: Scaffold(
        //El appBar va a contener unicamente una imagen como propiedad de fondo
        /* appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: colorTheme[0],
          title: const Center(child: Image(image: AssetImage('assets/box2.jpg'))),
        ), */
        //El body de este scaffold va a ser una columna que contiene
        //a varios widgets de texto y textfields
        body: Stack(
          children: [
            const Expanded(
              child: Center(/* child: Image(image: AssetImage()) */)),
            Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1900),
              height: alturaBox,
              width: anchoBox,
              
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 197, 57, 47),
                  width: 0.5, 
                  style: BorderStyle.solid
                )
              ),
              //color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: altCaja1,
                      width: 530,
                      child: Titulo(
                        texto: '', 
                        tamanyo: h1, 
                        colorTexto: const Color.fromARGB(255, 197, 57, 47), 
                        fuente: 'Helvetica',
                        weight: FontWeight.bold,),
                    ),
                    /* const SizedBox(
                      height: 65,
                      width: 380,
                      child: Titulo(
                        texto: 'STACK__MUSICAL', 
                        tamanyo: 40, 
                        colorTexto: Color.fromARGB(255, 163, 230, 88), 
                        fuente: 'Helvetica',
                        weight: FontWeight.bold,),
                    ), */
                    SizedBox(
                      height: altCaja2,
                      width: 580,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 55, 
                          color: Color.fromARGB(235, 202, 64, 21), 
                          shadows: [
                            Shadow(
                            blurRadius: 7.0, 
                            color: Color.fromARGB(255, 240, 61, 48), 
                            offset: Offset(3, 2),
                          )
                          ]
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            FlickerAnimatedText('STACKFLIX',
                                                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: h1)),
                            FlickerAnimatedText('          _____ ⏯︎',
                                                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: h1))
                          ]),
                      ),
                    ),
                    SizedBox(
                      height: altCaja3,
                      width: 360,
                      child: Titulo(
                        texto: 'Guarda tus pelis favoritas', 
                        tamanyo: letra, 
                        colorTexto: const Color.fromARGB(255, 167, 33, 73), 
                        fuente: 'Helvetica', 
                        weight: FontWeight.normal,),
                    ),
                    SizedBox(
                      height: altCaja4,
                      width: 360,
                      child: const CampoDeTexto(pistaTexto: 'Introduce tu nombre',),
                    ),
                    const SizedBox(height: 35,),
                    
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: SizedBox(
                          height: altCaja5,
                          width: 230,
                          child: ElevatedButton.icon(
                            style: const ButtonStyle(
                              elevation: WidgetStatePropertyAll(3),
                            ),
                          onPressed: (){
                            if (textControllerNombre.text =="" 
                            || textControllerNombre.text.contains(RegExp(r'[^a-zA-Z0-9]'))) {
                              showDialog (
                                context: context,
                                builder: (context) =>AlertDialog(
                                title: const Text('Debes introducir un nombre \nde usuario sin caracteres.'),
                                actions: [
                                  TextButton(
                                    /* style: ButtonStyle(
                                      backgroundColor: 
                                    ), */ 
                                    onPressed: () {
                                    Navigator.of(context).pop();
                                  }, 
                                  child: const Center(child: Text('Ok')))
                                ],
                              ));
                            }else{
                              
                              usuario = textControllerNombre.text;
                              String pl = usuario[0].toUpperCase();
                              String resto = usuario.substring(1).toLowerCase();
                              usuario = pl+resto;
                              
                              textControllerNombre.clear();
                              context.replace(menuItem.link);
                              
                              
                            }
                            
                          }, 
                          icon: const Icon(Icons.play_circle_outline_outlined), 
                          label: const Text('Comenzar', style: TextStyle(fontSize: 16),)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ]
        ),
      ),
    );
  }
}
