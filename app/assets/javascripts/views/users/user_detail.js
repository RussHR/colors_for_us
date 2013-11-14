ColorsForUs.Views.UserDetail = Backbone.View.extend({
  template: JST['users/detail'],
  
  render: function() {
    var data = JSON.parse($("#bootstrapped_current_user_id").html());
    this.currentUserID = data.current_user_id;
    
    var renderedContent = this.template({
      user: this.model
    });
    
    this.$el.html(renderedContent);
    return this;
  }
});