import 'package:flutter/material.dart';
import 'package:mgv6app/src/models/ProductModel.dart';
import 'package:mgv6app/src/services/http_services.dart';
import 'package:mgv6app/src/services/utils_services.dart';

class ScreenMain extends StatefulWidget {
  final String? _id;
  ScreenMain(this._id, {super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

final utilService = UtilServices();

class _ScreenMainState extends State<ScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget._id}"),
      ),
      body: FutureBuilder(
        future: HttpServices.getProductById('${widget._id}'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          //Constructor product.
          final productModel = ProductModel.fromJson(snapshot.data!);

          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(11)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 10, top: 10),
                          child: Column(
                            children: [
                              if (productModel.status == true) ...[
                                Column(
                                  children: const [
                                    Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 98,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text(
                                        "Esse produto está ativo",
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ] else ...[
                                Column(
                                  children: const [
                                    Center(
                                      child: Icon(
                                        Icons.error,
                                        size: 98,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Text(
                                        "Esse produto está desativado",
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Description.
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(11)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 12, left: 12, right: 8),
                          child: Text(
                            "Descrição do produto",
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            utilService.replaceName(productModel.name),
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 52),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Price
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(11)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 12, left: 12, right: 8),
                          child: Text(
                            "Preço",
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            "R\$ ${utilService.replacePrice(productModel.price)} KG",
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 52),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Type
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(11)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 12, left: 12, right: 8),
                          child: Text(
                            "Tipo de embalagem",
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 5, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                utilService.typeItem(productModel.type!),
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 52),
                              ),
                              productModel.type != 0
                                  ? GestureDetector(
                                      onTap: () {
                                        utilService.showAlertType(
                                            "Há um problema!",
                                            "Altere o tipo de embalagem para PESO na 2014",
                                            const Icon(
                                              Icons.error_rounded,
                                              size: 38,
                                              color: Colors.red,
                                            ),
                                            context);
                                      },
                                      child: const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                        size: 68,
                                      ),
                                    )
                                  : const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 68,
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Date and hours.
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(11)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 12, left: 12, right: 8),
                          child: Text(
                            "Data e hora da última alteração",
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            utilService.replaceUpdate(productModel.update),
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 52),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
