ColorsForUs.Models.Palette = Backbone.Model.extend({
  urlRoot: "/palettes",
  
  numOfColors: function() {
    return this.colors().length
  },
  
  divPercentWidth: function() {
    return (1 / this.numOfColors()) * 100;
  },
  
  colors: function() {
    var colorArray = [];
    
    for (var i = 1; i < 6; i++) {
      var possibleColor = this.get("color_" + i);
      if (typeof possibleColor === "string") {
        colorArray.push(possibleColor)
      }
    }
    
    return colorArray;
  }
});