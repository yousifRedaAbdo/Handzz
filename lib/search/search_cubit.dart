import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handzz/search/search_states.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
class SearchCubit extends Cubit<SearchState> {
  stt.SpeechToText _speech = stt.SpeechToText();

  SearchCubit() : super(SearchState());

  void startListening() async {
    if (!_speech.isAvailable) {
      return;
    }

    await _speech.listen(
      onResult: (result) {
        emit(state.copyWith(text: result.recognizedWords));
      },
    );
  }

  void stopListening() {
    _speech.stop();
  }
}