import 'dart:io';

import 'package:cargo_app/fetches/info_contractor_fetch.dart';
import 'package:cargo_app/model/info_contractor_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:image_picker/image_picker.dart';

import '../../main/main.dart';
import '../../services/service.dart';

class EditAdminData extends StatefulWidget {
  final Set<Marker> adminMarkers;
  const EditAdminData({Key? key, required this.adminMarkers}) : super(key: key);

  @override
  _EditAdminDataState createState() => _EditAdminDataState();
}

class _EditAdminDataState extends State<EditAdminData> {
  late String emailGet;
  late Future<InfoContractorModel> futureInfoContractor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureInfoContractor = fetchInfoContractor();
  }

  String hintText = 'Введите описания';

  int select = 0;
  int selectStatus = 0;

  TextEditingController price = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController lifeTime = TextEditingController();
  String selectContractor = '';
  String contractorId = '';

  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  /*Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Выберите фото",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            InkWell(
              onTap: () {
                print('Camera');
                takePhotoCamera();
                print(imageFileCamera.path);
              },
              child: Ink(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.camera),
                    const SizedBox(height: 10),
                    const Text("Камера")
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () async {
                print('Galery');
                await takePhotoGalery();
                print(imageFile[0].path);
              },
              child: Ink(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.image),
                    const SizedBox(height: 10),
                    const Text("Гелерея")
                  ],
                ),
              ),
            ),

            */
  /*IconButton(onPressed: (){
              takePhoto(ImageSource.camera);
            }, icon: Icon(Icons.camera),
            ),*/ /*

            */ /*Expanded(
              child: ElevatedButton.icon(

                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text(''),
              ),
            ),*/ /*
            */ /*IconButton(onPressed: (){takePhoto(ImageSource.gallery);}, icon: Icon(Icons.image),),*/ /*
            */ /*Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text(''),
              ),
            ),*/ /*
          ])
        ],
      ),
    );
  }*/

  /* Future<void> takePhotoGalery() async {
    */ /*final pickedFile = await _picker.getImage(
      source: source
    );*/ /*
    final List<XFile> images = await _picker.pickMultiImage();
    setState(() {
      imageFile.addAll(images);
    });
  }*/

  /* void takePhotoCamera() async {
    */ /*final pickedFile = await _picker.getImage(
      source: source
    );*/ /*
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile.add(photo!);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // Container(
          //   width: 142,
          //   height: 142,
          //   padding: EdgeInsets.all(9),
          //   decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //             blurRadius: 5,
          //             offset: Offset(0, 0),
          //             color: Color(0x26000000))
          //       ]),
          //   child: Container(
          //     padding: EdgeInsets.all(9),
          //     decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: Colors.white,
          //         boxShadow: [
          //           BoxShadow(
          //               blurRadius: 5,
          //               offset: Offset(0, 0),
          //               color: Color(0x26000000))
          //         ]),
          //     child: Stack(
          //       children: [
          //         Container(
          //           padding: EdgeInsets.all(8),
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             shape: BoxShape.circle,
          //             border: Border.all(
          //                 width: 0.5,
          //                 color: Color(0xFF929292).withOpacity(0.37)),
          //             boxShadow: [
          //               BoxShadow(
          //                   blurRadius: 16,
          //                   offset: Offset(0, 0),
          //                   color: Color(0x33000000))
          //             ],
          //             image: DecorationImage(
          //                 image: AssetImage('assets/img/hotKesh/addIcon.png')),
          //           ),
          //         ),
          //         Positioned(
          //           top: 0,
          //           right: 85,
          //           child: GestureDetector(
          //             onTap: (){},
          //             child: Container(
          //               padding: EdgeInsets.all(9),
          //               decoration: BoxDecoration(
          //                 shape: BoxShape.circle,
          //                 color: Colors.blue,
          //               ),
          //               child: Image.asset(
          //                 'assets/img/prof/editingIcon.png',
          //                 width: 15,
          //                 height: 15,
          //               ),
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: 17),
          // Text('Загрузить аватар',textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF515151),fontSize: 16,fontWeight: FontWeight.w400)),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Подать объявление',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 10),
                Padding(
                    padding: EdgeInsets.only(left: 19.0),
                    child: Text('Выберите подрядчика',
                        style: TextStyle(
                            color: Color(0xFF515151),
                            fontSize: 16,
                            fontWeight: FontWeight.w400))),
                const SizedBox(height: 7),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return FutureBuilder<InfoContractorModel>(
                            future: futureInfoContractor,
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (snapshot.hasData) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: ListView.builder(
                                      itemCount: snapshot.data!.data!.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          onTap: () {
                                            selectContractor = snapshot
                                                .data!.data![index].name!
                                                .toString();
                                            contractorId = snapshot
                                                .data!.data![index].id!
                                                .toString();
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          title: Text(snapshot
                                              .data!.data![index].name!
                                              .toString()),
                                        );
                                      }),
                                );
                              }
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                          );
                        });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      enabled: false,
                      controller: name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: selectContractor == ''
                              ? 'Название объявления'
                              : selectContractor,
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 19.0),
                  child: Text('Срок',
                      style: TextStyle(
                          color: Color(0xFF515151),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
                const SizedBox(height: 7),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: lifeTime,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Введите срок эксплуатации',
                        hintStyle: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 19.0),
                  child: Text('Бюджет',
                      style: TextStyle(
                          color: Color(0xFF515151),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
                const SizedBox(height: 7),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: price,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Введите бюджет',
                        hintStyle: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (select == 1)
                            select = 0;
                          else
                            select = 1;
                        });
                      },
                      child: Container(
                          width: 105,
                          height: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                select == 1 ? Colors.blue : Color(0xffEDEDEF),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(FontAwesomeIcons.shoePrints,
                                  size: 18,
                                  color: select == 1
                                      ? Colors.white
                                      : Colors.black),
                              Text('Тротуар',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: select == 1
                                          ? Colors.white
                                          : Color(0xFF444444)))
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (select == 2)
                            select = 0;
                          else
                            select = 2;
                        });
                      },
                      child: Container(
                          width: 105,
                          height: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                select == 2 ? Colors.blue : Color(0xffEDEDEF),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                FontAwesomeIcons.bicycle,
                                size: 20,
                                color:
                                    select == 2 ? Colors.white : Colors.black,
                              ),
                              Text(
                                'Велодорожка',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: select == 2
                                        ? Colors.white
                                        : Color(0xFF444444)),
                              )
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (select == 3)
                            select = 0;
                          else
                            select = 3;
                        });
                      },
                      child: Container(
                          width: 105,
                          height: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                select == 3 ? Colors.blue : Color(0xffEDEDEF),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(FontAwesomeIcons.car,
                                  size: 18,
                                  color: select == 3
                                      ? Colors.white
                                      : Colors.black),
                              Text('Дорожный',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: select == 3
                                          ? Colors.white
                                          : Color(0xFF444444)))
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectStatus == 1)
                            selectStatus = 0;
                          else
                            selectStatus = 1;
                        });
                      },
                      child: Container(
                          width: 105,
                          height: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: selectStatus == 1
                                ? Colors.blue
                                : Color(0xffEDEDEF),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Планируется',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: selectStatus == 1
                                          ? Colors.white
                                          : Color(0xFF444444)))
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectStatus == 2)
                            selectStatus = 0;
                          else
                            selectStatus = 2;
                        });
                      },
                      child: Container(
                          width: 105,
                          height: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: selectStatus == 2
                                ? Colors.blue
                                : Color(0xffEDEDEF),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Ремонтируется',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: selectStatus == 2
                                        ? Colors.white
                                        : Color(0xFF444444)),
                              )
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectStatus == 3)
                            selectStatus = 0;
                          else
                            selectStatus = 3;
                        });
                      },
                      child: Container(
                          width: 105,
                          height: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: selectStatus == 3
                                ? Colors.blue
                                : Color(0xffEDEDEF),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Завершено',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: selectStatus == 3
                                          ? Colors.white
                                          : Color(0xFF444444)))
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 38),
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "${selectedDate1.day}.${selectedDate1.month}.${selectedDate1.year}",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        )),
                      ),
                    ),
                    Text('-',
                        style: TextStyle(color: Colors.blue, fontSize: 16)),
                    GestureDetector(
                      onTap: () {
                        _selectDate2(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 38),
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "${selectedDate2.day}.${selectedDate2.month}.${selectedDate2.year}",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 49),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 125,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Colors.blue)),
                        child: const Center(
                          child: Text('Отменить',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 14)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () async {
                        print('basyldy');
                        print(selectedDate1.toString() +
                            ' ' +
                            selectedDate2.toString());
                        var json = {
                          'x1': widget.adminMarkers.first.position.longitude
                              .toString(),
                          'y1': widget.adminMarkers.last.position.latitude
                              .toString(),
                          'x2': widget.adminMarkers.last.position.longitude
                              .toString(),
                          'y2': widget.adminMarkers.last.position.latitude
                              .toString(),
                          'contractor_id': contractorId,
                          'start_date': selectedDate1.year.toString() +
                              selectedDate1.month.toString() +
                              selectedDate1.day.toString(),
                          'end_date': selectedDate2.year.toString() +
                              selectedDate2.month.toString() +
                              selectedDate2.day.toString(),
                          'type': select == 1
                              ? 'sidewalk'
                              : select == 2
                                  ? 'cycle_road'
                                  : 'road',
                          'lifetime': lifeTime.text,
                          'status': selectStatus == 1
                              ? 'planned'
                              : selectStatus == 2
                                  ? 'repairing'
                                  : 'completed',
                          'price': price.text
                        };
                        bool ans2 = await AuthClient().postEditAdmin(json);
                        if (ans2 != null) {
                          Fluttertoast.showToast(
                              msg: 'Успешно добавлено!',
                              fontSize: 18,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white);
                          Navigator.pop(context);
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Вышла ошибка!',
                              fontSize: 18,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
                        }
                      },
                      /* {
                        String descriptionText =
                            name.text + 'name' + description.text;
                        var json = {
                          "description": descriptionText,
                          "price": price.text,
                          "categoryId": 1,
                          "userEmail": emailGet
                        };
                        int ans = await AuthClient().postProductAdd(json);
                        if (ans != 0) {
                          print(imageFile[0].path);
                          bool ans2 = await AuthClient()
                              .postProductPhotoAdd(imageFile[0], ans);
                          if (ans2) {
                            Fluttertoast.showToast(
                                msg: 'Успешно добавлено!',
                                fontSize: 18,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white);
                            Provider.of<SelectTabProvider>(context,
                                    listen: false)
                                .toggleSelect(Dashboard(), 0);
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Вышла ошибка!',
                                fontSize: 18,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white);
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Error!',
                              fontSize: 18,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
                        }
                      }*/
                      child: Container(
                        width: 125,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                          'Отправить',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 90),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate1)
      setState(() {
        selectedDate1 = selected;
      });
  }

  _selectDate2(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate2,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate2)
      setState(() {
        selectedDate2 = selected;
      });
  }
}
