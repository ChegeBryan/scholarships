import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geopro/services/sponsorship.dart';

class AddSponsorshipForm extends StatefulWidget {
  final String name;
  final String description;
  final int id;

  AddSponsorshipForm({Key key, this.name, this.description, this.id})
      : super(key: key);

  @override
  _AddSponsorshipFormState createState() => _AddSponsorshipFormState();
}

class _AddSponsorshipFormState extends State<AddSponsorshipForm> {
  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;

  TextEditingController _name;
  TextEditingController _description;
  int _id;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.name);
    _description = TextEditingController(text: widget.description);
    _id = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    SponsorshipProvider sponsorshipProvider =
        Provider.of<SponsorshipProvider>(context);

    return Form(
      key: _formKey,
      autovalidate: _autovalidate,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Material(
            elevation: 6.0,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(3.0),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              controller: _name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Name',
                contentPadding: EdgeInsets.all(12.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide name';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Material(
            elevation: 6.0,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(3.0),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              controller: _description,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Description',
                contentPadding: EdgeInsets.all(12.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              maxLines: null,
              minLines: 3,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide description';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            sponsorshipProvider.addedStatus == Status.Adding ||
                    sponsorshipProvider.updatedStatus == Status.Updating
                ? CircularProgressIndicator()
                : FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        if (_id != null) {
                          sponsorshipProvider
                              .updateSponsorship(
                                  _name.text, _description.text, _id)
                              .then((response) {
                            if (response['status']) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Sponsorship updated'),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.red,
                              ));
                              Navigator.pushNamed(
                                  context, '/manage/sponsorships');
                            } else {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(response['message']["name"][0]),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.red,
                              ));
                            }
                          });
                        } else {
                          sponsorshipProvider
                              .addSponsorship(_name.text, _description.text)
                              .then((response) {
                            if (response['status']) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Sponsorship added'),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.red,
                              ));
                              Navigator.pushNamed(
                                  context, '/manage/sponsorships');
                            } else {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(response['message']["name"][0]),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.red,
                              ));
                            }
                          });
                        }
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
          ]),
        ],
      ),
    );
  }
}
