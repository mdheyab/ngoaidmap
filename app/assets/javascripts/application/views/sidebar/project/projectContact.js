'use strict';

define([
  'backbone',
  'handlebars',
  'abstract/conexion',
  'abstract/utils',
  'text!templates/sidebar/project/projectContact.handlebars'
  ], function(Backbone, handlebars, conexion, utils, tpl) {

  var ProjectContact = Backbone.View.extend({

    el: '#project-contact',

    template: Handlebars.compile(tpl),

    initialize: function() {
      this.project = project;
      if (!this.$el.length) {
        return
      }
      (this.project && !!this.project.contact_email && !!this.project.contact_person && !!this.project.contact_phone_number) ? this.render() : this.$el.remove();
    },

    parseData: function(){

      return this.project;
    },

    render: function(){
      this.$el.html(this.template(this.parseData()));
    },

  });

  return ProjectContact;

});
