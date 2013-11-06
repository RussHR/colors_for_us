ColorsForUs.Views.PalettesIndex = Backbone.View.extend({
  template: JST['palettes/index'],
  
  render: function() {
    var renderedContent = this.template({palettes: this.collection});
    this.$el.html(renderedContent);
    
    return this;
  }    
});