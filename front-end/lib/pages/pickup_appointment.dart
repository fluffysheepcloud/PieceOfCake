import 'package:flutter/material.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pickup Appointment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PickupAppointment(),
    );
  }
}

class PickupAppointment extends StatefulWidget {
  const PickupAppointment({Key? key}) : super(key: key);

  @override
  _PickupAppointmentState createState()
  {
    return _PickupAppointmentState();
  }
}

class _PickupAppointmentState extends State<PickupAppointment> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Schedule Pickup Appointment'),
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold),
        backgroundColor: Colors.brown[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text("Choose Date"),
            ),
            Text("${selectedDate.month}/${selectedDate.day}/${selectedDate.year}"),
            ElevatedButton(
              onPressed: () {
                _selectTime(context);
              },
              child: Text("Choose Time"),
            ),
            Text(selectedTime.hourOfPeriod.toString().padLeft(2, '0')
                + ' : '
                + selectedTime.minute.toString().padLeft(2, '0')
                + ' '
                + selectedTime.period.name.toUpperCase()),

            TextButton(
              style: TextButton.styleFrom
                (backgroundColor: Colors.brown[700]),
              onPressed: () {},
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }}
}