var app = window.app = {};
app.Products = function() {
  this._input = $('#books-search-txt');
  this._initAutocomplete();
};

app.Products.prototype = {

};


_initAutocomplete:function() {
  this._input
    .autocomplete({
      source: '/products',
      appendTo: '#products-search-results',
      select: $.proxy(this._select, this)
    })
    .autocomplete('instance')._renderItem = $.proxy(this._render, this);
}

_select: function(e, ui) {
  this._input.val(ui.item.title + ' - ' + ui.item.author);
  return false;
}