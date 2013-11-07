ColorsForUs.Views.PaletteDetail = Backbone.View.extend({
  template: JST['palettes/detail'],
  
  render: function() {
    var renderedContent = this.template({ palette: this.model })
    this.$el.html(renderedContent);
    
    return this;
  }
});