import 'package:flutter/material.dart';
import 'package:movie_browser/bloc/splash_screen/splash_screen_bloc.dart';
import 'package:movie_browser/views/pages/search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider(
        create: (context) => SplashScreenBloc(),
        child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
          builder: (context, state) {
            context
                .read<SplashScreenBloc>()
                .add(SplashScreenStartUpEvent(context));
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.movie,
                    color: Colors.redAccent,
                    size: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    //TODO Change later
                    'Movie Browser',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  CircularProgressIndicator(
                    color: Colors.redAccent,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
