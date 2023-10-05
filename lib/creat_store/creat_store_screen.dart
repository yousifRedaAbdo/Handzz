import 'package:flutter/material.dart';
class CreatStore extends StatefulWidget {
  @override
  State<CreatStore> createState() => _CreatStoreState();
}

class _CreatStoreState extends State<CreatStore> {
  String? _selectedItem;

  List<String> _items = [
    'food',
    'handmade',
    'clothes',
  ];
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.38),
      ),
      body: Stack(
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Image(image: AssetImage('assets/images/Mobile login-rafiki.png')),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        prefixIcon: Icon( Icons.store),
                        border: OutlineInputBorder(),
                        labelText: 'store name',
                      ),
                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please enter your store name ';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Choose your product type',
                        prefixIcon: Icon(Icons.type_specimen),
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
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        prefixIcon: Icon( Icons.phone),
                        border: OutlineInputBorder(),
                        labelText: 'Phone',
                      ),

                      validator: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Phone is error';
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
                            "sent",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
