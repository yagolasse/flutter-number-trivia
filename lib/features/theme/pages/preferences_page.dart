import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/core/resources/strings.dart';
import 'package:number_trivia/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:number_trivia/ui/global/themes/app_themes.dart';

class PreferencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(PREFERENCES)),
      body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: AppTheme.values.length,
          itemBuilder: (context, index) {
            final itemAppTheme = AppTheme.values[index];
            return Card(
              color: appThemeData[itemAppTheme].primaryColor,
              child: ListTile(
                title: Text(
                  itemAppTheme.toString(),
                  style: appThemeData[itemAppTheme].textTheme.display1,
                ),
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context)
                    ..add(ThemeChanged(itemAppTheme));
                },
              ),
            );
          }),
    );
  }
}
