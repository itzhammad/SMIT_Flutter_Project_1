import 'dart:io';
import 'clientSide.dart';
import 'main.dart';

// Admin Side

Map<String, String> credentials = {"username": "admin", "password": "123"};
void adminPanel() {
  while (true) {
    print("\nWhat would you like to do?");
    print("1. Check Reservations");
    print("2. Edit Menu");
    print("3. View Total Orders Placed");
    print("4. View Payment/Sales");
    print("5. View Customer Reviews");
    print("6. Return to Main Menu");
    print("7. Exit");
    var opt = stdin.readLineSync();
    if (opt == "1") {
      adminSideReservation();
    } else if (opt == "2") {
      adminMenuManagement();
    } else if (opt == "3") {
      adminViewOrders();
    } else if (opt == "4") {
      adminViewPayments();
    } else if (opt == "5") {
      adminViewReviews();
    } else if (opt == "6") {
      mainMenu();
    } else if (opt == "7") {
      exit(0);
    }
  }
}

// View Reservations
void adminSideReservation() {
  while (true) {
    print("\nWhat would you like to do?");
    print("1. View Reservations");
    print("2. Return to Admin Menu");
    var opt = stdin.readLineSync();
    int counter = 1;
    print("");
    if (opt == "1") {
      if (reservationsList.isEmpty) {
        print("No Reservations");
      } else {
        for (var item in reservationsList) {
          print(
              "${counter++}. ${item["customerName"]} - Date & Time: ${item["date"]} ${item["time"]}");
        }
      }
    } else if (opt == "2") {
      adminPanel();
    }
  }
}

Map<String, double> menuItems = {
  "biryani": 300,
  "chicken karahi": 800,
  "salad": 100
};

// Admi can edit Restaurant's Menu
void adminMenuManagement() {
  while (true) {
    print("\nWhat would you like to do?");
    print("1. Add a new dish");
    print("2. Remove a dish");
    print("3. Update a dish price");
    print("4. View the menu");
    print("5. Return to Admin Menu");

    String choice = stdin.readLineSync() ?? '';
    switch (choice) {
      case '1':
        print("Enter the dish name:");
        String name = stdin.readLineSync() ?? '';
        print("Enter the dish price:");
        double price = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
        addDish(name, price);
        break;
      case '2':
        print("Enter the dish name to remove:");
        String name = stdin.readLineSync() ?? '';
        removeDish(name);
        break;
      case '3':
        print("Enter the dish name to update:");
        String name = stdin.readLineSync() ?? '';
        print("Enter the new dish price:");
        double newPrice = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
        updateDish(name, newPrice);
        break;
      case '4':
        viewMenu();
        break;
      case '5':
        adminPanel();
        return;
      default:
        print("Invalid choice. Please try again.");
        break;
    }
  }
}

void addDish(String name, double price) {
  menuItems[name] = price;
}

void removeDish(String name) {
  menuItems.remove(name);
}

void updateDish(String name, double newPrice) {
  if (menuItems.containsKey(name)) {
    menuItems[name] = newPrice;
    print("Dish '$name' updated successfully.");
  } else {
    print("Dish '$name' not found in the menu.");
  }
}

void adminViewOrders() {
  print("*** Total Orders ***");
  while (true) {
    print("\nWhat would you like to do?");
    print("1. View Orders");
    print("2. Return to Admin Menu");
    var opt = stdin.readLineSync();
    int counter = 1;
    print("");
    if (opt == "1") {
      for (var item in customerOrder) {
        print(
            "${counter++}. Customer Name: ${item[0]}\nItems: ${item[1]}\nTotal Bill: ${item[2]}");
      }
    } else if (opt == "2") {
      adminPanel();
    }
  }
}

void adminViewPayments() {
  print("");
  print("*** Total Payments ***");
  while (true) {
    print("\nWhat would you like to do?");
    print("1. View Payments");
    print("2. Return to Admin Menu");
    var opt = stdin.readLineSync();
    int counter = 1;
    print("");
    if (opt == "1") {
      num totalSales = 0.0;
      for (var item in displayPayment) {
        print("${counter++}. ${item}}");
        totalSales += item['bill'];
      }
      print("");
      print("Total Sales: $totalSales PKR");
    } else if (opt == "2") {
      adminPanel();
    }
  }
}

adminViewReviews() {
  print("");
  print("*** Customer Reviews ***");
  while (true) {
    print("\nWhat would you like to do?");
    print("1. View Reviews");
    print("2. Return to Admin Menu");
    var opt = stdin.readLineSync();
    int counter = 1;
    print("");
    if (opt == "1") {
      for (var item in reviews) {
        print(
            "${counter++}. Customer Name: ${item['customerName']} -- Review: ${item['comment']}");
      }
    } else if (opt == "2") {
      print("");
      adminPanel();
    }
  }
}
