//crear un estado de tipo booleano 'isDarkModeProvider' 

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stackflix/config/theme/app_theme.dart';
import 'package:stackflix/presentation/screens/movies/login_screen.dart';



//Para aclarar los tipos de Gestores: 
//Provider es usado para objetos inmutables 
//StateProvider es usado para objetos que deben mantener al menos una parte de su estado inmutable 
//StateNotifierProvider para objetos más complejos que mantienen un estado.

final nameProvider = StateProvider<String>((ref) => usuario);

final StateProvider<bool> isDarkModeProvider = StateProvider((ref) => false); 


//Listado de colores inmutable 

final colorListProvider = Provider((ref) => colorList); 


final selectedColorProvider = StateProvider((ref) => 0); 

//Un objeto de tipo AppTheme
//Controla la clase ThemeNotifier y el estado es el de la clase AppTheme 

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

//La siguiente clase extiende de StateNotifier porque 
//StateNotifier se va a encargar de mantener un estado en particular 
//en este caso, una instancia de la clase AppTheme 

//Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  
  //la siguiente linea es la creacion de una instancia de la clase AppTheme
 
  //STATE = Estado = new AppTheme()
  ThemeNotifier(): super( AppTheme() ); 

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex (int index) {
    state = state.copyWith(selectedColor: index);
  }

}
