ColorsForUs.Views.PaletteDetail = Backbone.View.extend({
  template: JST['palettes/detail'],
  
  render: function() {
    var data = JSON.parse($("#bootstrapped_current_user_id").html());
    this.currentUserID = data.current_user_id;
    
    var renderedContent = this.template({ 
      palette: this.model,
      currentUserID: this.currentUserID
    });
    this.$el.html(renderedContent);
    
    return this;
  }
});