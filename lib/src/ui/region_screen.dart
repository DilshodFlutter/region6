import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:region6/src/model/region_model.dart';

class RegionScreen extends StatefulWidget {
  const RegionScreen({Key? key}) : super(key: key);

  @override
  State<RegionScreen> createState() => _RegionScreenState();
}

class _RegionScreenState extends State<RegionScreen> {
  List<RegionModel> data = [];

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(data[index].name),
                        ListView.builder(
                          shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data[index].childs.length,
                            itemBuilder: (context, position) {
                              return Text(
                                  data[index].childs[position].id.toString());
                            }
                        )
                      ],//akakakakak
                    );
                  }))
        ],
      ),
    );
  }

  void _getData() async {
    String url =
        "https://api.osonapteka.uz/api/v1/regions?lan=uz&user=4ec8cc4ef07d43e6";
    print(url);
    http.Response response = await http.get(Uri.parse(url));
    print(response.body);
    data = regionModelFromJson(response.body);
    setState(() {});
  }
}
//akakkakaka