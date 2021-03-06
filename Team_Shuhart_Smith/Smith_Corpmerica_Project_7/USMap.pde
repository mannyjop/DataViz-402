// Use geomerative library for working with SVG map and states,
// helps to determine when mouse pointer is within state boundaries
import geomerative.*;

class USMap {
  RShape map;
  String currentState;
  StateData states;
  DataOilProduction stateOil;

  // Constructor to set up the map and load the state data 
  USMap(PApplet parent) {

    // Use geomerative library and load the SVG from the file.
    RG.init(parent);
    smooth();
    RG.setPolygonizer(RG.ADAPTATIVE);
    RG.ignoreStyles(true); // Ignore the styles in the SVG
    map = RG.loadShape("usmap.svg");

     // Load in the company data and set the state/company mappings
    this.states = new StateData();
    
    // Load the oil production data to show on the map
    this.stateOil = new DataOilProduction();
  }
  
  // Draw the map, and if mouse is over state, highlight that state (and set as currentState)
  void draw() {

    // Put the map on off-white background, and draw it
    background(250,240,230);
    stroke(0);
    noFill();

    // fit the map into the resizeable window to allow showing chart beneath
    map.transform(0, 0, width, height / 2);
    map.draw();

    // Check to see if mouse is hovered over the state, and highlight accordingly
    currentState = null;
    RPoint mousePosition = new RPoint(mouseX, mouseY);
    
    for(RGeomElem state : map.children) {
      String stateCode = state.name.toUpperCase();
      // Now, color oil production

      int production = stateOil.getOilByStateCode(stateCode);
      if (production > 0) {
        int colorDepth = 255 - floor((log(production) * 10));
        fill(colorDepth, colorDepth - 100, colorDepth - 100);
        noStroke();
        state.draw();
      }

      if(state.contains(mousePosition)){

        // Keep track of the current state highlighted in case of mouse click
        currentState = stateCode;
        println(currentState);
        
        // Change current state to blue for hover-over highlighting
        fill(0,100,255,250);
        noStroke();
        state.draw();
      }
    }
  }
  
  boolean isStateSelected() {
    if (currentState == null)
    {
      return false;
    }
    else {
      return states.isStateMapped(this.currentState);
    }
  }

  String getSymbol() {
    return states.getStateSymbol(this.currentState);
  }
  
  String getCompany() {
    return states.getStateCompany(this.currentState);
  }
}