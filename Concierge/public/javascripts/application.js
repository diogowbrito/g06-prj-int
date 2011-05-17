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

function getSearch(url) {
     alert(url);
    $(document).ready(function() {
        $.ajax({
            type: "GET",
            url: url,
            dataType: "xml",
            success: parseSearchList
        });
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

function parseSearchList(xml) {
    alert("wee");
    $("#content").text("");
    $("#content").append("<h1>Search</h1>");
    $(xml).find("list").each(function() {
        alert("we");
        $("#content").append("<p>Keyword: " + $(this).attr("title") + "</p><ul>");

        $(this).find("item").each(function() {
            $("#content").append("<li class='item' href=" + $(this).attr('href') + ">" + $(this).text() + "<p>" + $(this).attr("title") + "</p></li>");
        });

        $("#content").append("</ul>");

    });

}

function parseList(xml) {

    $(xml).find("list").each(function() {

        $("#content").text("");

        var list = $("#content").append('<ul></ul>').find('ul');
        $(this).find("item").each(function() {
           list.append("<li class='item' href=" + $(this).attr('href') + ">" + $(this).text() + "<p>" + $(this).attr("title") + "</p></li>");
        });

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
    $("#content").append('<ul data-role="listview" id="resourceList"></ul>');
    $(xml).find("record").children().each(function(index, element) {
        var text;
        var title;
        switch (element.nodeName) {
            case 'text':
                if ($(this).children().size() == 0) {
                    text = $(this).text();
                    title = $(this).attr('title');
                    if (title == undefined)
                        $("#resourceList").append("<li><a href=" + attr + ">" + text + "</a></li>");
                    else
                        $("#resourceList").append("<li>" + title + ": " + text + "</li>");
                }
                else {
                    title = $(this).attr('title');
                    var html = "<li>";
                    if (title != undefined)
                        html += title;

                    html += '<ul data-role="listview">';

                    $(this).children().each(function(index, element) {
                        if (element.nodeName == 'entity') {
                            text = $(this).text();
                            var attr = $(this).attr('href');
                            html += '<li class="search"><a href=' + attr + '>' + text + '</a></li>';
                        }
                        else if (element.nodeName == 'text') {
                            text = $(this).text();
                            if (title == undefined)
                                $("#resourceSubList").append("<li>" + text + "</li>");
                        }
                    });
                    html += '</ul></li>';
                    $("#resourceList").append(html);
                }
                break;

            case 'entity':
                text = $(this).text();
                title = $(this).attr('title');
                var attr = $(this).attr('href');
                if (title == undefined)
                    $("#resourceList").append("<li class='search'><a href=" + attr + ">" + text + "</a></li>");
                else
                    $("#resourceList").append("<li class='search'>" + title + ": " + "<a href=" + attr + ">" + text + "</a></li>");
                break;

            case 'email':
                text = $(this).text();
                title = $(this).attr('title');
                if (title == undefined)
                    $("#resourceList").append("<li class='email'><a href=" + attr + ">" + text + "</a></li>");
                else
                    $("#resourceList").append("<li class='email'>" + title + ": " + text + "</li>");
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

$('.search').live('click', function() {
    getSearch($(this).children('a').attr('href'));
});