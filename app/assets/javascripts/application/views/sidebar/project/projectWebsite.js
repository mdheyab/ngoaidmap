'use strict';

define([
  'backbone',
  'handlebars',
  'abstract/conexion',
  'abstract/utils',
  'text!templates/sidebar/project/projectWebsite.handlebars'
  ], function(Backbone, handlebars, conexion, utils, tpl) {

  var ProjectWebsite = Backbone.View.extend({

    el: '#project-website',

    template: Handlebars.compile(tpl),

    initialize: function() {
      this.project = project;
      if (!this.$el.length) {
        return
      }
      (this.project && !!this.project.website) ? this.render() : this.$el.remove();
    },

    parseData: function(){
      return this.project;
    },

    render: function(){
      this.$el.html(this.template(this.parseData()));
    },

  });

  return ProjectWebsite;

});
