// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function Tag(id, name){
    this.id = id
    this.name = name
}

Tag.prototype.render = function() {
    $("#tagName").text("New Tag Created: " + this.name);
}

Tag.prototype.renderListItem = function(element = undefined) {
    const listItemHTML = `<li class="js-tag" data-id="${this.id}">${this.name}</li>`
    if (element) {
        element.append(listItemHTML)
    } else {
        return listItemHTML
    }
}

Tag.renderListItems = function(tags) {
    const element = $(".tags")
    tags.sort((a,b) => a.name.localeCompare(b.name))
        .map(({ id, name }) => new Tag(id, name).renderListItem(element))  
}
