import 'package:chat/home/home_screen.dart';
import 'package:chat/login/login_screen.dart';
import 'package:chat/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat/misc/constants.dart' as Constants;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final key = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ChatX",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: <String, WidgetBuilder> {
          Constants.Screen.LOGIN: (BuildContext context) => LoginScreen(),
          Constants.Screen.HOME: (BuildContext context) => HomeScreen()
        },
        navigatorKey: key);
  }

  @override
  void dispose() {
    //ChatRepo.getInstance().dismiss();
    super.dispose();
  }
}

/*class AppState extends State<App> {
  final key = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    //PushNotificationsHandler pushNotificationsHandler = PushNotificationsHandler(key);
    //pushNotificationsHandler.setup();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ChatX",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: LoginScreen(),
        home: SplashScreen(
          seconds: Constants.Ui.SPLASH_TIMEOUT,
          navigateAfterSeconds:    LoginScreen(),
        ),
        navigatorKey: key);
  }

  @override
  void dispose() {
    //ChatRepo.getInstance().dismiss();
    super.dispose();
  }
}*/

/*class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ChatX",
      home: ChatScreen(),
    );
  }
}*/

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() {
    // TODO: implement createState
    return ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController textController = TextEditingController();
  final List<ChatMessage> messages = <ChatMessage>[];
  bool composing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChatX"),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => messages[index],
              itemCount: messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: buildTextComposer(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    messages.forEach((message) {
      message.animationController.dispose();
    });
    super.dispose();
  }

  Widget buildTextComposer() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: textController,
                  onSubmitted: handleSubmitted,
                  onChanged: handleChange,
                  decoration:
                      InputDecoration.collapsed(hintText: 'Send a message'),
                ),
              ),
              Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: composing
                      ? () => handleSubmitted(textController.text)
                      : null,
                ),
              )
            ],
          ),
        ));
  }

  void handleChange(String text) {
    setState(() {
      composing = text.trim().isNotEmpty;
    });
  }

  void handleSubmitted(String text) {
    textController.clear();
    setState(() {
      composing = false;
    });
    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(
          duration: Duration(milliseconds: 700), vsync: this),
    );
    setState(() {
      messages.insert(0, message);
    });
    message.animationController.forward();
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  ChatMessage({this.text, this.animationController});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Text('R'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('Roman', style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
