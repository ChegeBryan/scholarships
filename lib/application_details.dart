import 'package:flutter/material.dart';
import 'package:geopro/widgets/application_detail_info.dart';

class ApplicationDetails extends StatelessWidget {
  final Map<String, dynamic> data;

  const ApplicationDetails({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ApplicationDetailInfo(
                detailFor: 'Sponsorship',
                detailText: data['sponsorship_name'],
              ),
              Divider(),
              ApplicationDetailInfo(
                detailFor: 'Student Name',
                detailText: data['student'],
              ),
              ApplicationDetailInfo(
                detailFor: 'Mobile',
                detailText: data['mobile'],
              ),
              ApplicationDetailInfo(
                detailFor: 'Country',
                detailText: data['country'],
              ),
              ApplicationDetailInfo(
                detailFor: 'City',
                detailText: data['city'],
              ),
              ApplicationDetailInfo(
                detailFor: 'Postal Code',
                detailText: data['postal_code'],
              ),
              Divider(),
              ApplicationDetailInfo(
                detailFor: 'School Name',
                detailText: data['school_name'],
              ),
              ApplicationDetailInfo(
                detailFor: 'Degree',
                detailText: data['degree'],
              ),
              ApplicationDetailInfo(
                detailFor: 'Start Year',
                detailText: data['start'].toString(),
              ),
              ApplicationDetailInfo(
                detailFor: 'End Year',
                detailText: data['to'].toString(),
              ),
              Divider(),
              Text(
                'Birth Certificate',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(data['birth_certificate']),
              Text(
                'National Id',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(data['national_id']),
              Text(
                'Cover Letter',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(data['cover_letter']),
              Divider(),
              ApplicationDetailInfo(
                detailFor: 'Status',
                detailText: data['is_approved'] ? 'Approved' : 'Rejected',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
