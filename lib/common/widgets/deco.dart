// import '../../constant/const.dart';

// class MainDeco extends StatefulWidget {
//   int? ind;
//   MainDeco({super.key, this.ind});

//   @override
//   State<MainDeco> createState() => _MainDecoState();
// }

// class _MainDecoState extends State<MainDeco> {


//   @override
//   Widget build(BuildContext context) {
//     if (widget.ind == 0) {
//       return ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           var data = products[index];
//           if (widget.ind == 0) {
//             return MainRow(data, context)
//                 .box
//                 .padding(const EdgeInsets.all(
//                   8,
//                 ))
//                 .make();
//           } else {
//             return NoDataMess(context);
//           }
//         },
//       );
//     } 
//   }
// }