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
            list.append("<li class='item' href=" + $(this).attr('href') + "> <a href='' >"+ $(this).text() + "<p>" + $(this).attr("title") + "</p></a></li>");
        });

    });

     page.page();
    $.mobile.pageContainer.append(page);
    $.mobile.changePage("#" + page.attr("id"));
}

function createPage(id) {

    var headerbody = "<table><tr><td id='buttonHome' style='padding-left:10px;'><a href='/index'><img alt='home' src='/images/home.png' width='25px' height='25px'> </a> </td><td id='searchBar' data-role='fieldcontain' width='140px' style='padding-left:10px;' ><form id='searchform'><input type='search' name='password' id='search' value=''/></form> </td><td id='login' style='padding-left:10px;'><a href='/login'><img alt='login' src='/images/login.png' height='25px'> </a></td><td id='history' style='padding-left:10px;'><a href='/history'><img alt='history' src='/images/history.png' width='25px' height='25px'> </a></td><td id='settings' style='padding-left:10px;'><a href='/settings'><img alt='settings' src='/images/settings.png' width='25px' height='25px'></a></td></tr></table>"

    var content = $('<div>').attr("data-role", "content");
    var header = $('<div>').attr("data-role", "header").append(headerbody);
    var page = $('<div>').attr("data-role", "page").attr("id", id).attr("data-url", id).append(header).append(content);


    return $(page)
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
    var page = createPage("record"+bla);
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
                        list.append('<li href='+attr+'><a href="" >' + text + '</a></li>');
                    else
                        list.append('<li href='+attr+'>'+ text + '<p>' + title + '</p></li>');
                }
                else {
                    title = $(this).attr('title');
                    var html = "<li class='slide'>";
                    if (title != undefined)
                        html += '<a href="">'+title+'</a>';

                    $(this).children().each(function(index, element) {

                         text = $(this).text();
                        if (element.nodeName == 'entity') {
                            attr = $(this).attr('href');
                            html += '<li class="search slide_items" href='+attr+ '><a href="" >' + text + '</a></li>';
                        }
                        else if (element.nodeName == 'text') {
                            if (title == undefined)
                                html += "<li>" + text + "</li>";
                        }
                        else if (element.nodeName == 'email') {
                            html += '<li class="search slide_items" href='+attr+'><a href="" >' + text + '</a></li>';
                        }
                        else if (element.nodeName == 'link') {
                            attr = $(this).attr('href');
                            html += '<li class="link slide_items" href='+attr+'><a href="" >' + text + '</a></li>';
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
                    list.append('<li class="search" href='+attr+'>' + '<a href="">' + text + '</a></li>');
                else
                    list.append('<li class="search" href='+attr+'>'+ text + '<p>' + title + '</p></li>');
                break;

            case 'email':
                text = $(this).text();
                title = $(this).attr('title');
                if (title == undefined)
                    list.append('<li class="email" href='+attr+'><a href= "">' + text + '</a></li>');
                else
                    list.append('<li class="email" href='+attr+'>'+ text + '<p>' + title + '</p></li>');
                break;
            case 'link':
                text = $(this).text();
                attr = $(this).attr('href');
                html += '<li class="link" href='+attr+'><a href="">' + text + '</a></li>';
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

$('.search').live('click', function() {
    getSearch($(this).attr('href'));
});

$('.link').live('click', function() {
    getRecord($(this).attr('href'));
});

$('.slide').live('click', function() {
  $("this").$('.slide_items').slideToggle('slow');
});