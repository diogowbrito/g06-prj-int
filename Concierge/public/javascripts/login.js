function logOut() {

    $.mobile.hashListeningEnabled(false);

}

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
