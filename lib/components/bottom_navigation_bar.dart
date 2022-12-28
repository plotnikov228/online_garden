import 'package:flutter/material.dart';



Widget BottomNavigationBarWidget (int selectedIndex, void Function() func) {
  return BottomNavigationBar(items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home_filled),
      label: 'Home',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.menu),
        label: 'Menu'
    )
  ],
    selectedItemColor: Colors.lightGreen,
    currentIndex: selectedIndex,
    onTap: (index) {
      selectedIndex = index;

    },
  );
}