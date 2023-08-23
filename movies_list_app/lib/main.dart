import 'package:flutter/material.dart';
import 'package:movies_list_app/components/card.dart';
import 'package:movies_list_app/data/api_call.dart';
import 'package:movies_list_app/data/movies_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: MovieApiCall().movieApiCall(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                final movie = snapshot.data as Movie;
                return GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 64),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 530 * 9 / 16,
                  ),
                  itemCount: movie.results.length,
                  itemBuilder: (BuildContext context, int index) {
                    final result = movie.results[index];
                    return MovieCard(
                      movie: result,
                    );
                  },
                );
              } else {
                return const Text('Error');
              }
            },
          ),
        ),
      ),
    );
  }
}
/* 
FutureBuilder(
            future: MovieApiCall().movieApiCall(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                final movie = snapshot.data as Movie;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 250,
                  ),
                  itemCount: movie.results.length,
                  itemBuilder: (BuildContext context, int index) {
                    final result = movie.results[index];
                    return MovieCard(
                      movie: result,
                    );
                  },
                );
              } else {
                return const Text('Error');
              }
            },
          ),

FutureBuilder(
            future: MovieApiCall().movieApiCall(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                final movie = snapshot.data;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 250,
                  ),
                  itemCount: movie?.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (movie?.data?.isEmpty ?? true) {
                      return const SizedBox.shrink();
                    }
                    return MovieCard(
                      movie: movie?.data?[index],
                    );
                  },
                );
              } else {
                return const Text('Error');
              }
            },
          ),
 */