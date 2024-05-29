// ignore_for_file: prefer_const_constructors 
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_if_null_operators
// ignore_for_file: prefer_typing_uninitialized_variables
// ignore_for_file: unused_import
// ignore_for_file: avoid_returning_null_for_void
// ignore_for_file:


//imports
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:methodaes/algorithm.dart';

class MethodAES extends StatefulWidget {
  const MethodAES({super.key});

  @override
  State<MethodAES> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MethodAES> {

  @override
  void initState() {
    super.initState();
  }

  TextEditingController tec = TextEditingController();
  var encryptedText, plainText;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      //app bar
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Encryption / Decryption",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      //body
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 400,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blueGrey[200],
                ),
                child: TextField(
                  controller: tec,
                  maxLength: 55,
                  decoration: InputDecoration(
                    hintText: "",
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Inserted Text",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                plainText == null ? "-----" : plainText,
              ),
            ),
            SizedBox(height: 5,),
            Text(
              "Encrypted text",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                encryptedText == null ? "----" : encryptedText is encrypt.Encrypted ? encryptedText.base64 : encryptedText,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    plainText = tec.text;
                    setState(() {
                      encryptedText = Encryption.encryptAES(plainText);
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:  Colors.grey[400],
                    ),
                    child: Center(
                      child: Text(
                        "Encrypt",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 100,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      encryptedText = Encryption.decryptAES(encryptedText);  
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:  Colors.grey[400],
                    ),
                    child: Center(
                      child: Text(
                        "Decrypt",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}