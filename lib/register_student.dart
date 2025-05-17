// import 'package:flutter/material.dart';

// class RegisterStudent extends StatefulWidget {
//   const RegisterStudent({super.key});

//   @override
//   State<RegisterStudent> createState() => _RegisterStudentState();
// }

// class _RegisterStudentState extends State<RegisterStudent> {
//   String? selectedTeacher;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Image.asset("assets/image/logo.png"),
//         title: Text("Register Student"),
//         backgroundColor: Colors.purple,
//       ),
//       backgroundColor: Colors.amber,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextField(
//             decoration: InputDecoration(
//               prefix: Icon(Icons.person),
//               label: Text("Name"),
//               hintText: "Enter name of Student",
//                border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: Colors.deepPurpleAccent)
//                   ),
//             ),
//           ),
//           SizedBox(height: 20,),
//           TextField(
//             decoration: InputDecoration(
//               prefix: Icon(Icons.badge),
//               label: Text("Gcard Number"),
//               hintText: "Enter Gcard Number",
//                border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: Colors.deepPurpleAccent)
//                   ),
//             ),
//           ),
//           SizedBox(height: 20,),
//           TextField(
//             decoration: InputDecoration(
//               prefix: Icon(Icons.school),
//               label: Text("Course"),
//               hintText: "Enter Course of Student",
//                border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: Colors.deepPurpleAccent)
//                   ),
//             ),
//           ),
//           SizedBox(height: 20,),
//           DropdownButtonFormField<String>(
//             value: selectedTeacher,
//             onChanged: (value) {
//               selectedTeacher = value;
//               // If in a stateful widget, call setState(() => selectedTeacher = value);
//             },
//             items: ['Mr. John', 'Ms. Alice', 'Dr. Smith'].map((teacher) {
//               return DropdownMenuItem(
//                 value: teacher,
//                 child: Text(teacher),
//               );
//             }).toList(),
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.person),
//               labelText: 'Teacher name',
//               hintText: 'Select name of Teacher',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(color: Colors.deepPurpleAccent),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           // i Wnat to add time slot here
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/homescreen.dart';  // Add intl package to format dates

class RegisterStudent extends StatefulWidget {
  const RegisterStudent({super.key});

  @override
  State<RegisterStudent> createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  String? selectedTeacher;

  final List<String> leftDays = ['Monday', 'Wednesday', 'Friday'];
  final List<String> rightDays = ['Tuesday', 'Thursday', 'Saturday'];

  final List<String> slots = ['9-11', '11-1', '1-3', '3-5'];

  Map<String, Map<String, bool>> selectedSlots = {};

  DateTime? startDate;
  DateTime? endDate;

  final dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();

    for (var day in [...leftDays, ...rightDays]) {
      selectedSlots[day] = {};
      for (var slot in slots) {
        selectedSlots[day]![slot] = false;
      }
    }
  }

  Future<void> pickDate({required bool isStart}) async {
    final initialDate = isStart ? (startDate ?? DateTime.now()) : (endDate ?? DateTime.now());
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (newDate != null) {
      setState(() {
        if (isStart) {
          startDate = newDate;
          // Optional: Automatically set endDate after startDate if null or before startDate
          if (endDate == null || endDate!.isBefore(newDate)) {
            endDate = newDate.add(Duration(days: 1));
          }
        } else {
          endDate = newDate;
          // Optional: Prevent endDate before startDate
          if (startDate != null && endDate!.isBefore(startDate!)) {
            startDate = endDate!.subtract(Duration(days: 1));
          }
        }
      });
    }
  }

  Widget dayColumn(List<String> daysList) {
    return Expanded(
      child: Column(
        children: daysList.map((day) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                title: Text(day, style: TextStyle(fontWeight: FontWeight.bold)),
                children: slots.map((slot) {
                  return CheckboxListTile(
                    title: Text(slot),
                    value: selectedSlots[day]?[slot] ?? false,
                    onChanged: (val) {
                      setState(() {
                        if (selectedSlots[day] != null) {
                          selectedSlots[day]![slot] = val!;
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
           onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homescreen()),
                  );
                },
                child: Image.asset("assets/image/logo.png"),
        ),
        title: Text("Register Student"),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Name",
                hintText: "Enter name of Student",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.badge),
                labelText: "Gcard Number",
                hintText: "Enter Gcard Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.school),
                labelText: "Course",
                hintText: "Enter Course of Student",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                ),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedTeacher,
              onChanged: (value) {
                setState(() {
                  selectedTeacher = value;
                });
              },
              items: ['Joel Scaria Justine','Rejath Chandran'].map((teacher) {
                return DropdownMenuItem(
                  value: teacher,
                  child: Text(teacher),
                );
              }).toList(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Teacher name',
                hintText: 'Select name of Teacher',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Start Date picker
            GestureDetector(
              onTap: () => pickDate(isStart: true),
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.date_range),
                    labelText: "Course Start Date",
                    hintText: "Select start date",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                    ),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  controller: TextEditingController(
                      text: startDate != null ? dateFormat.format(startDate!) : ''),
                ),
              ),
            ),

            SizedBox(height: 20),

            // End Date picker
            GestureDetector(
              onTap: () => pickDate(isStart: false),
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.date_range),
                    labelText: "Course End Date",
                    hintText: "Select end date",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepPurpleAccent),
                    ),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  controller: TextEditingController(
                      text: endDate != null ? dateFormat.format(endDate!) : ''),
                ),
              ),
            ),

            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Time Slots:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 10),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dayColumn(leftDays),
                dayColumn(rightDays),
              ],
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Example submit logic:
                print("Selected Teacher: $selectedTeacher");
                print("Course Start Date: ${startDate != null ? dateFormat.format(startDate!) : 'Not selected'}");
                print("Course End Date: ${endDate != null ? dateFormat.format(endDate!) : 'Not selected'}");
                print("Selected Time Slots:");
                selectedSlots.forEach((day, slotsMap) {
                  slotsMap.forEach((slot, isSelected) {
                    if (isSelected) {
                      print("$day: $slot");
                    }
                  });
                });
              },
              child: Text("Register Student"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
