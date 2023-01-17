import 'package:flutter/material.dart';
import '../screens/student_perfomance.dart';
import '../widgets/helpers.dart';

class StudentRecord extends StatefulWidget {
  static const routeName = '/std-record';
  const StudentRecord({Key? key}) : super(key: key);

  @override
  State<StudentRecord> createState() => _StudentRecordState();
}

class _StudentRecordState extends State<StudentRecord> {
  final text = CustomTexts();
  Widget _buildColumnText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        fontFamily: 'PT_Sans',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'STUDENT RECORD',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                    StudentPerformance.routeName,
                  ),
                  child: DataTable(columns: [
                    DataColumn(label: _buildColumnText(text.sn)),
                    DataColumn(label: _buildColumnText(text.stdName)),
                    DataColumn(label: _buildColumnText(text.stdName)),
                    DataColumn(label: _buildColumnText(text.stdName)),
                    DataColumn(label: _buildColumnText(text.stdId)),
                    DataColumn(label: _buildColumnText(text.level)),
                    DataColumn(label: _buildColumnText(text.sex)),
                    DataColumn(label: _buildColumnText(text.age)),
                    DataColumn(label: _buildColumnText(text.department)),
                    DataColumn(label: _buildColumnText(text.contact)),
                    DataColumn(label: _buildColumnText(text.homeAddress)),
                    DataColumn(label: _buildColumnText(text.guardianFirstName)),
                    DataColumn(label: _buildColumnText(text.guardianLastName)),
                    DataColumn(label: _buildColumnText(text.guardianContact)),
                  ], rows: [
                    DataRow(cells: [
                      DataCell(_buildColumnText("1")),
                      DataCell(_buildColumnText(text.stdName)),
                      DataCell(_buildColumnText(text.stdName)),
                      DataCell(_buildColumnText(text.stdName)),
                      DataCell(_buildColumnText(text.stdId)),
                      DataCell(_buildColumnText(text.level)),
                      DataCell(_buildColumnText(text.sex)),
                      DataCell(_buildColumnText(text.age)),
                      DataCell(_buildColumnText(text.department)),
                      DataCell(_buildColumnText(text.contact)),
                      DataCell(_buildColumnText(text.homeAddress)),
                      DataCell(_buildColumnText(text.guardianFirstName)),
                      DataCell(_buildColumnText(text.guardianLastName)),
                      DataCell(_buildColumnText(text.guardianContact)),
                    ]),
                    DataRow(cells: [
                      DataCell(_buildColumnText("2")),
                      DataCell(_buildColumnText(text.stdName)),
                      DataCell(_buildColumnText(text.stdName)),
                      DataCell(_buildColumnText(text.stdName)),
                      DataCell(_buildColumnText(text.stdId)),
                      DataCell(_buildColumnText(text.level)),
                      DataCell(_buildColumnText(text.sex)),
                      DataCell(_buildColumnText(text.age)),
                      DataCell(_buildColumnText(text.department)),
                      DataCell(_buildColumnText(text.contact)),
                      DataCell(_buildColumnText(text.homeAddress)),
                      DataCell(_buildColumnText(text.guardianFirstName)),
                      DataCell(_buildColumnText(text.guardianLastName)),
                      DataCell(_buildColumnText(text.guardianContact)),
                    ]),
                    DataRow(cells: [
                      DataCell(_buildColumnText("3")),
                      DataCell(_buildColumnText(text.stdName)),
                      DataCell(_buildColumnText(text.stdName)),
                      DataCell(_buildColumnText(text.stdName)),
                      DataCell(_buildColumnText(text.stdId)),
                      DataCell(_buildColumnText(text.level)),
                      DataCell(_buildColumnText(text.sex)),
                      DataCell(_buildColumnText(text.age)),
                      DataCell(_buildColumnText(text.department)),
                      DataCell(_buildColumnText(text.contact)),
                      DataCell(_buildColumnText(text.homeAddress)),
                      DataCell(_buildColumnText(text.guardianFirstName)),
                      DataCell(_buildColumnText(text.guardianLastName)),
                      DataCell(_buildColumnText(text.guardianContact)),
                    ])
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
