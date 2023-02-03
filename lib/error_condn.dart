import 'package:flutter/material.dart';

class ErrorCondition extends StatelessWidget {
  ErrorCondition(this.error);
  int error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: TextButton(
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            error == -1 ?
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, color: Colors.red,size: 75.0,),
                        Text('Not connected to wifi!', style: TextStyle(fontSize: 25.0),),
                      ],
                    ),
                  ),
                )
                :
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, color: Colors.red,size: 75.0,),
                        Text('Daily limit of API calls exceeded!\nPlease try again later.', style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                )
          ],
        )
      ),
    );
  }
}
