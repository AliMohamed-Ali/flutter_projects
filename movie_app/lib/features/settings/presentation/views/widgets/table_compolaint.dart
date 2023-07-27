import 'package:flutter/material.dart';

import '../../../data/model/complaint_model.dart';
import 'complain_table_row.dart';

class TableOfComplaint extends StatelessWidget {
  const TableOfComplaint({Key? key, required this.complaintsList})
      : super(key: key);

  final List<ComplaintData> complaintsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              Expanded(
                child: Text('Email',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Expanded(
                  child: Text('Complaint',
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
        ),
        ...complaintsList.map((complaintData) {
          return ComplaintTableRow(
            name: complaintData.name,
            email: complaintData.email,
            complaint: complaintData.complaint,
          );
        }).toList(),
      ],
    );
  }
}
