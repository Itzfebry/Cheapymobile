// import 'package:flutter/material.dart';

// class ProductCard extends StatefulWidget {
//   final String imagePath;
//   final String category;
//   final String title;
//   final String price;

//   const ProductCard({
//     Key? key,
//     required this.imagePath,
//     required this.category,
//     required this.title,
//     required this.price,
//   }) : super(key: key);

//   @override
//   _ProductCardState createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   bool _isLoved = false;

//   void _toggleLove() {
//     setState(() {
//       _isLoved = !_isLoved;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       width: 130,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               Container(
//                 height: 125,
//                 width: 130,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.asset(
//                     widget.imagePath,
//                     width: 150.0,
//                     height: 125.0,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: GestureDetector(
//                   onTap: _toggleLove,
//                   child: Icon(
//                     _isLoved ? Icons.favorite : Icons.favorite_border,
//                     color: _isLoved ? Colors.red : Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 15),
//           Text(
//             widget.category,
//             style: TextStyle(color: Colors.grey),
//           ),
//           Text(
//             widget.title,
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Text(
//             widget.price,
//           ),
//         ],
//       ),
//     );
//   }
// }
