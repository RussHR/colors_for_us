ColorsForUs.Routers.Palettes = Backbone.Router.extend({
  routes: {
   "_=_": "showPaletteIndex",
   "": "showPaletteIndex",
   "new": "showNewPalette",
   ":id": "showPaletteDetail",
   "users/:id": "showUserDetail"
  },
  
  initialize: function() {    
    $(".nav-item").on("click", function(event) {
      var $tab = $(event.target);
      $(".nav-item").removeClass("active-tab");
      $tab.addClass("active-tab");
    })
  },
  
  showPaletteIndex: function() {
    var that = this;
    var paletteCollection = new ColorsForUs.Collections.Palettes();
    paletteCollection.fetch({
      success: function() {
        var indexView = new ColorsForUs.Views.PalettesIndex({
          collection: paletteCollection
        });
        that._swapView(indexView);
      }
    });
  },
  
  showNewPalette: function() {
    var newView = new ColorsForUs.Views.NewPalette();
    this._swapView(newView);
  },
  
  showPaletteDetail: function(id) {
    var that = this;
    var palette = new ColorsForUs.Models.Palette({ id: id })
    palette.fetch({
      success: function() {
        var detailView = new ColorsForUs.Views.PaletteDetail({
          model: palette
        });
        that._swapView(detailView);
      }
    });
  },
  
  showUserDetail: function(id) {
    var that = this;
    var user = new ColorsForUs.Models.User({ id: id })
    
    user.fetch({
      success: function() {
        var detailView = new ColorsForUs.Views.UserDetail({
          model: user
        });
        that._swapView(detailView);
      }
    });
  },
  
  _swapView: function(newView) {
    var that = this;
    
    $.modal.close();
    $("#content").fadeOut(500, function() {
      if (this._prevView) {
        this._prevView.remove();
      }
      
      that._prevView = newView;
      newView.render();
      $("#content").html(newView.$el);
      window.scrollTo(0, 0);
      $("#content").fadeIn(500);
    });
  }
});
