ColorsForUs.Views.PalettesIndex = Backbone.View.extend({
  template: JST['palettes/index'],
  
  events: {
    "click button": "toggleFavorite"
  },
  
  toggleFavorite: function(event) {
    var $button = $(event.currentTarget);
    var $buttons = $button.parent().children();
    $buttons.toggleClass('favorite-button unfavorite-button');
  },
  
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