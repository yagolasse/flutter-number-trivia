import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class NumberTrivia extends Equatable {
  final int number;
  final String text;

  NumberTrivia({@required this.number, @required this.text});

  @override
  List<Object> get props => [text, number];
}
