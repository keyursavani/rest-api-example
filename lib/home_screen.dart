import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/models/user.dart';
import 'package:rest_api/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  bool user = false;
  List<User> users = [];

  // Future<void> fetchUser() async {
  //   print("Fatch User Called");
  //   const url = "https://randomuser.me/api/?results=50";
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final results = json['results'] as List<dynamic>;
  //   final transformed = results.map((e) {
  //     final name = UserName(
  //         title: e['name']['title'],
  //         first: e['name']['first'],
  //         last: e['name']['last']
  //     );
  //     return User(
  //         phone: e['phone'],
  //         email: e['email'],
  //         cell: e['cell'],
  //         gender: e['gender'],
  //         nat: e['nat'],
  //       name: name,
  //     );
  //   }).toList();
  //   setState(() {
  //     users = transformed;
  //     user = true;
  //   });
  //   print("Fetch User Completed");
  // }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest API Call"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body:  ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                final color =
                    user.gender == 'male' ? Colors.blue : Colors.green;
                return ListTile(
                  title: Text(user.fullName),
                  subtitle: Text(user.location.country),
                  // tileColor: color,
                );
              }),
          // : Align(
          //     alignment: Alignment.center,
          //     child: Center(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: const [
          //           CircularProgressIndicator(
          //             color: Colors.black45,
          //           ),
          //           SizedBox(height: 30),
          //           Text(
          //             "Loding....",
          //             style:
          //                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
        // fetchUser,
      // ),
    );
  }
// void fetchUser() async{
//   print("Fatch User Called");
//   const url = "https://randomuser.me/api/?results=50";
//   final uri = Uri.parse(url);
//   final response = await http.get(uri);
//   final body = response.body;
//   final json = jsonDecode(body);
//   setState(() {
//     users = json['results'];
//   });
//   print("Fetch User Completed");
// }
  Future<void> fetchUser() async{
    final response = await UserApi.fetchUser();
    setState(() {
      users = response;
    });
}
}
