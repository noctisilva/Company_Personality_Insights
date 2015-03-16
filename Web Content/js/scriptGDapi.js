$(document).ready(function() {
    var gid = "31244";
    var gkey = "ipAUU9y5j2c";
    var comments = "";
    var cName = "";
    /*------------------------------------*/
    var lat = [42.56897,40.808997,40.7127837,40.742958,40.7127837,40.7313702,40.7575067,40.74217549999999];
    var longi = [-75.477, -73.960086,-74.00594130000002,-73.82541700000002,-74.00594130000002, -74.00861120000002,-73.9877717,-73.99184149999996];
    var myCenter=new google.maps.LatLng(42.56897,-75.477);
    var location = "";
    var locArray = ["Microsoft","IBM","Google","EY","PWC","Venmo", "MongoDB", "Yodle","facebook","uber","Columbia | Engineering"];
    var locations = [
        ['Columbia | Engineering', 40.8080586, -73.96400840000001, 10],
        ['uber', 40.7484712, -73.93951329999999, 9],
        ['facebook', 40.7536496,  -73.97814210000001, 8],
        ['Yodle', 40.74217549999999, -73.99184149999996, 7],
        ['MongoDB', 40.7575067, -73.9877717, 6],
        ['Venmo', 40.7313702, -74.00861120000002, 5],
        ['Microsoft', 42.56897, -75.477, 4],
        ['IBM', 40.808997, -73.960086, 5],
        ['Google', 40.7127837, -74.00594130000002, 3],
        ['EY', 40.742958, -73.82541700000002, 2],
        ['PWC', 40.7127837, -74.00594130000002, 1]
    ];
    /*-----------------------------------------*/

    var getComments = function(){
        var apiURL = "http://api.glassdoor.com/api/api.htm?t.p="+ gid + "&t.k="+ gkey +"&userip=0.0.0.0&&q="+ cName +"&useragent=&format=json&v=1&action=employers&ps=20"
        $.get(apiURL, jsonParse);
    }
    var jsonParse = function(data){
    if (data.success && data.response.totalRecordCount > 0) {
        var result = data.response.employers[0];
        displayResult(result);
    }
    else{
        alert("No results found");
    }
    }

    var displayResult = function(data){
        var prosTxt = data.featuredReview.pros;
        var consTxt = data.featuredReview.cons;
        comments = data.featuredReview.pros + " " +data.featuredReview.cons;
        var industry = data.industry;
        var numberOfRatings = data.numberOfRatings;
        var overallRating = data.overallRating;
        var ratingDescription = data.ratingDescription;
        $("#pros").empty().append("Pros: " + prosTxt);
        $("#cons").empty().append("Cons: " + consTxt);
        $("#industry").empty().append("Industry: <br>" + industry);
        $("#numberOfRatings").empty().append("Number Of Ratings: <br>" + numberOfRatings);
        $("#overallRating").empty().append("Overall Rating: <br>" + overallRating);
        $("#ratingDescription").empty().append("Rating Description: <br>" + ratingDescription);
    }
    // $("#enter").click(function(){
    //     cName = $("#inputIn").val();
    //     getComments();
    //     alert(cName);
    // });
    /*-------------------------------------------------------------*/

    var map = new google.maps.Map(document.getElementById('googleMap'), {
      zoom: 11,
      center: new google.maps.LatLng(40.74217549999999, -73.99184149999996),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }

    $(".queryComp").click(function(){
        var str = $(this).index() +1;
        var loc = "";
        loc = $("ul li:nth-child("+str+")").text();
        console.log(loc);
        $("#titleBig").empty().append(loc);
        cName = loc;
        getComments();
        $('#gdContainer').css("display","inline");
        $('.otherStuff').css("display","inline");
        $('#goodbye2').css("display","none");
        $('#goodbye3').css("display","none");
        $('#titleBig').css("display","inline");
    });
    console.log(comments);
    $("#render").click(function(){
        console.log("hello world!");
        $("#textbuilder").append(comments);
        $('#analClk').trigger('click');
        $('#gdContainer').css("display","none");
        $('.otherStuff').css("display","none");
        $('#goodbye2').css("display","inline");
        $('#goodbye3').css("display","inline");
        $('#titleBig').css("display","none");
    });

    var $elie = $("#goodbye3"), degree = 0, timer;
    rotate();
    function rotate() {
        
        $elie.css({ WebkitTransform: 'rotate(' + degree + 'deg)'});  
        $elie.css({ '-moz-transform': 'rotate(' + degree + 'deg)'});                      
        timer = setTimeout(function() {
            ++degree; rotate();
        },5);
    }

});
$(function() {
    var $elie = $("#goodbye3"), degree = 0, timer;
    rotate();
    function rotate() {
        
        $elie.css({ WebkitTransform: 'rotate(' + degree + 'deg)'});  
        $elie.css({ '-moz-transform': 'rotate(' + degree + 'deg)'});                      
        timer = setTimeout(function() {
            ++degree; rotate();
        },5);
    }
}); 