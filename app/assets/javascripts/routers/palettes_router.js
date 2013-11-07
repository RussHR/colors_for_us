ColorsForUs.Routers.Palettes = Backbone.Router.extend({
  routes: {
   "_=_": "showPaletteIndex",
   "": "showPaletteIndex",
   "new": "showNewPalette"
  },
  
  showPaletteIndex: function() {
    var that = this;
    var paletteCollection = new ColorsForUs.Collections.Palettes();
    paletteCollection.fetch({
      success: function() {
        var indexView = new ColorsForUs.Views.PalettesIndex(
          { collection: paletteCollection}
        );
        that._swapView(indexView);
      }
    });
  },
  
  showNewPalette: function() {
    var newView = new ColorsForUs.Views.NewPalette();
    this._swapView(newView);
  },
  
  _swapView: function(newView) {
    if (this._prevView) {
      this._prevView.remove();
    }
    
    this._prevView = newView;
    newView.render();
    $("#content").html(newView.$el);
  }
});
