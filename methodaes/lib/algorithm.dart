// ignore_for_file: avoid_print

import 'package:encrypt/encrypt.dart' as encrypt;

class Encryption {

  //encription
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  static encryptAES(text) {
    final encrypted = encrypter.encrypt(text, iv: iv);

    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);

    return encrypted;
  }
  //decryption
  static decryptAES(text) {
    final decrypted = encrypter.decrypt(text, iv: iv);

    return decrypted;
  }
}