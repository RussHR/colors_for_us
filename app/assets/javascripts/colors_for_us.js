window.ColorsForUs = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    console.log('Hello from Backbone!');
    new this.Routers.Palettes();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  ColorsForUs.initialize();
});