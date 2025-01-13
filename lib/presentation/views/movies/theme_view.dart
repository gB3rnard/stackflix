

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stackflix/config/menu-items/menu_item.dart';
import 'package:stackflix/presentation/providers/providers.dart';

import '../../providers/theme-changer/theme_changer_provider.dart';


class ThemeChangerScreen extends ConsumerWidget {

  static const String name = 'theme-changer';


  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 

    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    


    return Scaffold(

      appBar: AppBar(
        title: const Text('Tema y configuración'),
        actions: [
          IconButton(
            onPressed: () {
              /* ref.read(isDarkModeProvider.notifier)
              .update((isDarkMode) => !isDarkMode); */

              ref.read(themeNotifierProvider.notifier).toggleDarkMode(); 

            }, 
            icon: isDarkMode 
            ? const Icon(Icons.light_mode_outlined) 
            : const Icon(Icons.dark_mode_outlined) 
          )
        ],
      ), 

      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) { 

    final List<Color> colors = ref.watch(colorListProvider); 

    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor; 

    final clearMovies = ref.watch(favoriteMoviesProvider).values.toList();

    final menuItem  = appMenuItem[1]; 

    //Id movieId = ;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
                itemCount: colors.length,
                itemBuilder: (context, index){
              
                  final Color color = colors[index];
              
                  return RadioListTile(
                    title: Text('Color', style: TextStyle(color: color),),
                    subtitle: Text('${color.value}'),
                    activeColor: color,
                    value: index, 
                    groupValue: selectedColor, 
                    onChanged: ((value) {
                      //ref.read(selectedColorProvider.notifier).state = index;
                      
                      ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
                      
                    }
                  )); 
                },
              ),
        ),
        Padding(
          padding: const EdgeInsets.all(65.0),
          child: ElevatedButton.icon(
            onPressed: (){
              if( clearMovies.isNotEmpty) {
                showDialog (
                  context: context,
                  builder: (context) =>AlertDialog(
                  title: const Text('Ya quieres irte?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        //ref.read(localStorageRepositoryProvider).deleteFavorite();
                        //ref.read(localStorageRepositoryProvider).loadMovies();
                        context.replace(menuItem.link);
                      },
                      child: const Center(child: Text('Sí'))
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Center(child: Text('No'))
                    )
                  ]));
                

              }else{

              }
            }, 
            label: const Text('Cerrar Sesion', style: TextStyle(fontSize: 18),), 
            icon: const Icon(Icons.logout),
            iconAlignment: IconAlignment.start,
          ),
        )
      ],
    );

    
  }
}