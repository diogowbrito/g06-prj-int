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
            success: parseSearchList
        });
        $('.hidden').remove();
    });

}

function getList(url) {

    $(document).ready(function() {
        $.ajax({
            type: "GET",
            url: url,
            dataType: "xml",
            success: parseList
        });
        $('.hidden').remove();
    });
}


function getRecord(url) {
    $(document).ready(function() {
        $.ajax({
            type: "GET",
            url: url,
            dataType: "xml",
            success: parseRecord
        });
        $('.hidden').remove();
    });
}

function parseList(xml) {

    $(xml).find("list").each(function() {

        $("#content").append("<p>Keyword: " + $(this).attr("title") + "</p><ul>");

        $(this).find("item").each(function() {
            $("#content").append("<li class='item' href=" + $(this).attr('href') + ">" + $(this).text() + "<p>" + $(this).attr("title") + "</p></li>");
        });

        $("#content").append("</ul>");

    });

}

function parseHomepage(xml) {

    $(xml).find("record").each(function() {

        $("#content").text("");
        $("#content").append("<p>" + $(this).attr('title') + "</p>");
        $("#content").append("<ul>");

        $(this).find("link").each(function() {
            $("#content").append("<li class='list' href=" + $(this).attr('href') + ">" + $(this).text() + "</li>")
        });

        $("#content").append("</ul>");

    });
}
function parseRecord(xml) {
    $("#content").text("");
    $(xml).find("record").children().each(function(index, element) {
        var text;
        var title;
        switch (element.nodeName) {
            case 'text':
                if ($(this).children().size() == 0) {
                    text = $(this).text();
                    title = $(this).attr('title');
                    if (title == undefined)
                        $("#content").append("<p><a href=" + attr + ">" + text + "</a></p>");
                    else
                        $("#content").append("<p>" + title + ": " + text + "</p>");
                }
                else {
                    title = $(this).attr('title');
                    if (title != undefined)
                        $("#content").append("<p>" + title + "</p>");

                    $(this).children().each(function(index, element) {
                        if (element.nodeName == 'entity') {
                            text = $(this).text();
                            var attr = $(this).attr('href');
                            $("#content").append("<p><a href=" + attr + ">" + text + "</a></p>");
                        }
                        else if (element.nodeName == 'text') {
                            text = $(this).text();
                            if (title == undefined)
                                $("#content").append("<p>" + text + "</p>");
                        }
                    });
                }
                break;

            case 'entity':
                text = $(this).text();
                title = $(this).attr('title');
                var attr = $(this).attr('href');
                if (title == undefined)
                    $("#content").append("<p><a href=" + attr + ">" + text + "</a></p>");
                else
                    $("#content").append("<p>" + title + ": " + "<a href=" + attr + ">" + text + "</a></p>");
                break;

            case 'email':
                text = $(this).text();
                title = $(this).attr('title');
                if (title == undefined)
                    $("#content").append("<p><a href=" + attr + ">" + text + "</a></p>");
                else
                    $("#content").append("<p>" + title + ": " + text + "</p>");
                break;
        }
    });
}

$('#serviceLink').live('click', function() {
    getHomepage($(this).attr('href'));
});

$('.list').live('click', function() {
    getList($(this).attr('href'));
});

$('.item').live('click', function() {
    getRecord($(this).attr('href'));
});

$('#search').live('click', function() {
    alert("carrega benfica");
});