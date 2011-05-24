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
    });

}

function getSearch(url) {

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
    });
}

function parseSearchList(xml) {
    var page = createPage("search");
    var pageWritable = $("[data-role=content]", page.get(0));


    $(xml).find("list").each(function() {
        pageWritable.append("<p>Keyword: " + $(this).attr("title") + "</p>");
        var list = pageWritable.append("<ul data-role='listview' data-inset='true' data-theme='d'></ul>").find('ul');

        $(this).find("item").each(function() {
            list.append("<li class='item' href=" + $(this).attr('href') + "> <a href='' >" + $(this).text() + "<p>" + $(this).attr("title") + "</p></a></li>");
        });

    });

    page.page();
    $.mobile.pageContainer.append(page);
    $.mobile.changePage("#" + page.attr("id"));
}

function createPage(id) {

    var page = $('<div>').attr("data-role", "page").attr("id", id).attr("data-url", id).attr("data-position", "inline");

    <!-- Draw Header-->
    var headerbody = "<a href='index.html' class='ui-btn-right' data-icon='gear' icon>Login</a>" +
            "<h1 id='logo' class='ui-title'>Concierge</h1>"
    var header = $('<div>').attr("data-role", "header").attr("data-position", "fixed").append(headerbody);

    <!-- Draw Search-->
    var searchformbody = $('<input>').attr("type", "search").attr("id", "search").attr("value", "").attr("width", "100%");
    var searchform = $('<form>').attr("id", "home_searchform").append(searchformbody);
    var search = $('<div>').attr("data-role", "footer").attr("data-role", "fieldcontain").attr("width", "100%").attr("class", "hidden_home_search").attr("style", "text-align:center; visibility:hidden").append(searchform);

    <!-- Draw Content-->
    var content = $('<div>').attr("data-role", "content");

    <!-- Draw Footer nav bar-->

    var historytab = $("<li>").attr("style", "width:25%").append("<a href='history' data-icon='grid'>History</a>");
    var searchtab = $("<li>").attr("id", "tab_bar_search").attr("style", "width:50%").append("<a href='' data-icon='search'>Search</a>");
    var optionstab = $("<li>").attr("style", "width:25%").append("<a href='options' data-icon='gear'>Options</a>");
    var navbarul = $("<ul>").append(historytab).append(searchtab).append(optionstab);
    var navbar = $("<div>").attr("data-role", "navbar").append(navbarul);

    <!-- Draw footer and append nav bar-->
    var footer = $('<div>').attr("data-role", "footer").attr("data-id", "navbar").attr("data-position", "fixed").append(navbar);


    <!-- Draw the final page-->
    var finalpage = page.append(header).append(content).append(search).append(footer);

    return $(finalpage)
}


