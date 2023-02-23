import 'package:flutter/material.dart';
import 'package:mgv6app/src/models/BalanceModel.dart';
import 'package:mgv6app/src/pages/product_page.dart';
import 'package:mgv6app/src/services/http_services.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _id = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Balança MGV6-PRIX",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    return value!.isEmpty
                        ? "É necessário digitar o código do produto."
                        : null;
                  },
                  controller: _id,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Digite aqui o código do produto",
                    prefixIcon: Icon(
                      Icons.search,
                      size: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _formKey.currentState!.validate()
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ScreenMain(_id.text))))
                        : null;
                  },
                  label: const Text(
                    "Consultar",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),

              //Status balances.
              FutureBuilder(
                future: HttpServices.getBalances(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.count(
                      crossAxisCount: 5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      children: List.generate(
                        snapshot.data!.length,
                        (index) {
                          //Constructor balances
                          final balances =
                              BalanceModel.fromJson(snapshot.data![index]);

                          return Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.signal_wifi_4_bar,
                                  color: balances.status == 1
                                      ? Colors.blue
                                      : balances.status == 2
                                          ? Colors.orange
                                          : Colors.red,
                                ),
                                Text("${balances.id}")
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Padding(
            padding: EdgeInsets.all(18),
            child: Text("Release 1.02"),
          )
        ],
      ),
    );
  }
}
