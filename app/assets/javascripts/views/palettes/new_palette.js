ColorsForUs.Views.NewPalette = Backbone.View.extend({
  template: JST['palettes/new'],
  
  events: {
    "click .future-color": "setActiveColor",
    "click #create-palette": "createPalette",
    "click .clear-color": "clearColor"
  },
  
  setActiveColor: function(event) {
    var $currentSwatch = $(event.target);
    $currentSwatch.addClass('active-swatch');
    $currentSwatch.siblings().removeClass('active-swatch');
    
    var notifierNum = $currentSwatch.attr('data-color-id');
    var $notifier = $('div[notifier-id=' + notifierNum + ']');
    $notifier.addClass('active-notifier');
    $notifier.siblings().removeClass('active-notifier');
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
  
  clearColor: function(event) {
    $swatch = $(event.currentTarget).parent();
    $swatch.addClass('no-color');
    $swatch.css('background-color', '#ecf0f1');
    $swatch.attr('data-color', '');
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
    
    this.$el.find('.future-color').on('mouseenter', function(event) {
      var $swatch = $(event.currentTarget);
      $swatch.append("<div class='clear-color'>X</div>");
    })
    
    this.$el.find('.future-color').on('mouseleave', function(event) {
      $('.clear-color').remove();
    })
    
    return this;
  }   
});