import 'package:chatination/services/auth.dart';
import 'package:chatination/views/chatRoomsScreen.dart';
import 'package:chatination/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {

  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();

  TextEditingController userNameTextEditingControler =
      new TextEditingController();
  TextEditingController emailTextEditingControler = new TextEditingController();
  TextEditingController passwordTextEditingControler =
      new TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()){
       setState(() {
         isLoading = true;
       });

        authMethods.signUpwithEmailAndPassword(emailTextEditingControler.text, passwordTextEditingControler.text).then((val){
         // print("${val.uid}");

          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => ChatRoom()
            
            ));


        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarMain(context),
      body: isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(
            
          ),
        ),
      ) : SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: formKey,
                  child: new Column(
                    children: [
                      new TextFormField(
                          validator: (val) {
                            return val.isEmpty || val.length < 3 ? 'Please provide a valid username' : null ;
                          },
                          controller: userNameTextEditingControler,
                          decoration: textFieldInputDecoration("Username"),
                          style: simpleTextStyle()),
                      new TextFormField(
                        validator: (val){
                          return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val) ? null : "Please provide a valid emailid";
                        },
                          controller: emailTextEditingControler,
                          decoration: textFieldInputDecoration("Email"),
                          style: simpleTextStyle()),
                      new TextFormField(
                        obscureText: true,
                        validator: (val){
                          return val.length > 6 ? null : "Please provide password 6+ character";
                        },
                          controller: passwordTextEditingControler,
                          decoration: textFieldInputDecoration("Password"),
                          style: simpleTextStyle()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: new Text(
                      'Forgot Password?',
                      style: simpleTextStyle(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: (){
                     signMeUp();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0xff007ef4),
                          const Color(0xff2a75bc)
                        ]),
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    'Sign Un with Google',
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text(
                      "Already have account? ",
                      style: mediumTextStyle(),
                    ),
                    GestureDetector(
                        onTap: (){
                          widget.toggle();
                        },
                        child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: new Text(
                          "Sign In now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
