import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedItem;
  String? _selectedItem2;

  List<String> _items = [
    'Office',
    'Home',
    'Commercial',
  ];

  List<String> _banks = [
    'National Bank of Egypt',
    'Banque Misr',
    'Commercial International Bank',
    'Banque du Caire',
    'Arab African International Bank',
    'Faisal Islamic Bank of Egypt',
    'Alexandria Bank',
    'Suez Canal Bank',
    'Bank Audi Egypt',
    'HSBC Egypt',
    'QNB Alahli',
    'Al Baraka Bank Egypt',
    'CIB Egypt',
    'Bank of Alexandria',
    'United Bank of Egypt',
    'Credit Agricole Egypt',
    'Arab Bank',
    'Ahli United Bank',
  ];
  var formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var landmarkController = TextEditingController();
  var townController = TextEditingController();
  var addressTypeController = TextEditingController();

  var formKey2 = GlobalKey<FormState>();
  var nameOnCartController = TextEditingController();
  var cardNumberController = TextEditingController();
  var cVVController = TextEditingController();
  var expirationDateController = TextEditingController();

  var formKey3 = GlobalKey<FormState>();
  var selectBankCartController = TextEditingController();

  var formKey4 = GlobalKey<FormState>();
  var cardHoldeController = TextEditingController();
  var cardnumberController = TextEditingController();
  var CVVController = TextEditingController();
  var validThruController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.motorcycle),),
              Tab(icon: Icon(Icons.credit_card),),
              Tab(icon: Icon(Icons.comment_bank),),
              Tab(icon: Icon(Icons.paypal),),
            ],
          ),
          title: Center(child: Text("Payment")),
        ),
        body: TabBarView(
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage("assets/images/pricing-ultimate.png"),height: 80,width: 100,),
                        Center(
                            child: Text("Cash on delivery",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: fullNameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        //prefixIcon: Icon( Icons.store),
                        border: OutlineInputBorder(),
                        labelText: 'Full Name',
                      ),
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please enter your full name ';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: mobileNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        //prefixIcon: Icon( Icons.store),
                        border: OutlineInputBorder(),
                        labelText: 'Mobile Number',
                      ),
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please enter your mobile number ';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: landmarkController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        //prefixIcon: Icon( Icons.store),
                        border: OutlineInputBorder(),
                        labelText: 'Landmark',
                      ),
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please enter your Landmark ';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: townController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                       // prefixIcon: Icon( Icons.store),
                        border: OutlineInputBorder(),
                        labelText: 'Town/City',
                      ),
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please enter your Town/City ';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Choose your',
                       // prefixIcon: Icon(Icons.type_specimen),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      ),
                      value: _selectedItem,
                      onChanged: (value) {
                        setState(() {
                          _selectedItem = value as String;
                        });
                      },
                      items: _items.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          alignment: Alignment.center,

                        ),
                        onPressed: () {
                        },
                        child: const Text(
                            "Delivery to this Address",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Form(
              key: formKey2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage("assets/images/Mastercard_logo-removebg-preview.png"),height: 80,width: 100,),
                        Center(
                            child: Text("Credit/Debit",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("Name on Card",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: nameOnCartController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        //prefixIcon: Icon( Icons.store),
                        border: OutlineInputBorder(),
                        labelText: 'yousif reda',
                      ),
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please enter your full name ';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("Card Number",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: cardNumberController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        //prefixIcon: Icon( Icons.store),
                        border: OutlineInputBorder(),
                        labelText: '.... .... .... ....',
                      ),
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please enter your number ';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("CVV",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: cVVController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        //prefixIcon: Icon( Icons.store),
                        border: OutlineInputBorder(),
                        labelText: '...',
                      ),
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please enter your cvv ';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("Expiration Date",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: expirationDateController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                       // prefixIcon: Icon( Icons.store),
                        border: OutlineInputBorder(),
                        labelText: 'MM / YY',
                      ),
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please enter';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          alignment: Alignment.center,

                        ),
                        onPressed: () {
                        },
                        child: const Text(
                            "Make a Payment",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Form(
              key: formKey3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(image: AssetImage("assets/images/visa.png"),height: 80,width: 100,),
                          Center(
                              child: Text("Net Banking",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text("Select bank",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: '=== Banks ===',
                          // prefixIcon: Icon(Icons.type_specimen),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        ),
                        value: _selectedItem2,
                        onChanged: (value) {
                          setState(() {
                            _selectedItem2 = value as String;
                          });
                        },
                        items: _banks.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            alignment: Alignment.center,

                          ),
                          onPressed: () {
                          },
                          child: const Text(
                              "Pay Now",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Form(
              key: formKey4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Image(image: AssetImage("assets/images/PayPal-Logo-removebg-preview.png"),height: 80,width: 100,),
                    Center(
                    child: Text("Paypal Account",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),)),
                         ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("Card Holder",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: cardHoldeController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        //prefixIcon: Icon( Icons.store),
                        border: OutlineInputBorder(),
                        labelText: 'yousif reda',
                      ),
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please enter your full name ';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("Card Number",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: cardnumberController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        //prefixIcon: Icon( Icons.store),
                        border: OutlineInputBorder(),
                        labelText: '.... .... .... ....',
                      ),
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please enter your number ';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("CVV",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: CVVController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        //prefixIcon: Icon( Icons.store),
                        border: OutlineInputBorder(),
                        labelText: '...',
                      ),
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please enter your cvv ';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("Valid Thru",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: validThruController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        // prefixIcon: Icon( Icons.store),
                        border: OutlineInputBorder(),
                        labelText: 'MM / YY',
                      ),
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please enter';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          alignment: Alignment.center,

                        ),
                        onPressed: () {
                        },
                        child: const Text(
                            "Proceed Payment",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
