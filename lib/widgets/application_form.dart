import 'package:flutter/material.dart';

class ApplicationForm extends StatefulWidget {
  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;

  // form input fields controllers
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _schoolName = TextEditingController();
  final TextEditingController _degree = TextEditingController();
  final TextEditingController _coverLetter = TextEditingController();
  final TextEditingController _start = TextEditingController();
  final TextEditingController _to = TextEditingController();
  final TextEditingController _postalCode = TextEditingController();
  final TextEditingController _birthCertificate = TextEditingController();
  final TextEditingController _nationalId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        autovalidate: _autovalidate,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _firstName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide first name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _lastName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide last name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _mobile,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide phone number';
                }
                return null;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _country,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Country',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide your country';
                }
                return null;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _city,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide your city';
                }
                return null;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _postalCode,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Postal Code',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide postal code';
                }
                return null;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            Divider(),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _schoolName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'School Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide your school';
                }
                return null;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _degree,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Degree',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide degree';
                }
                return null;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Year',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextFormField(
                      controller: _start,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: 'Start',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide year';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: _to,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: 'To',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide year';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Divider(),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _coverLetter,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Cover letter',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide cover letter';
                }
                return null;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _birthCertificate,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Birth Certificate',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide birth certificate';
                }
                return null;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _nationalId,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'National Id',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide national Id';
                }
                return null;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 16.0),
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
