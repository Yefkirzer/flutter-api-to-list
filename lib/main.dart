import 'package:cnetprojects/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: User.user.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text('email:- ${User.user[index].email}'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('first name:- ${User.user[index].first_name}'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('last name:- ${User.user[index].last_name}'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('avatar:- ${User.user[index].avatar}'),
                ],
              );
            }),
      ),
    );
  }

  void get() async {
    await HttpService.getUser().then((value) {
      setState(() {
        User.user.clear();
        User.user.addAll(value);
      });
    });
  }
}
