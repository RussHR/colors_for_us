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
    
    $buttons.fadeOut(600, function() {
      $buttons.toggleClass('favorite unfavorite');
      $buttons.fadeIn(600);
    });
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
    $.ajax({
      url: "/favorites",
      type: "DELETE",
      data: {
        palette_id: paletteID
      },
      success: function() {
        console.log("deleted!");
      }
    })
  },
  
  render: function() {
    var possibleData = $("#bootstrapped_current_user_id").html();
    
    if (possibleData) {
      var data = JSON.parse($("#bootstrapped_current_user_id").html());
      this.currentUserID = data.current_user_id;
    }
    
    var renderedContent = this.template({
      palettes: this.collection,
      currentUserID: this.currentUserID
    });
    this.$el.html(renderedContent);
    
    return this;
  }    
});