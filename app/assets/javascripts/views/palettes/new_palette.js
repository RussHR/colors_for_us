ColorsForUs.Views.NewPalette = Backbone.View.extend({
  template: JST['palettes/new'],
  
  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.$el.find('#color-picker').ColorPicker({flat: true});
    return this;
  }   
});