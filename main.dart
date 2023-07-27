import 'dart:io';
import 'clientSide.dart';
import 'adminSide.dart';

void main() {
  print("");
  print("*** Welcome to H&H Restaurant ***");
  print("");
  mainMenu();
}

// Main Menu
void mainMenu() {
  String? isAdmin;
  var options;
  print(
      "Do you want to login as ADMIN?\nPress Y to login, or press any key to skip and continue as Customer/Guest");
  isAdmin = stdin.readLineSync();
  if (isAdmin == "y" || isAdmin == "Y") {
    var userName, password;
    print("Enter Username: ");
    userName = stdin.readLineSync();
    print("Enter Password: ");
    password = stdin.readLineSync();
    if (userName == credentials["username"] &&
        password == credentials["password"]) {
      adminPanel();
    } else {
      print('');
      print("Incorrect credentials please try again!");
      mainMenu();
    }
  } else {
    print("guest/customer");
    print("Select from the given options: ");
    print(
        "1. Table Reservation\n2. Menu & Pricing\n3. Order Placement\n4. Leave review\n5. Exit");
    options = stdin.readLineSync();
    if (options == "1") {
      clientSideReservation();
    } else {
      if (options == "2") {
        clientMenu();
      } else if (options == "3") {
        placeOrder();
      } else if (options == "4") {
        customerReviews();
      } else if (options == "5") {
        exit(0);
      } else {
        print("");
        print("Incorrect Option, try again");
        mainMenu();
      }
    }
  }
}

// For Viewing Menu is Client and Admin Side
void viewMenu() {
  if (menuItems.isEmpty) {
    print("Menu is empty.");
  } else {
    print("");
    print("*** Menu Items ***");
    menuItems.forEach((dish, price) {
      print("$dish - ${price.toStringAsFixed(2)} PKR");
    });
  }
}
