import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


import 'model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final listP = Product.generatedList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
        ),
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey,
              child: ListView.builder(
                  itemCount: listP.length,
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding: EdgeInsets.all(5),
                        height: 150,
                        child: Row(
                          children: [
                            Expanded(
                              child: Image.asset(listP[index].img),
                              flex: 3,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listP[index].name,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Text(listP[index].rating,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            )),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.amber,
                                            ),
                                            Text(listP[index].distance,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '\$${listP[index].tPrice ?? listP[index].price}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          flex: 3,
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              MaterialButton(
                                                onPressed: () {
                                                  setState(() {
                                                    listP[index].qt > 0
                                                        ? listP[index].qt--
                                                        : listP[index].qt;

                                                    listP[index].tPrice! >=
                                                            listP[index].price
                                                        ? listP[index].tPrice =
                                                            listP[index]
                                                                    .tPrice! -
                                                                listP[index]
                                                                    .price
                                                                    .toInt()
                                                        : listP[index].tPrice;
                                                    getTotalPrice();
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                                height: 5,
                                                minWidth: 5,
                                                color: Colors.black,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text('${listP[index].qt}',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                                  setState(() {
                                                    listP[index].qt++;

                                                    listP[index].tPrice =
                                                        listP[index]
                                                                .price
                                                                .toInt() *
                                                            listP[index].qt;
                                                    getTotalPrice();
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                                height: 5,
                                                minWidth: 5,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                          flex: 7,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              flex: 5,
                            ),
                          ],
                        ),
                      )),
            ),
            flex: 7,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Charge:',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$90',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Charge:',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${totalprice}',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      'PAY ${totalprice + 90}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    color: Colors.grey,
                    minWidth: 250,
                    height: 50,
                  ),
                ],
              ),
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }

  double totalprice = 0;
  getTotalPrice() {
    double total = 0;
    listP.forEach((item) {
      total += item.tPrice ?? item.price;
    });
    setState(() {
      totalprice = total;
      print('mmmmmmmmmmmmmmmmm${totalprice}');
    });
  }

  void initState() {
    getTotalPrice();
    super.initState;
  }
}
