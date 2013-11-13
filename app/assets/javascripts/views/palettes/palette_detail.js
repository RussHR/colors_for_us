ColorsForUs.Views.PaletteDetail = Backbone.View.extend({
  template: JST['palettes/detail'],
  
  events: {
    "click button": "toggleFavorite"
  },
  
  toggleFavorite: function(event) {
    var $button = $(event.currentTarget);
    var $buttons = $button.parent();

    if ($button.attr('class') === "favorite-button") {
      this.createFavorite();
    } 
    else {
      this.removeFavorite();
    }
    
    $buttons.fadeOut(600, function() {
      $buttons.toggleClass('favorite unfavorite');
      $buttons.fadeIn(600);
    });
  },
  
  createFavorite: function() {
    var favorite = new ColorsForUs.Models.Favorite({
      palette_id: this.model.get('id')
    });
    
    favorite.save({
      success: function(model) {
        console.log("you favorited this!");
      }
    });
  },
  
  removeFavorite: function() {
    var that = this;
    
    this.model.fetch({
      success: function() {
        that.model.get('favorites').forEach(function(favorite) {
          if (favorite.giver_id === that.currentUserID &&
              favorite.palette_id === parseInt(that.model.get('id'))) {
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
      palette: this.model,
      currentUserID: this.currentUserID
    });
    this.$el.html(renderedContent);
    
    return this;
  }
});