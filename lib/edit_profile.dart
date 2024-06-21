

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = '/editProfile';

  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final _emailController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _phoneController = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'TR');
  String initialCountry = 'TR';

  late ImagePicker picker;
  XFile? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedImage;
    });
  }

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _phoneFocusNode = FocusNode();

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // +90 Türkiye kodu ile başlat
    _phoneController.text = '+90';
    picker = ImagePicker();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen e-posta adresinizi girin';
    }
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'E-posta adresiniz hatalı';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () async {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.chevron_left_rounded,
              color: Colors.grey[600],
              size: 32,
            ),
          ),
          title: Text(
            'Profili Düzenle',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Lexend',
                letterSpacing: 0,
                color: Colors.black54),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Container(
                        width: 80,
                        height: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: _imageFile != null
                            ? ClipOval(
                          child: Image.file(
                            File(_imageFile!.path),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Image.asset('assets/images/avatar.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Resim Seç"),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      GestureDetector(
                                        child: Text("Galeriden Seç"),
                                        onTap: () {
                                          _pickImage(ImageSource.gallery);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      Padding(padding: EdgeInsets.all(8.0)),
                                      GestureDetector(
                                        child: Text("Kameradan Çek"),
                                        onTap: () {
                                          _pickImage(ImageSource.camera);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                    child: Text(
                      'Fotoğrafı değiştir',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Lexend',
                        letterSpacing: 0,
                      ),
                    ),
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lexend',
                          letterSpacing: 0,
                        ),
                      ),
                      elevation: MaterialStateProperty.all(0),
                      side: MaterialStateProperty.all(
                        BorderSide(
                          color: Colors.grey[600]!,
                          width: 2,
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              labelText: 'Ad',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: EdgeInsets.all(20),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen adınızı giriniz';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: 'Telefon',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: EdgeInsets.all(20),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen telefon numaranızı giriniz';
                              }
                              if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                                return 'Telefon Numarası Geçersiz';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'E-posta',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: EdgeInsets.all(20),
                            ),
                            validator:validateEmail,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Form valid, process data
                              }
                            },
                            child: Text('Değişiklikleri Kaydet'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                              minimumSize: const Size(252, 50),
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )));
  }
}