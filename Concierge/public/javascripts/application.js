// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function getHomepage(url) {

    $(document).ready(function() {
        $.ajax({
            type: "GET",
            url: url,
            dataType: "xml",
            success: parseHomepage
        });
       $('.hidden').remove();
    });

}
function getSearch() {

$("#content").append("<h1>Search</h1>");

    $(document).ready(function() {
        $.ajax({
            type: "GET",
            url: "http://localhost:3000/services/people/search?keyword=joao",
            dataType: "xml",
            success: parseList
        });
       $('.hidden').remove();
    });

}

function parseList(xml) {

        $(xml).find("list").each(function() {

            $("#content").append("<p>Keyword: "+$(this).attr("title")+"</p><ul>");

            $(this).find("item").each(function() {
                $("#content").append("<li class='item' path="+$(this).attr('href')+">"+$(this).text()+"<p>"+$(this).attr("title")+"</p></li>");
            });

            $("#content").append("</ul>");

        });

}

function parseHomepage(xml) {

    $(xml).find("record").each(function() {

        $("#content").text("");
        $("#content").append("<p>"+$(this).attr('title')+"</p>");
        $("#content").append("<ul>");

        $(this).find("link").each(function() {
            $("#content").append("<li class='list' path="+$(this).attr('href')+">"+$(this).text()+"</li>")
        });

        $("#content").append("</ul>");

    });
}

$('.item').live('click', function() {
        alert("carrega benfica");
        getRecord($(this).attr('path'));
    });

$('#search').live('click', function() {
        alert("carrega benfica");
    });

$('#serviceLink').live('click', function(){
      getHomepage($(this).attr('href'));
    });