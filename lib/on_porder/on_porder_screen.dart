
import 'package:flutter/material.dart';
import 'package:handzz/MyApplication.dart';
import 'package:handzz/login/login_screen.dart';
import 'package:handzz/login_or_login/login_or_login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:handzz/cash_helper.dart';


class BordingModel {
  late final String image;
  late final String title;
  late final String body;

  BordingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}
class OnBorderScreen extends StatelessWidget {
  List<BordingModel> boarding = [
    BordingModel(
        image: 'assets/images/1.png', title: 'Handzz', body: 'You make , We sell'
    ),
    BordingModel(
        image: 'assets/images/Ecommerce checkout laptop-pana.png', title: 'You make , We sell', body: 'The right place to grow your Business and sales, Even when you are at home all you should do make your products and take your money'
    ),
    BordingModel(
        image: 'assets/images/Catalogue-amico.png', title: 'Handzz', body: 'The easist way to build a store in the middle east'
    )
  ];
  var bondingController = PageController();
  bool islast = false;


  void submit(context){
    cacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value)
      {
        navigateTo(LoginOrLogin(),context );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.38),
        actions: [
          TextButton(onPressed: () {submit(context);}, child: Text("Skip",style: TextStyle(color: Colors.white),))
        ],
      ),
       body:Stack(
         children: [
           Column(
             children: [
               Expanded(child: Container()),
               Expanded(
                 flex: 2,
                 child: ClipRRect(
                   borderRadius: BorderRadius.only(topRight: Radius.circular(400)),
                   child: Container(
                     color: Colors.blue.withOpacity(.2),
                   ),
                 ),
               ),
             ],
           ),
           Padding(
             padding: const EdgeInsets.all(30.0),
             child: Column(
               children: [
                 Expanded(
                   child: PageView.builder(
                     physics: BouncingScrollPhysics(),
                     controller: bondingController,
                     itemBuilder: (context,index) => buildBorderItem(boarding[index]),
                     itemCount: boarding.length,
                     onPageChanged: (int index)
                     {
                       if (index == boarding.length-1)
                       {
                         islast = true;
                       }else
                       {
                         islast = false;
                       }
                     },
                   ),
                 ),
                 SizedBox(
                   height: 40,
                 ),
                 Row(
                   children: [
                     SmoothPageIndicator(
                       controller: bondingController,
                       count: boarding.length,
                       effect: ExpandingDotsEffect(
                           dotColor: Colors.grey,
                           dotHeight: 10,
                           dotWidth: 10,
                           expansionFactor: 4,
                           spacing: 5,
                           activeDotColor: Colors.blue
                       ),
                     ),
                     Spacer(),
                     FloatingActionButton(
                       onPressed: ()
                       {
                         if(islast)
                         {
                           submit(context);
                         }
                         else
                         {
                           bondingController.nextPage(
                               duration: Duration(
                                 milliseconds: 750,
                               ), curve: Curves.fastLinearToSlowEaseIn
                           );
                         }

                       },
                       child: Icon(
                           Icons.arrow_forward_ios
                       ),
                     )
                   ],
                 )
               ],
             ),
           )
         ],
       )
    );
  }
}
Widget buildBorderItem (BordingModel model) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: Center(
        child: Image(
          image: AssetImage(
              '${model.image}'
          ),
        ),
      ),
    ),
    SizedBox(
      height: 20,
    ),
    Text(
      '${model.title}',
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        color: Colors.blueAccent
      ),
    ),
    SizedBox(
      height: 20,
    ),
    Text(
      '${model.body}',
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
    ),
  ],
);
