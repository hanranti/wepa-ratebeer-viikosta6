var BREWERIES = {};

BREWERIES.show = function(){
    $("#brewerytable tr:gt(0)").remove();

    var table = $("#brewerytable");

    $.each(BREWERIES.list, function (index, beer) {
        table.append('<tr>'
            +'<td>'+brewery['name']+'</td>'
            +'<td>'+brewery['year']+'</td>'
            +'<td>'+brewery['active']+'</td>'
            +'</tr>');
    });
};

BREWERIES.sort_by_name = function(){
    BREWERIES.list.sort( function(a,b){
        return a.name.toUpperCase().localeCompare(b.name.toUpperCase());
    });
};

BREWERIES.sort_by_year = function(){
    BREWERIES.list.sort( function(a,b){
        return a.year.toUpperCase().localeCompare(b.year.toUpperCase());
    });
};

BREWERIES.sort_by_active = function(){
    BREWERIES.list.sort( function(a,b){
        return a.active.toUpperCase().localeCompare(b.active.toUpperCase());
    });
};

$(document).ready(function () {
    if ( $("#brewerytable").length>0 ) {

      $("#name").click(function (e) {
          BREWERIES.sort_by_name();
          BREWERIES.show();
          e.preventDefault();
      });

      $("#year").click(function (e) {
          BREWERIES.sort_by_year();
          BREWERIES.show();
          e.preventDefault();
      });

      $("#active").click(function (e) {
          BREWERIES.sort_by_active();
          BREWERIES.show();
          e.preventDefault();
      });


      $.getJSON('breweries.json', function (breweries) {
        BREWERIES.list = breweries;
        BREWERIES.sort_by_name;
        BREWERIES.show();
      });

    }
});