import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
class SearchState {
  String text;
  bool isListening;

  SearchState({this.text = '', this.isListening = false});

  SearchState copyWith({String? text,  bool? isListening}) {
    return SearchState(
      text: text ?? this.text,
      isListening: isListening ?? this.isListening,
    );
  }
}
