import 'dart:io';
import 'main.dart';
import 'adminSide.dart';

// Client Side

List reservationsList = [];
void clientSideReservation() {
  String? isInfoCorrect;
  Map<String, dynamic> reservation = {
    "customerName": "",
    "phone": "",
    "persons": "",
    "date": "",
    "time": ""
  };
  print("");
  print("*** Table Reservation ***");
  print("Enter quantity of Persons: ");
  reservation["persons"] = int.parse(stdin.readLineSync()!);
  print("Enter booking Date: ");
  reservation["date"] = stdin.readLineSync();
  print("Enter booking Time: ");
  reservation["time"] = stdin.readLineSync();
  print("Enter your Name: ");
  reservation["customerName"] = stdin.readLineSync();
  print("Enter your Phone Number: ");
  reservation["phone"] = stdin.readLineSync();
  print("");
  print(
      "is provided information correct?\nPress Y to continue or any other key to go re-enter details.");
  isInfoCorrect = stdin.readLineSync();
  if (isInfoCorrect == 'Y' || isInfoCorrect == 'y') {
    print(
        "==> Reservation for ${reservation["date"]} at ${reservation["time"]} <==\nPersons: ${reservation["persons"]}\nCustomer Name: ${reservation["customerName"]}\nPhone Number: ${reservation["customerName"]}");
    reservationsList.add(reservation);
    reservation.clear;
    print("Reservation made successfully");
    print("");
    mainMenu();
  } else {
    print("Re-enter your details: ");
    print("");
    clientSideReservation();
  }
}

void clientMenu() {
  String? menuOptions;
  while (true) {
    print(
        "Select any option from below: \n1) View Menu\n2) Return to Main Menu");
    menuOptions = stdin.readLineSync()!;
    if (menuOptions == "1") {
      print("");
      viewMenu();
    } else if (menuOptions == "2") {
      print("");
      mainMenu();
    }
  }
}

List customerOrder = [];
String? customerName;
num total = 0;
void placeOrder() {
  String dishname = "";
  num? qty;
  Map<String, num> orderItem = {};
  viewMenu();
  print("");
  print("*** Order Placement ***");
  print("Enter your name: ");
  customerName = stdin.readLineSync();
  while (dishname != "done") {
    print("\nEnter Item Name (or 'done' to finish adding items): ");
    dishname = stdin.readLineSync()!;
    if (menuItems.containsKey(dishname)) {
      print("\nEnter Quantity: ");
      qty = num.parse(stdin.readLineSync() ?? "0");
      orderItem[dishname] = qty;
      total += qty * menuItems[dishname]!;
    } else {
      print("Item not in menu");
    }
  }
  customerOrder.add([customerName, orderItem, total]);
  print(
      "==> Order for $customerName <==\nItems: $orderItem\nTotal Bill is: $total");
  payment();
}

List displayPayment = [];
Map<String, dynamic> cardCredentials = {};
void payment() {
  Map<String, dynamic> paymentDetails = {};
  paymentDetails["customerName"] = customerName;
  paymentDetails['bill'] = total;
  print("\nSelect your payment option?");
  print("1. Pay via COD");
  print("2. Pay via Card");
  print("3. Return to Main Menu");
  var option = stdin.readLineSync();
  if (option == "1") {
    print("*** You've selected Payment via COD as your payment option ***");
    print("Order Placed, your order will arrive in 30 minutes");
    paymentDetails['paymentMethod'] = "COD";
    displayPayment.add(paymentDetails);
    paymentDetails.clear;
    print("");
    mainMenu();
  } else if (option == "2") {
    paymentDetails['paymentMethod'] = "Card";
    print("*** You've selected Payment via Card as your payment option ***");
    print("Enter your card number: ");
    cardCredentials['cardNumber'] = stdin.readLineSync();
    print("Enter your card expiry (e.g 2020 9): ");
    cardCredentials['expiry'] = DateTime(
        int.parse(stdin.readLineSync()!), int.parse(stdin.readLineSync()!));
    print("Enter your CVV code: ");
    cardCredentials['cvv'] = stdin.readLineSync();
    print("* Payment Successful *");
    print("Order Placed, your order will arrive in 30 minutes");
    displayPayment.add(paymentDetails);
    paymentDetails.clear;
    print("");
    mainMenu();
  } else if (option == "3") {
    print("");
    mainMenu();
  }
}

List reviews = [];
void customerReviews() {
  Map<String?, String?> review = {};
  print("\nWhat would you like to do?");
  print("1. Give Review");
  print("2. Return to Main Menu");
  var option = stdin.readLineSync();
  if (option == "1") {
    print("Enter your name: ");
    review['customerName'] = stdin.readLineSync();
    stdout.write("Write your review: ");
    review['comment'] = stdin.readLineSync() ?? "No review given";
    reviews.add(review);
    mainMenu();
  } else if (option == "2") {
    print("");
    mainMenu();
  }
}
