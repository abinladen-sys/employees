import 'dart:io';

void main() {
  List<Employee> employers = [];

  while (true) {
    print('\n===== Employee Management =====');
    print('1. Full Time Employee');
    print('2. Part Time Employee');
    print('3. Exit and show employees');

    int? number = int.tryParse(stdin.readLineSync() ?? '');

    if (number == 3) {
      break;
    }

    if (number != 1 && number != 2) {
      print('Invalid input');
      continue;
    }

    print('Name:');
    String name = stdin.readLineSync() ?? '';

    print('Department (press Enter to skip):');
    String departmentInput = stdin.readLineSync() ?? '';
    String? department = departmentInput.isEmpty ? null : departmentInput;

    if (number == 1) {
      print('Base Salary:');
      double? salary = double.tryParse(stdin.readLineSync() ?? '');

      print('Bonus:');
      double? bonus = double.tryParse(stdin.readLineSync() ?? '');

      if (salary == null || bonus == null) {
        print('Invalid salary or bonus');
        continue;
      }

      Employee employee = FullTimeEmployee(name, salary, department, bonus);

      employers.add(employee);
      print('Employee added successfully!');
    } else if (number == 2) {
      print('Hours Worked:');
      int? hoursWorked = int.tryParse(stdin.readLineSync() ?? '');

      print('Hourly Rate:');
      double? hourlyRate = double.tryParse(stdin.readLineSync() ?? '');

      if (hoursWorked == null || hourlyRate == null) {
        print('Invalid hours or hourly rate');
        continue;
      }

      Employee employee = PartTimeEmployee(
        name,
        department,
        hoursWorked,
        hourlyRate,
      );

      employers.add(employee);
      print('Employee added successfully!');
    }
  }

  print('\n========== All Employees ==========');

  if (employers.isEmpty) {
    print('No employees added.');
  } else {
    for (int i = 0; i < employers.length; i++) {
      print('\n========== Employee ${i + 1} ==========');
      employers[i].displayInfo();
    }
  }
}

abstract class Employee {
  String name;
  double salary;
  String? department;

  Employee(this.name, this.salary, this.department);

  void displayInfo();
}

class FullTimeEmployee extends Employee {
  double bonus;

  FullTimeEmployee(super.name, super.salary, super.department, this.bonus);

  @override
  void displayInfo() {
    print('Name: $name');
    print('Type: Full Time');
    print('Department: ${department ?? "Not assigned"}');
    print('Base Salary: $salary');
    print('Bonus: $bonus');
    print('Total Salary: ${salary + bonus}');
  }
}

class PartTimeEmployee extends Employee {
  int hoursWorked;
  double hourlyRate;

  PartTimeEmployee(
    String name,
    String? department,
    this.hoursWorked,
    this.hourlyRate,
  ) : super(name, hoursWorked * hourlyRate, department);

  @override
  void displayInfo() {
    print('Name: $name');
    print('Type: Part Time');
    print('Department: ${department ?? "Not assigned"}');
    print('Hours Worked: $hoursWorked');
    print('Hourly Rate: $hourlyRate');
    print('Total Salary: $salary');
  }

  //publish
}
