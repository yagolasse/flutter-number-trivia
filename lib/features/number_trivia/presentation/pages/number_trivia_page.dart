import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:number_trivia/features/number_trivia/presentation/widgets/loading_widget.dart';
import 'package:number_trivia/features/number_trivia/presentation/widgets/message_display.dart';
import 'package:number_trivia/features/number_trivia/presentation/widgets/trivia_display.dart';
import 'package:number_trivia/injection_container.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: SingleChildScrollView(
        child: _buildBody(context),
      ),
    );
  }

  BlocProvider<NumberTriviaBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  } else if (state is Loaded) {
                    return TriviaDisplay(
                      numberTrivia: state.trivia,
                    );
                  }
                  // If state is loading
                  return MessageDisplay(
                    message: 'Start Searching',
                  );
                },
              ),
              SizedBox(height: 20),
              TriviaControls(),
            ],
          ),
        ),
      ),
    );
  }
}

class TriviaControls extends StatefulWidget {
  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final controller = TextEditingController();
  String inputString;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: ' Input a number',
            ),
            onChanged: (value) {
              inputString = value;
            },
            onSubmitted: (_) {
              dispatchConcrete();
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text('Search'),
                  color: Theme.of(context).accentColor,
                  textTheme: ButtonTextTheme.primary,
                  onPressed: dispatchConcrete,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: RaisedButton(
                  child: Text('Get random trivia'),
                  onPressed: dispatchRandom,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void dispatchConcrete() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetTriviaForConcreteNumber(inputString));
  }

  void dispatchRandom() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaForRandomNumber());
  }
}
