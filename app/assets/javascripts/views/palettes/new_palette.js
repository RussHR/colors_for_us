ColorsForUs.Views.NewPalette = Backbone.View.extend({
  template: JST['palettes/new'],
  
  events: {
    "click .future-color": "setActiveColor"
  },
  
  setActiveColor: function(event) {
    var $currentSwatch = $(event.target);
    $currentSwatch.addClass('active-swatch');
    $currentSwatch.siblings().removeClass('active-swatch');
  },
  
  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.$el.find('#color-picker').ColorPicker({
      flat: true,
      
      onChange: function(hsb, hex, rgb) {
        $('.active-swatch').css('background-color', '#' + hex);
        $('.active-swatch').attr('data-color', '#' + hex);
      },
    });
    return this;
  }   
});