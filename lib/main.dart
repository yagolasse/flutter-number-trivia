import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/core/resources/strings.dart';
import 'package:number_trivia/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:number_trivia/features/theme/presentation/bloc/theme_bloc.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<ThemeBloc>(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: APP_TITLE,
            theme: state.themeData,
            home: NumberTriviaPage(),
          );
        },
      ),
    );
  }
}
