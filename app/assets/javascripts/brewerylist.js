var BREWERIES = {};

BREWERIES.show = function(){
    $("#brewerytable tr:gt(0)").remove();

    var table = $("#brewerytable");

    table.append('<tr>'
        +'<th><a href="#" id="name">Name</a></th>'
        +'<th><a href="#" id="year">Year</a></th>'
        +'<th><a href="#" id="beercount">BeerCount</a></th>'
        +'<th><a href="#" id="active">Active</a></th>'
        +'</tr>');

    $.each(BREWERIES.list, function (index, brewery) {
        table.append('<tr>'
            +'<td>'+brewery['name']+'</td>'
            +'<td>'+brewery['year']+'</td>'
            +'<td>'+brewery['beers'].length+'</td>'
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

BREWERIES.sort_by_beers_length = function(){
    BREWERIES.list.sort( function(a,b){
        return a.abeers.length.localeCompare(b.beers.length);
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

      $("#beercount").click(function (e) {
          BREWERIES.sort_by_beers_length();
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