import 'package:animation/Screen/choose_location.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("lib/Images/$bgImage"),
            fit: BoxFit.cover)
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location, color: Colors.grey[300],),
                  label: Text("Edit Location", style: TextStyle(color: Colors.grey[300]),)
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data["location"],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 2.0
                    ),
                  )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(data['time'], style: TextStyle(fontSize: 66.0, color: Colors.white),)
              ],
            ),
          ),
        )
      ),
    );
  }
}


// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurple[600],
//       body: Stack(
//         alignment: Alignment.center,

//         children: <Widget>[
//           Container(
//             height: 600.0,
//             width: 400.0,
//             child: Image(
//               image: AssetImage("lib/Images/ladyd.png"),
//               fit: BoxFit.contain,
//             ),
//           ),

//           Positioned(
//               top: 40.0,
//               left: 20.0,
//               child: Text(
//                 "Todo",
//                 style: TextStyle(
//                     fontSize: 40.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               )),
              
//           DraggableScrollableSheet(
//               maxChildSize: 0.85,
//               builder:
//                   (BuildContext context, ScrollController _scrollController) {
//                 return Stack(
//                   overflow: Overflow.visible,
//                   children: <Widget>[
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(40.0),
//                               topRight: Radius.circular(40.0))),
//                       child: ListView.builder(
//                         itemBuilder: (context, int index) {
//                           return ListTile(
//                             title: Text(
//                               "Todo Item $index",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             subtitle: Text(
//                               "Item details",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.grey),
//                             ),
//                             trailing: Icon(
//                               Icons.check_circle,
//                               color: Colors.greenAccent,
//                             ),
//                             isThreeLine: true,
//                           );
//                         },
//                         controller: _scrollController,
//                         itemCount: 10,
//                       ),
//                     ),
//                     Positioned(
//                       top: -30.0,
//                       right: 30.0,
//                       child: FloatingActionButton(
//                         child: Icon(Icons.add),
//                         backgroundColor: Colors.pinkAccent,
//                         onPressed: (){}  
//                       ),
//                     )
//                   ],
//                 );
//               })
//         ],
//       ),
//     );
//   }
// }
