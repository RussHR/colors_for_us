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
      success: function(model) {
        console.log("you favorited this!");
      }
    });
  },
  
  removeFavorite: function(paletteID) {
    var that = this;
    var palette = new ColorsForUs.Models.Palette({
      id: paletteID
    });
    
    palette.fetch({
      success: function() {
        palette.get('favorites').forEach(function(favorite) {
          if (favorite.giver_id === that.currentUserID &&
              favorite.palette_id === parseInt(paletteID)) {
                that.deleteFavoriteByID(favorite.id);
            }
        });
      }
    });
  },
  
  deleteFavoriteByID: function(favoriteID) {
    var favorite = new ColorsForUs.Models.Favorite({ id: favoriteID });
    
    favorite.destroy({
      success: function() {
        console.log("destroyed!");
      }
    });
  },
  
  render: function() {
    var data = JSON.parse($("#bootstrapped_current_user_id").html());
    this.currentUserID = data.current_user_id;
    
    var renderedContent = this.template({
      palettes: this.collection,
      currentUserID: this.currentUserID
    });
    this.$el.html(renderedContent);
    
    return this;
  }    
});