function parseList(xml) {


    var page = createPage("list");
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


    var page = createPage("homepage");
    var pageWritable = $("[data-role=content]", page.get(0));

    $(xml).find("record").each(function() {
        pageWritable.append("<p>" + $(this).attr('title') + "</p>");
        $(this).find("text").each(function() {
            pageWritable.append("<p>" + $(this).text() + "</p>");
        });
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

    var bla = Math.floor(1000 * (Math.random() % 1));
    var page = createPage("record" + bla);
    var pageWritable = $("[data-role=content]", page.get(0));

    var list = pageWritable.append("<ul data-role='listview' data-inset='true' data-theme='d'></ul>").find('ul');

    $(xml).find("record").children().each(function(index, element) {
        var text;
        var title;
        switch (element.nodeName) {
            case 'text':
                if ($(this).children().size() == 0) {
                    text = $(this).text();
                    title = $(this).attr('title');
                    if (title == undefined)
                        list.append('<li>' + text + '</li>');
                    else
                        list.append('<li>' + text + '<p>' + title + '</p></li>');
                }
                else {
                    title = $(this).attr('title').replace(" ", "_");
                    var html = '<li class="slide activeZero 0" title="' + title + '">';
                    if (title != undefined)
                        html += '<a href="">' + title.replace("_", " ") + '</a>';

                    $(this).children().each(function(index, element) {

                        text = $(this).text();
                        if (element.nodeName == 'entity') {
                            attr = $(this).attr('href');
                            html += '<li class="slide_items ' + title + '"><a class="search" href="' + attr + '" >' + text + '</a></li>';
                        }
                        else if (element.nodeName == 'text') {
                            html += '<li class="slide_items ' + title + '">' + text + '></li>';
                        }
                        else if (element.nodeName == 'email') {
                            attr = $(this).attr('href');
                            html += '<li class="slide_items ' + title + '"><a class="link" href="' + attr + '" >' + text + '</a></li>';
                        }
                        else if (element.nodeName == 'link') {
                            attr = $(this).attr('href');
                            html += '<li class="slide_items ' + title + '"><a class="link" href="' + attr + '" >' + text + '</a></li>';
                        }

                    });
                    html += '</li>';
                    list.append(html);
                }
                break;

            case 'entity':
                text = $(this).text();
                title = $(this).attr('title');
                var attr = $(this).attr('href');
                if (title == undefined)
                    list.append('<li><a class="search" href="' + attr + '">' + text + '</a></li>');
                else
                    list.append('<li><a class="search" href="' + attr + '">' + text + '<p>' + title + '</p></a></li>');
                break;

            case 'email':
                text = $(this).text();
                title = $(this).attr('title');
                if (title == undefined)
                    list.append('<li><a class="email" href="' + attr + '">' + text + '</a></li>');
                else
                    list.append('<li><a class="email" href="' + attr + '">' + text + '<p>' + title + '</p></a></li>');
                break;
            case 'link':
                text = $(this).text();
                attr = $(this).attr('href');
                title = $(this).attr('title');
                if (title == undefined)
                    list.append('<li><a class="link" href="' + attr + '">' + text + '</a></li>');
                else
                    list.append('<li><a class="link" href="' + attr + '">' + text + '<p>' + title + '</p></a></li>');
                break;
            case 'external_link':
                text = $(this).text();
                attr = $(this).attr('href');
                title = $(this).attr('title');
                if (title == undefined)
                    list.append('<li><a class="external_link" target="_blank" href="' + attr + '">' + text + '</a></li>');
                else
                    list.append('<li><a class="external_link" target="_blank" href="' + attr + '">' + text + '<p>' + title + '</p></a></li>');
                break;

        }
    });

    page.page();
    $.mobile.pageContainer.append(page);
    $.mobile.changePage("#" + page.attr("id"));
    $(".slide_items").hide();
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

$('.search').live('click', function(event) {
    event.stopPropagation();
    event.preventDefault();
    getSearch($(this).attr('href'));
    $.mobile.ajaxEnabled(false);
});

$('.link').live('click', function() {
    event.preventDefault();
    event.stopPropagation();
    getRecord($(this).attr('href'));
    $.mobile.ajaxEnabled(false);
});

$('.slide').live('click', function() {
    var t = "." + $(this).attr("title");
    $(t).slideToggle("slow");

});

<!-- Pages scripts-->

$("#tab_bar_search").live('click', function() {


    if ($(".hidden_home_search").css("visibility") == "hidden") {
        $(".hidden_home_search").hide().css({visibility: "visible"}).fadeIn("slow");
    } else {
        $(".hidden_home_search").fadeOut("slow", function() {
            $(this).show().css({visibility: "hidden"});
            $("#tab_bar_search").find("a").removeClass("ui-btn-active");
        });

    }


});

$('#home_searchform').submit(function() {
    $(".hidden_home_search").fadeOut("slow", function() {
        $(this).show().css({visibility: "hidden"});
        $("#tab_bar_search").find("a").removeClass("ui-btn-active");
    });


    return false;
});

$('.activeZero').live("click", function() {
    if ($(this).hasClass("0")) {
        $(this).removeClass("0");
    } else {
        $(this).removeClass("ui-btn-active");
        $(this).addClass("0");

    }

});

function logOut() {

    $.mobile.hashListeningEnabled(false);

}

$('#login').live('click', function() {
    logOut();
});