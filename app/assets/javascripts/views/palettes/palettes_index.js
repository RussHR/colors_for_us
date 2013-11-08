ColorsForUs.Views.PalettesIndex = Backbone.View.extend({
  template: JST['palettes/index'],
  
  events: {
    "click button": "toggleFavorite"
  },
  
  toggleFavorite: function(event) {
    var $button = $(event.currentTarget);
    var $buttons = $button.parent();
    var paletteID = $buttons.attr('data-palette-id');

    if ($button.attr('class') === "favorite-button") {
      this.createFavorite(paletteID);
    } 
    else {
      this.removeFavorite(paletteID);
    }
    
    $buttons.toggleClass('favorite unfavorite');
  },
  
  createFavorite: function(paletteID) {
    var favorite = new ColorsForUs.Models.Favorite({
      palette_id: paletteID
    });
    
    favorite.save({
      success: function() {
        console.log("you favorited this!");
      }
    });
  },
  
  removeFavorite: function(paletteID) {
    console.log("deleting a favorite!", paletteID);
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