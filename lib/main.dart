import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_cask/bloc/auth_bloc.dart';
import 'package:one_cask/bloc/collection_bloc.dart';
import 'package:one_cask/data/repository/collection_repository.dart';
import 'package:one_cask/pallete.dart';
import 'package:one_cask/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CollectionRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  CollectionBloc(context.read<CollectionRepository>())),
          BlocProvider(create: (context) => AuthBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true).copyWith(
            scaffoldBackgroundColor: Pallete.backgroundColor,
            textTheme: GoogleFonts.latoTextTheme(
              ThemeData.dark(useMaterial3: true).textTheme,
            ),
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
