//import 'package:car_catalogue/app/modules/payment/views/payment_view.dart';
import 'package:flutter/material.dart';

//import 'package:get/get.dart';

//import '../controllers/car_detail_controller.dart';

class CarDetailView extends GetView<CarDetailController> {
  CarDetailView({Key? key}) : super(key: key);

  @override
  final Map<String, dynamic> arguments = Get.arguments;

  late String title = arguments['title'];
  late String subtitle = arguments['subtitle'];
  late String description = arguments['description'];
  late String imageUrl = arguments['imageUrl'];
  late String model = arguments['model'];
  late String price = arguments['price'];
  Widget build(BuildContext context) {
    void _presentDatePicker() {
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2024))
          .then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
      });
    }

    void appoint() {
      showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: Card(
              child: Container(
                // height: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Book Your Appointment Now',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Text(
                              'Choose Your Date',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                                onPressed: () {
                                  _presentDatePicker();
                                },
                                icon: Icon(
                                  Icons.date_range_outlined,
                                  size: 30,
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Text(
                              'Choose Your Convient Time',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                                onPressed: () {
                                  showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context);
                                },
                                icon: Icon(
                                  Icons.timer_sharp,
                                  size: 30,
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => PaymentView());
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        child: Center(
                          child: Text(
                            'Payment',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            appoint();
          },
          label: Text('Book An Appointment'),
          icon: Icon(Icons.car_repair),
        ),
        body: Column(
          children: [
            Image.asset(imageUrl),
            SizedBox(
              height: 25,
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Car Description :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  description,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Model : ${model}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Price : ${price}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
