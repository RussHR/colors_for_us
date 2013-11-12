ColorsForUs.Views.NewPalette = Backbone.View.extend({
  template: JST['palettes/new'],
  
  events: {
    "click .future-color": "setActiveColor",
    "click #create-palette": "createPalette"
  },
  
  setActiveColor: function(event) {
    var $currentSwatch = $(event.target);
    $currentSwatch.addClass('active-swatch');
    $currentSwatch.siblings().removeClass('active-swatch');
  },
  
  createPalette: function() {
    var paletteName = $('#palette_name').val()
    var realColors = this.colorsFromPalette();

    if (paletteName != "" && realColors.length > 0) {
      var palette = new ColorsForUs.Models.Palette({
        name: paletteName,
        color_1: realColors[0],
        color_2: realColors[1],
        color_3: realColors[2],
        color_4: realColors[3],
        color_5: realColors[4]
      }); 
      
      palette.save({}, {
        success: function() {
          console.log("You made a palette!");
          Backbone.history.navigate("/" + palette.get('id'), {trigger: true});
        }
      });
    }
  },
  
  colorsFromPalette: function() {
    var $colorSwatches = $('#future-palette').children();
    
    var colors = $colorSwatches.map(function() {
      return $(this).attr('data-color');
    });
    
    var realColors = colors.filter(function(index) {
      return colors[index] != "";
    });
    
    return realColors;
  },
  
  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.$el.find('#color-picker').ColorPicker({
      flat: true,
      
      onChange: function(hsb, hex, rgb) {
        $('.active-swatch').removeClass('no-color');
        $('.active-swatch').css('background-color', '#' + hex);
        $('.active-swatch').attr('data-color', '#' + hex);
      },
    });
    return this;
  }   
});