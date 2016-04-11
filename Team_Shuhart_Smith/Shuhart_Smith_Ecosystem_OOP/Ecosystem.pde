/*
   There is one ecosystem--it is globally accessible. When created, it will create and hold each of the Zoos, Parks, and Lakes, and populate each in term.
*/

class Ecosystem {
  final int simulationYears = 10;
  Habitat[] habitats;
  
  Ecosystem() {
    habitats = new Habitat[8];
    habitats[0] = new Zoo("Woodland Park");
    // Woodland Park Zoo is in Woodland Park
    // 7 more to go:
      //The Dallas Zoo is in Dallas
      //Lake Cliff Park is in Dallas
      //Lake Cliff is in Lake Cliff Park
      //Oak Cliff Founders Park is adjacent to Lake Cliff Park
      //The Woodland Park is in Seattle
      //Green Lake is in Greenlake Park
      //Green Lake Park is adjacent to Woodland Park
  }
  
  void Simulate() {
    for(int year = 0; year < simulationYears; year++) {
      //TODO: Call simulateYear on each habitat
    }
  }
}