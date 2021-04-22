import 'package:flutter/material.dart';
import 'package:med_app/Styles/colors.dart';
import 'package:med_app/Widgets/doctor_card.dart';
import 'package:med_app/models/patient.dart';
import 'package:med_app/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpecialityPage extends StatefulWidget {
  SpecialityPage({Key key, this.speciality}) : super(key: key);

  final String speciality;
  @override
  _SpecialityPageState createState() => _SpecialityPageState();
}

class _SpecialityPageState extends State<SpecialityPage> {
  String id;
  Patient patient;

  @override
  void initState() {
    AppProvider provider = Provider.of<AppProvider>(context, listen: false);
    provider.getUserType(provider.userId);
    patient = provider.patient;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: ColorsCollection.mainColor,
          title: Text(widget.speciality),
        ),
        body: ChangeNotifierProvider<AppProvider>(
          create: (context) => AppProvider(speciality: widget.speciality),
          child: Consumer<AppProvider>(
            builder: (context, databaseProvider, _) {
              return (databaseProvider.doctors != null)
                  ? ListView.builder(
                      itemCount: databaseProvider.doctors.length,
                      itemBuilder: (ctx, index) {
                        final doctor = databaseProvider.doctors[index];
                        return DoctorCard(doctor: doctor, patient: patient);
                      })
                  : Center(
                      child: Text(
                        "Sorry There are no Doctors Right Now",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    );
            },
          ),
        ));
  }
}
