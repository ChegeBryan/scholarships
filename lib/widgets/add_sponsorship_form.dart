import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geopro/services/sponsorship.dart';

class AddSponsorshipForm extends StatefulWidget {
  final String name;
  final String description;
  final int id;

  const AddSponsorshipForm({Key key, this.name, this.description, this.id}) : super(key: key);

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
            height: 30.0,
          ),
          TextFormField(
            controller: _name,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please provide name';
              }
              return null;
            },
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: _description,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
            maxLines: null,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please provide description';
              }
              return null;
            },
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
              ),
              FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      if(_id != null) {
                        sponsorshipProvider.updateSponsorship(_name.text, _description.text, _id)
                            .then((response) {
                          if (response['status']) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Sponsorship updated'),
                              duration: const Duration(seconds: 1),
                            ));
                            Navigator.pushNamed(context, '/sponsorships');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('There was a problem updating the sponsorship'),
                              duration: const Duration(seconds: 1),
                            ));
                          }
                        });
                      }
                      else {
                        sponsorshipProvider
                            .addSponsorship(_name.text, _description.text)
                            .then((response) {
                          if (response['status']) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Sponsorship added'),
                              duration: const Duration(seconds: 1),
                            ));
                            Navigator.pushNamed(context, '/sponsorships');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('There was a problem adding the sponsorship'),
                              duration: const Duration(seconds: 1),
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
            ]
            ),
        ],
      ),
    );
  }
}
