import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var userInput = '';
  // String? userInput = '';

  // void getWeather() {

  // }
  final _formKey = GlobalKey<FormState>();

  void getWeather() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(userInput);
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    bool darkMode = brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/newcity.jpeg'),
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.9),
            BlendMode.dstATop,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    cursorColor: Colors.blue,
                    style: TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid city name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter city name',
                      hintStyle: TextStyle(color: Colors.grey),
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSaved: (value) {
                      userInput = value!;
                    },
                  ),
                ),
              ),
              TextButton(
                onPressed: getWeather

                // print(userInput);
                // if (userInput == null) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text('Please enter a city name'),
                //     ),
                //   );
                //   // print('Please enter a city name');
                // }
                // Navigator.of(context).pop(userInput);
                ,
                child: const Text(
                  'Get Weather',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//* Outputting snackbar without TextFormField validation
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: const AssetImage('assets/images/newcity.jpeg'),
//           colorFilter: ColorFilter.mode(
//             Colors.black.withOpacity(0.9),
//             BlendMode.dstATop,
//           ),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: IconButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back_ios,
//                     size: 50.0,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(20.0),
//                 child: TextField(
//                   decoration: const InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Enter city name',
//                     hintStyle: TextStyle(color: Colors.grey),
//                     icon: Icon(
//                       Icons.location_city,
//                       color: Colors.white,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(12),
//                       ),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   onChanged: (value) {
//                     userInput = value;
//                   },
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   // print(userInput);
//                   if (userInput == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('Please enter a city name'),
//                       ),
//                     );
//                     // print('Please enter a city name');
//                   }
//                   Navigator.of(context).pop(userInput);
//                 },
//                 child: const Text(
//                   'Get Weather',
//                   style: TextStyle(
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
