// import 'package:flutter/material.dart';
//
// class WrapWidget extends StatelessWidget {
//   const WrapWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("WRAP WIDGET"),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Column(
//         children: [
//           Wrap(
//             direction: Axis.horizontal,
//             textDirection: TextDirection.rtl,
//             verticalDirection: VerticalDirection.up,
//             children: [
//               Container(
//                 height: 50,
//                 width: 50,
//                 color: Colors.black,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 height: 50,
//                 width: 50,
//                 color: Colors.deepPurple,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 height: 50,
//                 width: 50,
//                 color: Colors.teal,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 height: 50,
//                 width: 50,
//                 color: Colors.purpleAccent,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 height: 50,
//                 width: 50,
//                 color: Colors.yellowAccent,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 height: 50,
//                 width: 50,
//                 color: Colors.redAccent,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 height: 50,
//                 width: 50,
//                 color: Colors.lightGreen,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 height: 50,
//                 width: 50,
//                 color: Colors.limeAccent,
//               ),
//             ],
//           ),
//           InkWell(
//             onTap: () {
//               print("Inkwell Pressed");
//             },
//             child: Icon(
//               Icons.fingerprint_sharp,
//               size: 50,
//             ),
//           ),
//           Divider(
//             indent: 15,
//             endIndent: 15,
//             thickness: 5,
//           ),
//           ElevatedButton(
//             onPressed: () {},
//             child: GestureDetector(
//                 onTap: () {
//                   print("Gesture Detector Calle");
//                 },
//                 child: Text("Hi, How Are You?")),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           // ClipOval(
//           //     child: Image(
//           //   width: 150,
//           //   height: 150,
//           //   image: NetworkImage('https://i.ibb.co/1vXpqVs/flutter-logo.jpg'),
//           // )),
//           ClipRRect(
//             child: ClipPath(
//               clipper: MyCustomClipper(),
//               child: Image.network("https://i.ibb.co/1vXpqVs/flutter-logo.jpg"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   getClip(Size size) {
//     // TODO: implement getClip
//     final path = Path();
//     path.lineTo(size.width, 0.0);
//     path.lineTo(size.width * 0.75, size.height);
//     path.lineTo(size.width * 0.25, size.height);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper oldClipper) {
//     // TODO: implement shouldReclip
//     throw UnimplementedError();
//   }
// }
