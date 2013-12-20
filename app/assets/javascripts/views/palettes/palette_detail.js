ColorsForUs.Views.PaletteDetail = Backbone.View.extend({
  template: JST['palettes/detail'],
  
  events: {
    "click .favorite-button": "toggleFavorite",
    "click .unfavorite-button": "toggleFavorite",
    "click .create-wallpapers": "openWallpapersModal",
    "click #generate-wallpaper": "generateWallpaper",
    "click #delete-palette": "deletePalette"
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
    $.ajax({
      url: "/favorites",
      type: "DELETE",
      data: {
        palette_id: this.model.get('id')
      },
      success: function() {
        console.log("deleted!");
      }
    })
  },
  
  openWallpapersModal: function() {
    $("#wallpaper-modal").modal({
      fadeDuration: 200
    });
  },
  
  generateWallpaper: function(event) {
    event.preventDefault();
    var height = $("#wallpaper-height").val();
    var width = $("#wallpaper-width").val();
    var url = "/palettes/" + this.model.get('id') +                        "/wallpaper?width=" + width + "&height=" + height;
    console.log(url);
    
    window.open(url);
  },
  
  deletePalette: function(event) {
    event.preventDefault();
    var deleteResponse = confirm(
        "Are you sure you want to delete this palette?");
        
    if (deleteResponse) {
      this.model.destroy(
        success: function(model) {
          console.log("You deleted the palette!");
          Backbone.history.navigate(
            "/users/" + model.get("creator_id"), 
            {trigger: true}
          );
        }  
      );
    }
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