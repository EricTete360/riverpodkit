import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpodkit/view_models/AuthViewControl.dart';
import 'package:go_router/go_router.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      body: SafeArea(
        child: LoginConsumer(),
      ),
    );
  }
}


  // return Scaffold(
  //     body: SafeArea(
  //       child: SingleChildScrollView(
  //         child: Center(
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 30),
  //             child: Form(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   TextFormField(
  //                     controller: _emailControl,                     
  //                     decoration: InputDecoration(
  //                       hintText: 'Email Address',
  //                     ),
  //                     keyboardType: TextInputType.emailAddress,
  //                     validator: (value){
  //                       if(value!.isEmpty){
  //                         return 'Enter valid email address';
  //                       }
  //                     },
  //                   ),
  //                   TextFormField(
  //                     controller: _passwordControl,
  //                     decoration: InputDecoration(
  //                       hintText: 'Password' ),
  //                       obscureText: true,
  //                       validator: (value){
  //                       if(value!.isEmpty){
  //                         return 'Valid Password must be entered';
  //                       }
  //                     },
  //                   ),
  //                   ElevatedButton(onPressed: ()=>{
  //                     // context.go('/home')
  //                     // ignore: avoid_print
  //                     print(_emailControl.text),
  //                     print(_passwordControl.text),
  //                     myauth.login(_emailControl.text, _passwordControl.text)
  //                           .then((value) {
  //                             var storage = GetStorage();
  //                             var readtoken = storage.read("MyToken");
  //                             print(readtoken);
  //                             if(readtoken != null) {
  //                               context.go('/home');
  //                             }
  //                           })
                
  //                   }, child: Text('Press here'))
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       )
  //     ),
  //   );

class LoginConsumer extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _emailControl = TextEditingController();
    final _passwordControl = TextEditingController();
    final myauth = ref.watch(authViewProvider.notifier);
    return  SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Colors.blue
                // Colors.blue[600],
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerLeft,
            ),
          ),
        ),
      );
    

  }

}