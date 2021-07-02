import 'package:animecom/models/anime_model.dart';
import 'package:animecom/views/pre-sets.dart';
import 'package:animecom/views/widgets/textfield.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String _name, _password, _email, _phone, _birth;
    String valueChoose;
    List _genders = ['Male', 'Female', 'Non-binary'];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [darkblue2, darkblue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Center(
          child: Container(
            width: 400,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Center(
                    child: Container(
                        child: Text('Edit profile',
                            style: quicksand(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: gainsboro))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 80.0, left: 15.0, right: 15.0),
                  child: AnimeTextField(
                    icon: Icon(Icons.person),
                    type: TextInputType.name,
                    onChanged: (value) => _name = value,
                    text: 'Name',
                    labelsize: 16.0,
                    inputtextsize: 16.0,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                  child: AnimeTextField(
                    onChanged: (value) => _email = value,
                    type: TextInputType.emailAddress,
                    icon: Icon(Icons.email),
                    text: 'Email',
                    labelsize: 16.0,
                    inputtextsize: 16.0,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                  child: AnimeTextField(
                    type: TextInputType.visiblePassword,
                    onChanged: (value) => _password = value,
                    icon: Icon(Icons.vpn_key),
                    text: 'Password',
                    labelsize: 16.0,
                    inputtextsize: 16.0,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: gainsboro, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: DropdownButton(
                                underline: SizedBox(),
                                hint: Text(
                                  'Gender',
                                  style: quicksand(
                                      color: gainsboro,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                value: valueChoose,
                                dropdownColor: darkblue,
                                style: quicksand(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: darkblue),
                                onChanged: (newValue) {
                                  setState(() {
                                    valueChoose = newValue;
                                  });
                                },
                                items: _genders.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(
                                      valueItem,
                                      style: quicksand(
                                          color: gainsboro,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 10),
                        child: Container(
                          width: 207,
                          child: AnimeTextField(
                            type: TextInputType.datetime,
                            onChanged: (value) => _birth = value,
                            icon: Icon(Icons.calendar_today),
                            text: 'Birthday',
                            labelsize: 14.0,
                            inputtextsize: 14.0,
                            obscureText: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                  child: AnimeTextField(
                    onChanged: (value) => _phone = value,
                    type: TextInputType.phone,
                    icon: Icon(Icons.phone),
                    text: 'Phone number',
                    labelsize: 16.0,
                    inputtextsize: 16.0,
                    obscureText: true,
                  ),
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0XFFDAE2E7)),
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size(width / 3, 50)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Save',
                        style: quicksand(
                            fontSize: 20.0,
                            color: darkpurple,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red[400]),
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size(width / 2, 50)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: quicksand(
                            fontSize: 20.0,
                            color: darkpurple,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
