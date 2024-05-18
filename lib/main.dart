import 'package:flutter/material.dart';
import 'package:posts_all/core/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_all/feature/detail/bloc/bloc_details_bloc.dart';
import 'package:posts_all/feature/home/bloc/bloc_bloc.dart';
import 'package:posts_all/feature/home/page/home.dart';
import 'init_dependency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();//dependency injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<BlocPost>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<BlocDetails>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Post',
        theme: AppTheme.lightThemeMode,
        home: const HomePage(),
      ),
    );
  }
}
