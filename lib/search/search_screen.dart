import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handzz/compands.dart';
import 'package:handzz/home/cubit_shop.dart';
import 'package:handzz/home/states_shop.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class SearchScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();
  stt.SpeechToText _speech = stt.SpeechToText();
  Future<void> _getImageAndDisplayInTextField() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    final imageFile = File(pickedFile.path);
    final bytes = await imageFile.readAsBytes();

    final encoded = base64Encode(bytes);
    final dataUri = 'data:image/png;base64,$encoded';

    searchController.text = dataUri;
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit(),
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white.withOpacity(.1),
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.blue) ,
              ),
              body: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: 'Search...',
                          // suffixIcon: IconButton(
                          //     icon: Icon(Icons.mic),
                          // ),
                            prefixIcon: Icon(Icons.search),
                            labelText: 'Search',
                            border: OutlineInputBorder()
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'enter Text to search';
                          }
                        },
                        onFieldSubmitted: (String text)
                        {
                          ShopCubit.get(context).search(text);
                        },
                      ),
                      SizedBox(height: 10,),
                      if (state is SearchLoadingState)
                        LinearProgressIndicator(),
                      SizedBox(height: 5,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Spacer(flex: 2,),
                         FloatingActionButton(
                           onPressed: () async {
                             bool? available = await _speech.initialize(
                               onStatus: (status) => print('onStatus: $status'),
                               onError: (error) => print('onError: $error'),
                             );

                             if (available) {
                               bool listening = await _speech.listen(
                                 onResult: (result) {
                                   String? text = result.recognizedWords;
                                   searchController.text = text;
                                 },
                               );

                               if (!listening) {
                                 print('Error starting speech recognition');
                               }
                             } else {
                               print('Speech recognition not available');
                             }
                           },
                           child: Icon(Icons.mic),
                         ),
                         Spacer(flex: 1,),
                         FloatingActionButton(
                           onPressed: _getImageAndDisplayInTextField,
                           child: Icon(Icons.image_search),
                         ),
                         Spacer(flex: 2,),
                       ],
                     ),
                      if (state is SearchSucssesState)
                        Expanded(
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => buildListProductSearch(ShopCubit.get(context).model!.data!.data![index],index,context,isOldPrice: false),
                              separatorBuilder: (context, index) => myDivider(),
                              itemCount: ShopCubit.get(context).model!.data!.data!.length
                          ),
                        ),
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
