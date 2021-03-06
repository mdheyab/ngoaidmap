'use strict';

define([
  'backbone',
  'handlebars',
  'abstract/conexion',
  'abstract/utils',
  'text!templates/sidebar/project/projectPartnerOrganizations.handlebars'
  ], function(Backbone, handlebars, conexion, utils, tpl) {

  var ProjectPartnerOrganizations = Backbone.View.extend({

    el: '#project-partnerorganizations',

    template: Handlebars.compile(tpl),

    initialize: function() {
      this.project = project;
      if (!this.$el.length) {
        return
      }
      (this.project && !!this.project.partner_organizations && this.project.partner_organizations != 'N/A') ? this.render() : this.$el.remove();
    },

    parseData: function(){
      return this.project;
    },

    render: function(){
      this.$el.html(this.template(this.parseData()));
    },

  });

  return ProjectPartnerOrganizations;

});
