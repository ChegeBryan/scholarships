import 'package:flutter/material.dart';
import 'package:geopro/application_details.dart';
import 'package:geopro/services/application.dart';
import 'package:provider/provider.dart';

class ApplicationForm extends StatefulWidget {
  final String name;
  final int sponsorshipId;

  const ApplicationForm({
    Key key,
    this.name,
    this.sponsorshipId,
  }) : super(key: key);

  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;

  void _showApplicationDetails(BuildContext context, data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApplicationDetails(data: data),
        fullscreenDialog: true,
      ),
    );
  }

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
  void dispose() {
    // clean controller when widget is removed from the widget tree
    _firstName.dispose();
    _lastName.dispose();
    _mobile.dispose();
    _country.dispose();
    _city.dispose();
    _schoolName.dispose();
    _degree.dispose();
    _coverLetter.dispose();
    _start.dispose();
    _to.dispose();
    _postalCode.dispose();
    _birthCertificate.dispose();
    _nationalId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ApplicationProvider application = Provider.of<ApplicationProvider>(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        autovalidate: _autovalidate,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Sponsporship',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 2.0,
                fontSize: 16.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Column(children: <Widget>[]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Contact Details',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'School Details',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(),
                ],
              ),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Documents Upload',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(),
                ],
              ),
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
              height: 16.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Future<Map<String, dynamic>> response =
                        application.addApplication(
                            sponsorshipId: widget.sponsorshipId.toString(),
                            firstName: _firstName.text,
                            lastName: _lastName.text,
                            country: _country.text,
                            city: _city.text,
                            postalCode: _postalCode.text,
                            mobile: _mobile.text,
                            schoolName: _schoolName.text,
                            degree: _degree.text,
                            start: _start.text,
                            to: _to.text,
                            birthCertificate: _birthCertificate.text,
                            nationalId: _nationalId.text,
                            coverLetter: _coverLetter.text);
                    response.then((res) {
                      if (res['status']) {
                        _showApplicationDetails(context, res['data']);
                      } else {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                              content: Text(res['errors'][0]),
                              backgroundColor: Colors.red),
                        );
                      }
                    });
                  } else {
                    setState(() {
                      _autovalidate = true;
                    });
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
