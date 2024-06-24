import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infant_incubator/model/infant_model.dart';
import 'package:infant_incubator/controller/infantController.dart';


class InfantWidget extends StatelessWidget {
  const InfantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final infantController = Get.put(InfantHttpService());
    List <InfantModel> infants = infantController.infants;
    return Obx(
      () {
        if (infantController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (infants.isEmpty) {
          return Center(
            child: Text(
              'No data available',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xffb6d0f3),
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                GridView.count(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.8,
                  children: List.generate(
                    infants.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          // Handle tap event
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            // color: Theme.of(context).colorScheme.primary,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://tadawy-production.up.railway.app/${infants[index].image}',
                                width: 150,
                                height: 150,
                              ),
                              Column(
                                children: [
                                  Text(
                                    infants[index].title,
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color.fromARGB(255, 110, 156, 216),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    infants[index].data,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}






// class InfantWidget extends StatefulWidget {
//   @override
//   _InfantWidgetState createState() => _InfantWidgetState();
// }

// class _InfantWidgetState extends State<InfantWidget> {
//   InfantHttpService infantHttpService = InfantHttpService();
//   late Future<List<InfantModel>> futureInfantList;
//   Timer? _dataTimer;

//   @override
//   void initState() {
//     super.initState();
//     futureInfantList = InfantHttpService().fetchInfantData();
//     _dataTimer = Timer.periodic(Duration(seconds: 2), (_) {
//       // Fetch data every 2 seconds and update UI
//       refreshData();
//     });
//   }

//   void dispose() {
//     _dataTimer?.cancel(); // Cancel timer when the widget is disposed
//     super.dispose();
//   }

//   void refreshData() async {
//     setState(() {
//       futureInfantList = InfantHttpService().fetchInfantData();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<InfantModel>>(
//       future: futureInfantList,
//       builder: (context, snapshot) {
//         // if (snapshot.connectionState == ConnectionState.waiting) {
//         //   return Center(child: CircularProgressIndicator());
//         // } else
//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(
//             child: Text(
//               'No data available',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xffb6d0f3),
//               ),
//             ),
//           );
//         } else {
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 GridView.count(
//                   physics: ClampingScrollPhysics(),
//                   shrinkWrap: true,
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 5,
//                   childAspectRatio: 0.8,
//                   children: List.generate(
//                     snapshot.data!.length,
//                     (index) {
//                       return InkWell(
//                         onTap: () {
//                           // Handle tap event
//                         },
//                         child: Container(
//                           margin: EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: Theme.of(context).colorScheme.primary,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           padding: EdgeInsets.all(5),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.network(
//                                 'https://tadawy-production.up.railway.app/${snapshot.data![index].image}',
//                                 // snapshot.data![index].image,
//                                 width: 150,
//                                 height: 150,
//                               ),
//                               // Image.asset(
//                               //   snapshot.data![index].image,
//                               //   width: 150,
//                               //   height: 150,
//                               // ),
//                               Column(
//                                 children: [
//                                   Text(
//                                     snapshot.data![index].title,
//                                     style: TextStyle(
//                                       fontSize: 19,
//                                       fontWeight: FontWeight.bold,
//                                       overflow: TextOverflow.ellipsis,
//                                       color: Color.fromARGB(255, 110, 156, 216),
//                                     ),
//                                   ),
//                                   SizedBox(height: 5),
//                                   Text(
//                                     snapshot.data![index].data,
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                       overflow: TextOverflow.ellipsis,
//                                       color: Theme.of(context)
//                                           .colorScheme
//                                           .tertiary,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
// }