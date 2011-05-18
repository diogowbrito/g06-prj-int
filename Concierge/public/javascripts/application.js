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

function createPage(id) {



    var headerbody= "<table><tr><td id='buttonHome' style='padding-left:10px;'><a href='/index'><img alt='home' src='/images/home.png' width='25px' height='25px'> </a> </td><td id='searchBar' data-role='fieldcontain' width='140px' style='padding-left:10px;' ><form id='searchform'><input type='search' name='password' id='search' value=''/></form> </td><td id='login' style='padding-left:10px;'><a href='/login'><img alt='login' src='/images/login.png' height='25px'> </a></td><td id='history' style='padding-left:10px;'><a href='/history'><img alt='history' src='/images/history.png' width='25px' height='25px'> </a></td><td id='settings' style='padding-left:10px;'><a href='/settings'><img alt='settings' src='/images/settings.png' width='25px' height='25px'></a></td></tr></table>"

    var content = $('<div>').attr("data-role", "content");
    var header = $('<div>').attr("data-role", "header").append(headerbody);
    var page = $('<div>').attr("data-role", "page").attr("id", id).attr("data-url", id).append(header).append(content);


    return $(page)
}


function parseList(xml) {


    var page = createPage("listz");
    var pageWritable = $("[data-role=content]", page.get(0));

    $(xml).find("list").each(function() {
        var list = pageWritable.append("<ul data-role='listview' data-inset='true' data-theme='d'></ul>").find('ul');

        $(this).find("item").each(function() {
            list.append("<li class='item' href=" + $(this).attr('href') + ">" + "<a href='' >" + $(this).text() + "<p>" + $(this).attr("title") + "</p> </a></li>");
        });

    });

    page.page();
    $.mobile.pageContainer.append(page);
    $.mobile.changePage("#" + page.attr("id"));
}

function parseHomepage(xml) {


    var page = createPage("homepagz");
    var pageWritable = $("[data-role=content]", page.get(0));

    $(xml).find("record").each(function() {
        pageWritable.append("<p>" + $(this).attr('title') + "</p>");
        var list = pageWritable.append("<ul data-role='listview' data-inset='true' data-theme='d'></ul>").find('ul');
        $(this).find("link").each(function() {
            list.append("<li class='list' href=" + $(this).attr('href') + "> <a href=''>" + $(this).text() + "</a></li>")
        });
    });

    page.page();
    $.mobile.pageContainer.append(page);
    $.mobile.changePage("#" + page.attr("id"));
}


function parseRecord(xml) {

    var page = createPage("recordz");
    var pageWritable = $("[data-role=content]", page.get(0));

//    pageWritable.append('<ul data-role="listview" id="resourceList"></ul>');
    var list = pageWritable.append("<ul data-role='listview' data-inset='true' data-theme='d'></ul>").find('ul');

//    $("#content").append('<ul data-role="listview" id="resourceList"></ul>');

    $(xml).find("record").children().each(function(index, element) {
        var text;
        var title;
        switch (element.nodeName) {
            case 'text':
                if ($(this).children().size() == 0) {
                    text = $(this).text();
                    title = $(this).attr('title');
                    if (title == undefined)
                        list.append("<li><a href=" + attr + ">" + text + "</a></li>");
                    else
                        list.append("<li>" + title + ": " + text + "</li>");
                }
                else {
                    title = $(this).attr('title');
                    var html = "<li>";
                    if (title != undefined)
                        html += title;

                    html += "<ul data-role='listview' data-inset='true' data-theme='d'>";

                    $(this).children().each(function(index, element) {
                        if (element.nodeName == 'entity') {
                            text = $(this).text();
                            var attr = $(this).attr('href');
                            html += '<li class="search"><a href=' + attr + '>' + text + '</a></li>';
                        }
                        else if (element.nodeName == 'text') {
                            text = $(this).text();
                            if (title == undefined)
                              html += "<li>" + text + "</li>";
                        }
                        else if (element.nodeName == 'email') {
                            text = $(this).text();
                            html += "<li class='search'><a href=" + attr + ">" + text + "</a></li>";
                        }
                    });
                    html += '</ul></li>';
                    list.append(html);
                }
                break;

            case 'entity':
                text = $(this).text();
                title = $(this).attr('title');
                var attr = $(this).attr('href');
                if (title == undefined)
                    list.append("<li class='search'><a href=" + attr + ">" + text + "</a></li>");
                else
                    list.append("<li class='search'>" + title + ": " + "<a href=" + attr + ">" + text + "</a></li>");
                break;

            case 'email':
                text = $(this).text();
                title = $(this).attr('title');
                if (title == undefined)
                    list.append("<li class='email'><a href=" + attr + ">" + text + "</a></li>");
                else
                    list.append("<li class='email'>" + title + ": " + text + "</li>");
                break;
        }
    });

   page.page();
   $.mobile.pageContainer.append(page);
   $.mobile.changePage("#" + page.attr("id"));
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