// // onTap: () {
// //                       final numberPhone = contacts![index].phones.first.number;
// //                       final nameNumber = contacts![index].displayName;
// //                       setState(() {
// //                         _nomor.text = numberPhone.toString();
// //                         rawName = nameNumber.toString();
// //                       });

// //                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //                         duration: const Duration(seconds: 1),
// //                         backgroundColor: MyColor.greenWhatsApp,
// //                         elevation: 3,
// //                         behavior: SnackBarBehavior.floating,
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(30),
// //                         ),
// //                         content: Text(
// //                             textAlign: TextAlign.center,
// //                             'The phone number of ${contacts![index].displayName} has been copied '),
// //                       ));
// //                       Future.delayed(const Duration(seconds: 2))
// //                           .then((value) => Navigator.pop(context));
// //                     },










//  GestureDetector(
//                       onTap: () {
//                         final numberPhone =
//                             contacts![index].phones.first.number;
//                         final nameNumber = contacts![index].displayName;
//                         setState(() {
//                           _nomor.text = numberPhone.toString();
//                           rawName = nameNumber.toString();
//                         });

//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           duration: const Duration(seconds: 1),
//                           backgroundColor: MyColor.greenWhatsApp,
//                           elevation: 3,
//                           behavior: SnackBarBehavior.floating,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           content: Text(
//                               textAlign: TextAlign.center,
//                               'The phone number of ${contacts![index].displayName} has been copied '),
//                         ));
//                         Future.delayed(const Duration(seconds: 2))
//                             .then((value) => Navigator.pop(context));
//                       },
//                       child: Card(
//                         shadowColor: MyColor.greenWhatsApp.withOpacity(.5),
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(18)),
//                         child: Container(
//                             height: 74,
//                             // color: Colors.red,
//                             width: double.infinity,
//                             padding: const EdgeInsets.symmetric(horizontal: 6),
//                             child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   //Image

//                                   ProfilePicture(
//                                     name: contacts![index].name.first,
//                                     radius: 25,
//                                     fontsize: 18,
//                                     random: true,
//                                   ),
//                                   const SizedBox(
//                                     width: 11,
//                                   ),
//                                   //Content
//                                   Expanded(
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         SingleChildScrollView(
//                                           clipBehavior: Clip.antiAlias,
//                                           physics:
//                                               const BouncingScrollPhysics(),
//                                           scrollDirection: Axis.horizontal,
//                                           child: Text(
//                                             overflow: TextOverflow.ellipsis,
//                                             "${contacts![index].name.first} ${contacts![index].name.last}",
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 fontFamily: 'HelveticaBold',
//                                                 color: MyColor.black),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         Text(
//                                           num,
//                                           style: TextStyle(
//                                               fontSize: 12,
//                                               fontFamily: 'Helvetica',
//                                               color: MyColor.black),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ])),
//                       ),
//                     ),
                  