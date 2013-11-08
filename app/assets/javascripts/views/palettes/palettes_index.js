ColorsForUs.Views.PalettesIndex = Backbone.View.extend({
  template: JST['palettes/index'],
  
  render: function() {
    var data = JSON.parse($("#bootstrapped_current_user_id").html());
    var renderedContent = this.template({
      palettes: this.collection,
      currentUserID: data.current_user_id
    });
    this.$el.html(renderedContent);
    
    return this;
  }    
});