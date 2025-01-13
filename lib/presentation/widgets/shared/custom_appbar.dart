import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stackflix/presentation/providers/theme-changer/theme_changer_provider.dart';

import '../../../domain/entities/movie.dart';
import '../../delegates/search_movie_delegate.dart';
import '../../providers/providers.dart';



class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final userName = ref.watch(nameProvider);
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 5 ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [
              Icon( Icons.local_movies_sharp, color: colors.primary ),
              const SizedBox( width: 5 ),
              Text('Stackflix', style: titleStyle ),
      
              const Spacer(),
              Text('Hola $userName!', style: const TextStyle(fontWeight: FontWeight.bold),),
              const Spacer(),

      
              IconButton(onPressed: () {

                final searchedMovies = ref.read( searchedMoviesProvider );
                final searchQuery = ref.read(searchQueryProvider);
                
                showSearch<Movie?>(
                  query: searchQuery,
                  context: context, 
                  delegate: SearchMovieDelegate(
                    initialMovies: searchedMovies,
                    searchMovies: ref.read( searchedMoviesProvider.notifier ).searchMoviesByQuery
                  )
                ).then((movie) {
                  if ( movie == null ) return;

                  context.push('/home/0/movie/${ movie.id }');
                });

              }, 
              icon: const Icon(Icons.search)
              )
            ],
          ),
        ),
      )
    );
  }
}